<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="图谱名称" prop="graphName">
        <el-input
          v-model="queryParams.graphName"
          placeholder="请输入图谱名称"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="图谱类型" prop="graphType">
        <el-select v-model="queryParams.graphType" placeholder="请选择图谱类型" clearable size="small">
          <el-option
            v-for="dict in dict.type.graph_type"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
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
          v-hasPermi="['neo4j:graph:add']"
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
          v-hasPermi="['neo4j:graph:edit']"
        >修改</el-button>
      </el-col>
      <!-- <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['neo4j:graph:remove']"
        >删除</el-button>
      </el-col> -->
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['neo4j:graph:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="graphList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="图谱名称" align="center" prop="graphName" />
      <el-table-column label="图谱类型" align="center" prop="graphType">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.graph_type" :value="scope.row.graphType"/>
        </template>
      </el-table-column>
      <el-table-column label="图谱简介" align="center" prop="graphRemark" />
      <el-table-column label="图谱封面" align="center" prop="graphImgUrl" width="100">
        <template slot-scope="scope">
          <image-preview :src="scope.row.graphImgUrl" :width="50" :height="50"/>
        </template>
      </el-table-column>
      <el-table-column label="图维护量" align="center" prop="graphUpdateNumber" />
      <el-table-column label="图浏览量" align="center" prop="graphViews" />
      <el-table-column label="创建时间" align="center" prop="graphTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.graphTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>

      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['neo4j:graph:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            :disabled=" scope.row.createSign == '0' "
            v-hasPermi="['neo4j:graph:remove']"
          >删除</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-star-on"
            @click="handleGraphIn(scope.row)"
          >进入图谱</el-button>
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

    <!-- 添加或修改图谱维护对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="图谱名称" prop="graphName">
          <el-input v-model="form.graphName" placeholder="请输入图谱名称" />
        </el-form-item>
        <el-form-item label="图谱类型" prop="graphType">
          <el-select v-model="form.graphType" placeholder="请选择图谱类型">
            <el-option
              v-for="dict in dict.type.graph_type"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="图谱简介" prop="graphRemark">
          <el-input v-model="form.graphRemark" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="图谱封面">
          <image-upload :limit="imgLimit" v-model="form.graphImgUrl"/>
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
import { getGraphList, getGraph, delGraph, addGraph, updateGraph , checkGraphUniquens } from "@/api/neo4j/graph";

export default {
  name: "Graph",
  dicts: ['graph_type'],
  data() {
    return {
      // 遮罩层
      loading: true,
      imgLimit: 1 ,
      // 选中数组
      ids: [],
      names: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 图谱维护表格数据
      graphList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        graphName: null,
        graphType: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        graphName: [
                    { required: true, message: "图谱名称不能为空", trigger: "blur" },
                    {min: 1,  max: 10, message: '长度在 1 到 10 个字符',  trigger: 'blur'  },
                    {
                    validator: this.graphUniquens,
                    trigger: "blur",
                    },],
                    graphType: [
                    { required: true, message: "图谱类型不能为空", trigger: "blur" },
                   ],
                   graphRemark: [
                    { required: true, message: "图谱简介不能为空", trigger: "blur" },
                    {min: 2,  max: 30, message: '长度在 2 到 30 个字符',  trigger: 'blur'  },
                   ],
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    graphUniquens(rule, value, callback) {
      if (value != null && value != "") {
        checkGraphUniquens({graphName:value,graphKey: this.form.graphKey}).then((response) => {
          if (response.data.length == 0) {
            callback();
          } else {
            callback(new Error("图谱名称已存在"));
          }
        });
      } else {
        callback();
      }
    },

    handleGraphIn(row){
      this.$router.push({
            path: "/graph/GraphModel", //path：路由地址
            query: { //query向路由传值
              graphKey: row.graphKey, //传递的参数：可使用 this.$route.query.graphKey 接受传递的参数
            },
        });
    },
    /** 查询图谱维护列表 */
    getList() {
      this.loading = true;
      getGraphList(this.queryParams).then(response => {
        this.graphList = response.rows;
        // console.log(this.graphList)
        this.total = response.total;
        this.loading = false;
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
        graphKey: null,
        graphName: null,
        graphType: null,
        graphRemark: null,
        graphImgUrl: null,
        graphViews: null,
        graphTime: null,
        graphUpdateNumber: null,
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
      this.ids = selection.map(item => item.graphKey)
      this.names = selection.map(item => item.graphName)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加图谱维护";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const graphKey = row.graphKey || this.ids
      getGraph(graphKey).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改图谱维护";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.graphKey != null) {
            updateGraph(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addGraph(this.form).then(response => {
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
      const graphKeys = row.graphKey || this.ids;
      const graphNames = row.graphName || this.names;
      this.$modal.confirm('是否确认删除图谱名称为"' + graphNames + '"的数据项？注：（图谱删除则相关数据均删除）').then(function() {
        return delGraph(graphKeys);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('neo4j/graph/export', {
        ...this.queryParams
      }, `graph_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
