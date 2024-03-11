<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="申请图" prop="graphName">
        <el-input
          v-model="queryParams.graphName"
          placeholder="请输入申请图"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="审核状态" prop="applySign">
        <el-select v-model="queryParams.applySign" placeholder="请选择审核状态" clearable size="small">
          <el-option
            v-for="dict in dict.type.apply_sign"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="审核结果" prop="applyFlag">
        <el-select v-model="queryParams.applyFlag" placeholder="请选择审核结果" clearable size="small">
          <el-option
            v-for="dict in dict.type.apply_flag"
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
      <!-- <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['neo4j:apply:add']"
        >新增</el-button>
      </el-col> -->
      <!-- <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['neo4j:apply:edit']"
        >修改</el-button>
      </el-col> -->
      <!-- <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['neo4j:apply:remove']"
        >删除</el-button>
      </el-col> -->
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['neo4j:apply:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="applyList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <!-- <el-table-column label="申请人" align="center" prop="applyUser" />
      <el-table-column label="申请图" align="center" prop="graphKey" /> -->
      <!-- <el-table-column label="申请人" align="center" prop="applyUserName" /> -->
      <el-table-column label="申请图" align="center" prop="graphName" />
      <el-table-column label="申请时间" align="center" prop="applyTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.applyTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="申请备注" align="center" prop="applyRemark" />
      <el-table-column label="审核状态" align="center" prop="applySign">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.apply_sign" :value="scope.row.applySign"/>
        </template>
      </el-table-column>
      <el-table-column label="审核结果" align="center" prop="applyFlag">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.apply_flag" :value="scope.row.applyFlag"/>
        </template>
      </el-table-column>
      <el-table-column label="审核时间" align="center" prop="examineTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.examineTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="审核意见" align="center" prop="examineRemark" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <!-- <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            :disabled=" scope.row.applySign == 1 "
            v-hasPermi="['neo4j:apply:edit']"
          >审核</el-button> -->
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['neo4j:apply:remove']"
            :disabled=" scope.row.applySign == 1 "
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

    <!-- 添加或修改申请审核对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="申请备注" prop="applyRemark">
          <el-input v-model="form.applyRemark" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="审核结果" prop="applyFlag">
          <el-select v-model="form.applyFlag" placeholder="请选择审核结果">
            <el-option
              v-for="dict in dict.type.apply_flag"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="审核意见" prop="examineRemark">
          <el-input v-model="form.examineRemark" type="textarea" placeholder="请输入审核意见" />
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
import { listApply, listMyApply, getApply, delApply, addApply, updateApply } from "@/api/neo4j/apply";

export default {
  name: "Apply",
  dicts: ['apply_flag', 'apply_sign'],
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
      // 申请审核表格数据
      applyList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        graphKey: null,
        graphName: null,
        applySign: null,
        applyFlag: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        applyRemark: [
                    { required: true, message: "备注不能为空", trigger: "blur" },
                    {min: 2,  max: 30, message: '长度在 2 到 30 个字符',  trigger: 'blur'  },
                   ],
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询申请审核列表 */
    getList() {
      this.loading = true;
      listMyApply(this.queryParams).then(response => {
        this.applyList = response.rows;
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
        applyKey: null,
        applyUser: null,
        graphKey: null,
        applyTime: null,
        applyRemark: null,
        applySign: null,
        applyFlag: null,
        examineTime: null,
        examineRemark: null,
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
      this.ids = selection.map(item => item.applyKey)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加申请审核";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const applyKey = row.applyKey || this.ids
      getApply(applyKey).then(response => {
        this.form = response.data;
        this.form.applySign = "1";
        this.open = true;
        this.title = "修改申请审核";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.applyKey != null) {
            updateApply(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addApply(this.form).then(response => {
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
      const applyKeys = row.applyKey || this.ids;
      this.$modal.confirm('是否确认删除申请审核编号为"' + applyKeys + '"的数据项？').then(function() {
        return delApply(applyKeys);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('neo4j/apply/exportMy', {
        ...this.queryParams
      }, `apply_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
