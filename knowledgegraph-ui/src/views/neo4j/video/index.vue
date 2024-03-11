<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="资源简介" prop="graphNodeVideoRemark">
        <el-input
          v-model="queryParams.graphNodeVideoRemark"
          placeholder="请输入资源简介"
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
          v-hasPermi="['neo4j:video:add']"
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
          v-hasPermi="['neo4j:video:edit']"
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
          v-hasPermi="['neo4j:video:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['neo4j:video:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="videoList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="资源简介" align="center" prop="graphNodeVideoRemark" />
      <el-table-column label="资源链接" align="center" prop="graphNodeVideoUrl" >
        <template slot-scope="scope">
          <el-button
            size="medium"
            type="text"
            icon="el-icon-view"
            @click="openNodeLink(scope.row.graphNodeVideoUrl)"
          ></el-button>
        </template>
      </el-table-column>
      <el-table-column label="创建者" align="center" prop="createName" />
      <el-table-column label="创建时间" align="center" prop="createTime" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['neo4j:video:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['neo4j:video:remove']"
          >删除</el-button>
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

    <!-- 添加或修改节点资源资源对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <!-- <el-form-item label="节点主键" prop="graphNodeKey">
          <el-input v-model="form.graphNodeKey" placeholder="请输入节点主键" />
        </el-form-item> -->
        <el-form-item label="资源简介" prop="graphNodeVideoRemark">
          <el-input v-model="form.graphNodeVideoRemark" type="textarea" placeholder="请输入资源简介" />
        </el-form-item>
        <el-form-item label="资源链接" prop="graphNodeVideoUrl">
          <el-input v-model="form.graphNodeVideoUrl" type="textarea" placeholder="请输入资源链接" />
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
import { listVideo, getVideo, delVideo, addVideo, updateVideo } from "@/api/neo4j/video";

export default {
  name: "Video",
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 节点资源资源表格数据
      videoList: [],
      // 弹出层标题
      title: "",
      graphNodeKey: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        graphNodeVideoRemark: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        graphNodeVideoUrl: [
                    { required: true, message: "资源链接不能为空", trigger: "blur" },
                   ],
                   graphNodeVideoRemark: [
                    { required: true, message: "资源简介不能为空", trigger: "blur" },
                    {min: 2,  max: 30, message: '长度在 1 到 10 个字符',  trigger: 'blur'  },
                   ],
      }
    };
  },
  created() {
    this.graphNodeKey = this.$route.query.graphNodeKey;
    this.getList();
  },
  methods: {
    openNodeLink(linkHref){
      window.open(linkHref, '_blank');
    },
    /** 查询节点资源资源列表 */
    getList() {
      this.loading = true;
      this.queryParams.graphNodeKey = this.graphNodeKey;
      listVideo(this.queryParams).then(response => {
        this.videoList = response.rows;
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
        graphNodeVideoKey: null,
        graphNodeKey: null,
        graphNodeVideoRemark: null,
        graphNodeVideoUrl: null,
        createBy: null,
        createTime: null,
        updateBy: null,
        upadteTime: null
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
      this.ids = selection.map(item => item.graphNodeVideoKey)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.form.graphNodeKey=this.graphNodeKey;
      this.open = true;
      this.title = "添加节点资源资源";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const graphNodeVideoKey = row.graphNodeVideoKey || this.ids
      getVideo(graphNodeVideoKey).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改节点资源资源";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.graphNodeVideoKey != null) {
            updateVideo(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addVideo(this.form).then(response => {
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
      const graphNodeVideoKeys = row.graphNodeVideoKey || this.ids;
      this.$modal.confirm('是否确认删除节点资源资源编号为"' + graphNodeVideoKeys + '"的数据项？').then(function() {
        return delVideo(graphNodeVideoKeys);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('neo4j/video/export', {
        ...this.queryParams
      }, `video_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
