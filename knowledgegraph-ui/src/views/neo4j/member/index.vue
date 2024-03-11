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
      
      <el-form-item label="成员名称" prop="userName">
        <el-input
          v-model="queryParams.userName"
          placeholder="请输入成员名称"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>

      <el-form-item label="成员类型" prop="graphMemberType">
        <el-select v-model="queryParams.graphMemberType" placeholder="请选择成员类型" clearable size="small">
          <el-option
            v-for="dict in dict.type.graph_member_type"
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
          v-hasPermi="['neo4j:member:add']"
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
          v-hasPermi="['neo4j:member:edit']"
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
          v-hasPermi="['neo4j:member:remove']"
        >移出</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['neo4j:member:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="memberList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <!-- <el-table-column label="用户主键" align="center" prop="userKey" />
      <el-table-column label="图主键" align="center" prop="graphKey" /> -->
      <el-table-column label="所属图谱" align="center" prop="graphName" />
      <el-table-column label="成员名称" align="center" prop="userName" />
      <el-table-column label="成员类型" align="center" prop="graphMemberType">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.graph_member_type" :value="scope.row.graphMemberType"/>
        </template>
      </el-table-column>
      <el-table-column label="加入时间" align="center" prop="joinTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.joinTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="贡献值" align="center" prop="contributionValue" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <!-- <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['neo4j:member:edit']"
          >修改</el-button> -->
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            :disabled=" scope.row.graphMemberType == 0 "
            v-hasPermi="['neo4j:member:remove']"
          >移出</el-button>
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

    <!-- 添加或修改图谱成员维护对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px" >
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listMember, getMember, delMember, addMember, updateMember } from "@/api/neo4j/member";
import { getListGraph } from "@/api/neo4j/graph";
export default {
  name: "Member",
  dicts: ['graph_member_type'],
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      graphs: [],
      names: [],
      types: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 图谱成员维护表格数据
      memberList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        userKey: null,
        graphKey: null,
        graphMemberType: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
      }
    };
  },
  created() {
    this.getList();
    this.getListGraph();
  },
  methods: {
    /** 查询图谱成员维护列表 */
    getList() {
      this.loading = true;
      listMember(this.queryParams).then(response => {
        this.memberList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    getListGraph() {
      let queryData = {};
      getListGraph(this.queryData).then(response => {
        this.graphs = response.data;
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
        graphMemberKey: null,
        userKey: null,
        graphKey: null,
        contributionValue: null,
        joinTime: null,
        graphMemberType: null,
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
      this.ids = selection.map(item => item.graphMemberKey)
      this.names = selection.map(item => item.userName)
      this.types = selection.map(item => item.graphMemberType)

      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加图谱成员维护";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const graphMemberKey = row.graphMemberKey || this.ids
      getMember(graphMemberKey).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改图谱成员维护";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.graphMemberKey != null) {
            updateMember(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addMember(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 移出按钮操作 */
    handleDelete(row) {
      const graphMemberKeys = row.graphMemberKey || this.ids;
      const userNames = row.userName || this.names;
      const graphMemberTypes = row.graphMemberType || this.types;
      let num = 0;
      for(let graphMemberType of graphMemberTypes){
          if(graphMemberType == 0){
            num++;
            break;
          }
      }
      if(num > 0){
        this.$message({ message: "图谱创建者不可移出团队!", type: 'warning' });
      }else{
          this.$modal.confirm('是否确认移出图谱成员名称为"' + userNames + '"的数据项？').then(function() {
          return delMember(graphMemberKeys);
        }).then(() => {
          this.getList();
          this.$modal.msgSuccess("移出成功");
        }).catch(() => {});
      }
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('neo4j/member/export', {
        ...this.queryParams
      }, `member_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
