<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" :inline="true" v-show="showSearch" label-width="90px">
      <el-row>
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
      <el-form-item label="始节点ID" prop="graphRelationshipFrom">
        <el-input
          v-model="queryParams.graphRelationshipFrom"
          placeholder="请输入始节点ID"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="始节点名称" prop="graphRelationshipFromName" >
        <el-input
          v-model="queryParams.graphRelationshipFromName"
          placeholder="请输入始节点名称"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
    </el-row>
    <el-row>
      <el-form-item label="关系名称" prop="graphRelationshipName">
        <el-input
          v-model="queryParams.graphRelationshipName"
          placeholder="请输入关系名称"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>

      <el-form-item label="终节点ID" prop="graphRelationshipTo">
        <el-input
          v-model="queryParams.graphRelationshipTo"
          placeholder="请输入终节点ID"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="终节点名称" prop="graphRelationshipToName">
        <el-input
          v-model="queryParams.graphRelationshipToName"
          placeholder="请输入终节点名称"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-row>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['neo4j:relationship:add']"
        >新增</el-button>
      </el-col>
      <!-- <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['neo4j:relationship:edit']"
        >修改</el-button>
      </el-col> -->
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['neo4j:relationship:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['neo4j:relationship:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="relationshipList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="关系ID" align="center" prop="graphRelationshipId" />
      <!-- <el-table-column label="图主键" align="center" prop="graphKey" /> -->
      <el-table-column label="关系名称" align="center" prop="graphRelationshipName" />
      <el-table-column label="始节点ID" align="center" prop="graphRelationshipFrom" />
      <el-table-column label="始节点名称" align="center" prop="graphRelationshipFromName" />
      <el-table-column label="终节点ID" align="center" prop="graphRelationshipTo" />
      <el-table-column label="终节点名称" align="center" prop="graphRelationshipToName" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <!-- <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['neo4j:relationship:edit']"
          >修改</el-button> -->
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['neo4j:relationship:remove']"
          >删除</el-button>
        </template>
      </el-table-column>
    </el-table>
    
    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNumNeo4j"
      :limit.sync="queryParams.pageSizeNeo4j"
      @pagination="getList"
    />

    <!-- 添加或修改关系维护对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="90px">
        <el-form-item label="所属图谱" prop="graphKey">
          <el-select v-model="form.graphKey" placeholder="请选择所属图谱" @change="getlistNodeByGraphKey" clearable size="small">
            <el-option
              v-for="dict in graphs"
              :key="dict.graphKey"
              :label="dict.graphName"
              :value="dict.graphKey"
            />
          </el-select>
        </el-form-item>
        
        <!-- <el-form-item label="始节点ID" prop="graphRelationshipFrom">
          <el-input v-model="form.graphRelationshipFrom" placeholder="请输入始节点ID" />
        </el-form-item> -->
        <el-form-item label="始节点" prop="graphRelationshipFrom">
          <!-- <el-input v-model="form.graphRelationshipFromName" placeholder="请输入始节点名称" /> -->
          <el-select v-model="form.graphRelationshipFrom" placeholder="请选择始节点" clearable size="small">
            <el-option
              v-for="dict in nodes"
              :key="dict.graphNodeId"
              :label="dict.graphNodeName"
              :value="dict.graphNodeId"
            />
          </el-select>
        </el-form-item>
        <!-- <el-form-item label="终节点ID" prop="graphRelationshipTo">
          <el-input v-model="form.graphRelationshipTo" placeholder="请输入终节点ID" />
        </el-form-item> -->
        <el-form-item label="终节点" prop="graphRelationshipTo">
          <!-- <el-input v-model="form.graphRelationshipToName" placeholder="请输入终节点名称" /> -->
          <el-select v-model="form.graphRelationshipTo" placeholder="请选择终节点" clearable size="small">
            <el-option
              v-for="dict in nodes"
              :key="dict.graphNodeId"
              :label="dict.graphNodeName"
              :value="dict.graphNodeId"
            />
          </el-select>
        </el-form-item>

        <el-form-item label="关系名称" prop="graphRelationshipName">
          <el-input v-model="form.graphRelationshipName" placeholder="请输入关系名称" />
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
import { listRelationship, getRelationship, delRelationship, addRelationship, updateRelationship } from "@/api/neo4j/relationship";
import { getListGraphByMember } from "@/api/neo4j/graph";
import { listNodeByGraphKey } from "@/api/neo4j/node";
export default {
  name: "Relationship",
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      graphs: [],
      nodes: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 关系维护表格数据
      relationshipList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNumNeo4j: 1,
        pageSizeNeo4j: 10,
        graphKey: null,
        graphRelationshipName: null,
        graphRelationshipFrom: null,
        graphRelationshipFromName: null,
        graphRelationshipTo: null,
        graphRelationshipToName: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        graphKey: [
                    { required: true, message: "所属图谱不能为空", trigger: "blur" },
                   ],
                   graphRelationshipFrom: [
                    { required: true, message: "始节点不能为空", trigger: "blur" },
                   ],
                   graphRelationshipTo: [
                    { required: true, message: "终节点不能为空", trigger: "blur" },
                   ],
                   graphRelationshipName: [
                    { required: true, message: "关系名称不能为空", trigger: "blur" },
                    {min: 1,  max: 10, message: '长度在 1 到 10 个字符',  trigger: 'blur'  },
                   ],
      }
    };
  },
  created() {
    this.getListGraphByMember();
  },
  methods: {
    getlistNodeByGraphKey(graphKey){
      let queryNode = {graphKey:graphKey};
      this.form.graphRelationshipFrom = null;
      this.form.graphRelationshipTo = null;
      listNodeByGraphKey(queryNode).then(response =>{
          this.nodes = response.data;
          console.log(this.nodes );
      })
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
    /** 查询关系维护列表 */
    getList() {
      this.loading = true;
      if(this.queryParams.graphKey != undefined && this.queryParams.graphKey != null &&this.queryParams.graphKey != ""){
          listRelationship(this.queryParams).then(response => {
            console.log(response)
          this.relationshipList = response.data.rows;
          this.total = response.data.total;
          this.loading = false;
        });
      }else{
        this.loading = false;
        this.$message({ message: "请选择一个图谱!", type: 'warning' });
      }
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        graphRelationshipId: null,
        graphKey: null,
        graphRelationshipName: null,
        graphRelationshipFrom: null,
        graphRelationshipFromName: null,
        graphRelationshipTo: null,
        graphRelationshipToName: null
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNumNeo4j = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.graphRelationshipId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加关系维护";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const graphRelationshipId = row.graphRelationshipId || this.ids
      getRelationship(graphRelationshipId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改关系维护";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.graphRelationshipId != null) {
            updateRelationship(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addRelationship(this.form).then(response => {
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
      const graphRelationshipIds = row.graphRelationshipId || this.ids;
      this.$modal.confirm('是否确认删除关系维护编号为"' + graphRelationshipIds + '"的数据项？').then(function() {
        return delRelationship(graphRelationshipIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('neo4j/relationship/export', {
        ...this.queryParams
      }, `relationship_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
