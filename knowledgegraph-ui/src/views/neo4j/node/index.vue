<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="所属图谱" prop="graphKey">
        <el-select v-model="queryParams.graphKey" placeholder="请选择所属图谱" clearable size="small">
          <el-option
            v-for="dict in graphs"
            :key="dict.graphKey"
            :label="dict.graphName"
            :value="dict.graphKey"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="节点ID" prop="graphNodeId">
        <el-input
          v-model="queryParams.graphNodeId"
          placeholder="请输入节点ID"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="节点名称" prop="graphNodeName">
        <el-input
          v-model="queryParams.graphNodeName"
          placeholder="请输入节点名称"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['neo4j:node:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['neo4j:node:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['neo4j:node:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['neo4j:node:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="nodeList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <!-- <el-table-column label="图节点主键" align="center" prop="graphNodeKey" /> -->
      <!-- <el-table-column label="图谱主键" align="center" prop="graphKey" /> -->
      <el-table-column label="创建时间" align="center" prop="graphNodeTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.graphNodeTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="所属图谱" align="center" prop="graphName" />
      <el-table-column label="节点ID" align="center" prop="graphNodeId" />
      <el-table-column label="节点名称" align="center" prop="graphNodeName" />
      <!-- <el-table-column label="节点图标" align="center" prop="graphNodeMyicon" /> -->
      <el-table-column label="维护数" align="center" prop="graphNodeUpdate" />
      <el-table-column label="节点简介" align="center" prop="graphNodeRemark" />
      <el-table-column label="节点文档" align="center" prop="graphNodeUrl" >
        <template slot-scope="scope">
          <el-button
            size="medium"
            type="text"
            icon="el-icon-view"
            @click="openNodeHtml(scope.row.graphNodeUrl)"
          ></el-button>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['neo4j:node:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['neo4j:node:remove']"
          >删除</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-film"
            @click="handlevideo(scope.row)"
          >视频资源管理</el-button>
        </template>
      </el-table-column>
    </el-table>
    
    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <node-html
    v-if="openNodeIf"
    :openNode="openNode"
    :graphNodeUrl="graphNodeUrl"
    @closeNodeHtml="closeNodeHtml"
  ></node-html>

    <!-- 添加或修改节点维护对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="1350px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="所属图谱" prop="graphKey">
          <el-select v-model="form.graphKey" placeholder="请选择所属图谱" :disabled ="disabled">
            <el-option
              v-for="dict in graphs"
              :key="dict.graphKey"
              :label="dict.graphName"
              :value="dict.graphKey"
            ></el-option>
          </el-select>
        </el-form-item>
        <!-- <el-form-item label="节点ID" prop="graphNodeId">
          <el-input v-model="form.graphNodeId" placeholder="请输入节点名称" />
        </el-form-item> -->
        <el-form-item label="节点名称" prop="graphNodeName">
          <el-input v-model="form.graphNodeName" placeholder="请输入节点名称"  />
        </el-form-item>
        <!-- <el-form-item label="节点图标" prop="graphNodeMyicon">
          <el-popover
            placement="bottom-start"
            width="460"
            trigger="click"
            @show="$refs['iconSelect'].reset()"
          >
            <IconSelect ref="iconSelect" @selected="selected" />
            <el-input slot="reference" v-model="form.graphNodeMyicon" placeholder="点击选择图标" readonly>
              <svg-icon
                v-if="form.graphNodeMyicon"
                slot="prefix"
                :icon-class="form.graphNodeMyicon"
                class="el-input__icon"
                style="height: 32px;width: 16px;"
              />
              <i v-else slot="prefix" class="el-icon-search el-input__icon" />
            </el-input>
          </el-popover>
        </el-form-item> -->
        <el-form-item label="节点简介" prop="graphNodeRemark">
          <el-input v-model="form.graphNodeRemark" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="节点文档">
          <editor v-model="form.graphNodeUrl" :min-height="192"/>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listNode, getNode, delNode, addNode, updateNode } from "@/api/neo4j/node";
import { getListGraphByMember } from "@/api/neo4j/graph";
import IconSelect from "@/components/IconSelect";
import NodeHtml from "./NodeHtml.vue";
export default {
  name: "Node",
  components: { IconSelect ,NodeHtml },
  data() {
    return {
      // 遮罩层
      loading: true,
      disabled: false,
      // 选中数组
      ids: [],
      nodeIds: [],
      graphs: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 节点维护表格数据
      nodeList: [],
      // 弹出层标题
      title: "",
      graphNodeUrl: "",
      // 是否显示弹出层
      open: false,
      openNode: false,
      openNodeIf: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        graphKey: null,
        graphNodeId: null,
        graphNodeName: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        graphKey: [
                    { required: true, message: "所属图谱不能为空", trigger: "blur" },
                   ],
                   graphNodeName: [
                    { required: true, message: "节点名称不能为空", trigger: "blur" },
                    {min: 1,  max: 10, message: '长度在 1 到 10 个字符',  trigger: 'blur'  },
                   ],
                   graphNodeRemark: [
                    { required: true, message: "节点简介不能为空", trigger: "blur" },
                    {min: 2,  max: 30, message: '长度在 1 到 10 个字符',  trigger: 'blur'  },
                   ],
      }
    };
  },
  created() {
    this.getListGraphByMember();
  },
  methods: {
    handlevideo(row){
      this.$router.push({
            path: "/neo4j/video", //path：路由地址
            query: { //query向路由传值
              graphNodeKey: row.graphNodeKey, //传递的参数：可使用 this.$route.query.graphNodeKey 接受传递的参数
            },
        });
    },
    openNodeHtml(graphNodeHtml){
        this.graphNodeUrl = graphNodeHtml;
        this.openNodeIf = true;
        this.openNode = true;
    },
    closeNodeHtml(){
        this.openNode = false;
        this.openNodeIf = false;
        // this.getList();
    },

    selected(name) {
      console.log(name);
      this.form.graphNodeMyicon = name;
    },
    /** 查询节点维护列表 */
    getList() {
      this.loading = true;
      if(this.queryParams.graphKey != undefined && this.queryParams.graphKey != null &&this.queryParams.graphKey != ""){
        listNode(this.queryParams).then(response => {
          this.nodeList = response.rows;
          this.total = response.total;
          this.loading = false;
        });
      }else{
        this.loading = false;
        this.$message({ message: "请选择一个图谱!", type: 'warning' });
      }
    },
    getListGraphByMember() {
      let queryData = {};
      getListGraphByMember(this.queryData).then(response => {
        if( response.data.length > 0){
          let graph = response.data[0];
          this.queryParams.graphKey = graph.graphKey;
          this.graphs = response.data;
            this.getList();
        }else{
          this.loading = false;
          this.graphs = response.data;
        }
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        graphNodeKey: null,
        graphKey: null,
        graphNodeId: null,
        graphNodeName: null,
        graphNodeMyicon: null,
        graphNodeRemark: null,
        graphNodeUpdate: null,
        graphNodeUrl: null,
        graphNodeTime: null,
        createBy: null,
        createTime: null,
        updateBy: null,
        updateTime: null,
        deleteFlag: null
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.graphNodeKey)
      this.nodeIds = selection.map(item => item.graphNodeId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.disabled = false ;
      this.open = true;
      this.title = "添加节点维护";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      this.disabled = true ;
      const graphNodeKey = row.graphNodeKey || this.ids
      getNode(graphNodeKey).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改节点维护";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.graphNodeKey != null) {
            updateNode(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addNode(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const graphNodeKeys = row.graphNodeKey || this.ids;
      const graphNodeIds = row.graphNodeId || this.nodeIds;
        let nodeList = new Array();
        if(row == null || row == undefined){
            for(let i in this.ids){
            nodeList.push({graphNodeKey:this.ids[i],graphNodeId:this.nodeIds[i]});
          }
        }else{
          nodeList.push({graphNodeKey:row.graphNodeKey,graphNodeId:row.graphNodeId});
        }
      this.$modal.confirm('是否确认删除节点ID为"' + graphNodeIds + '"的数据项？').then(function() {
        
        console.log(nodeList)
        return delNode(nodeList);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('neo4j/node/export', {
        ...this.queryParams
      }, `node_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
