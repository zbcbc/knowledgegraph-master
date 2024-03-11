<template>
  <div class="app-container home">
    
    <el-row :gutter="20">
      <el-col :sm="24" :lg="12" style="padding-left: 20px">
        <h2 style="font-weight: bolder; ">Java知识图谱</h2>
        <p>
          Neo4j是一位前辈带我认识的，他也是我正式步入Java实际开发路途的引导者。系统的开发灵感也源于那位前辈，本系统实践探索Neo4j图数据库结整合Java相关技术在Java知识图谱的应用。
        </p>
        <p>
          <b>当前版本:</b> <span>v{{ version }}</span>
        </p>
        <p>
          <el-button
            type="primary"
            size="mini"
            icon="el-icon-cloudy"
            plain
            @click="goTarget('https://gitee.com/liaoquefei/knowledgegraph')"
            >访问码云</el-button>
          <el-button
            type="primary"
            size="mini"
            icon="el-icon-guide"
            plain
            @click="getIndexGraphKey"
            >图谱使用引导</el-button>

        </p>
      </el-col>

      <el-col :sm="24" :lg="12" style="padding-left: 50px">
        <el-row>
          <el-col :span="5">
            <h2>技术选型</h2>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="5">
            <h4>后端技术</h4>
            <ul>
              <li>SpringBoot</li>
              <li>Spring Security</li>
              <li>JWT</li>
              <li>MyBatis</li>
              <li>Druid</li>
              <li>Fastjson</li>
              <li>...</li>
            </ul>
          </el-col>
          <el-col :span="5">
            <h4>前端技术</h4>
            <ul>
              <li>Vue</li>
              <li>Vuex</li>
              <li>Element-ui</li>
              <li>Axios</li>
              <li>Sass</li>
              <li>Quill</li>
              <li>...</li>
            </ul>
          </el-col>
          <el-col :span="4">
            <h4>数据库</h4>
            <ul>
              <li>Neo4j</li>
              <li>MySQL</li>
            </ul>
          </el-col>
        </el-row>
      </el-col>
    </el-row>
    <el-divider />
    <!-- <el-row :gutter="20">
      <el-col :sm="24" :lg="24">
        <el-col :xs="24" :sm="24" :md="12" :lg="4"><div>1</div></el-col>
        <el-col :xs="24" :sm="24" :md="12" :lg="16">
          <el-card class="box-card">
            <div style="height: 600px;"> 
              <graph-model></graph-model>
            </div>
          </el-card>
          
      </el-col>
        
        <el-col :xs="24" :sm="24" :md="12" :lg="4"><div></div></el-col>
      </el-col>
    </el-row>
    <el-divider /> -->
    <el-row :gutter="24">
      <el-col :xs="24" :sm="24" :md="12" :lg="16">

        <el-card style="background-color: rgba(255,255,255,0.9)" class="left-item">
          <div slot="header" class="clearfix">
            

            <div class="clearfix"  style="font-weight: bolder; font-size: 20px">
              <span >全部图谱</span>
              <span   style="float: right; padding: 3px 0" >共 <span style="color: #3a8ee6; font-size: 20px">{{total}}</span> 部</span>
            </div>

            <div class="clearfix">
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
                <el-form-item>
                  <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
                </el-form-item>
              </el-form>
            </div>
            
          </div>

          <el-row type="flex" align="middle" style="flex-wrap: wrap" :gutter="20" v-for="graph in graphList"
                  :key="graph.key"
                  shadow="never" class="animate__animated animate__fadeInUp blog-content">

            <el-col  :xs="24" :sm="5">
              <!-- <el-image lazy :src="graph.graphImgUrl"></el-image> -->
              <image-preview style="border-radius: 5px; box-sizing: border-box;  flex-shrink: 0; width:100%" :src="graph.graphImgUrl" />
            </el-col>

            <el-col :xs="24" :sm="19">
              <div >

                <h3  style="font-weight: bolder; font-size: 18px" >{{graph.graphName}}</h3>
                <p class="description"  style="font-size: 18px" >{{graph.graphRemark}}</p>

                <div class="blog-info">
                  <div class="user-info">
                    <image-preview lazy style="margin-right: 5px;  width: 22px;  height: 22px;" size="small" :src="graph.avatar"></image-preview>
                    <a href="#" class="header">{{graph.createName}}</a>
                  </div>
                  <div class="blog-date">
                    <i class="el-icon-date"></i>
                    <span>{{graph.createTime}}</span>
                  </div>
                  <div>
                    <i class="el-icon-view"></i>
                    <span>{{graph.graphViews}}</span>
                  </div>

                  <div class="blog-type">
                    <el-button-group>
                      <el-button type="primary" icon="el-icon-plus" @click="handleAdd(graph)">申请加入</el-button>
                      <el-button @click="handleGraphIn(graph)" type="primary">进入图谱<i class="el-icon-arrow-right el-icon--right"></i></el-button>
                    </el-button-group>
                    
                  </div>

                </div>

              </div>
            </el-col>
            
          </el-row>
          <pagination
          v-show="total>0"
          :total="total"
          :page.sync="queryParams.pageNum"
          :limit.sync="queryParams.pageSize"
          @pagination="getGraphList"
        />

        </el-card>

        

<!--  -->
        

      

<!--  -->
      </el-col>
      <el-col :xs="24" :sm="24" :md="12" :lg="8">
        <el-card class="update-log">
          <div slot="header" class="clearfix" style="font-weight: bolder; font-size: 18px">
            <span>公告</span>
          </div>
          <div class="block">
            <el-timeline>
              <el-timeline-item v-for="(noticeG,index) in noticeGList" :key="noticeG.key" :timestamp="noticeG.createTime" placement="top">
                <el-card>
                  <el-button  size="medium"  style="float: right;" type="text" icon="el-icon-view" @click="openNodeHtml(noticeG)" ></el-button>
                  <p>{{noticeG.noticeTitle}}</p>
                </el-card>
              </el-timeline-item>

            </el-timeline>
          </div>
        </el-card>

        <el-card class="update-log">
          <div slot="header" class="clearfix" style="font-weight: bolder; font-size: 18px">
            <span>通知</span>
          </div>
          <div class="block">
            <el-timeline>
              <el-timeline-item v-for="(noticeT,index) in noticeTList" :key="noticeT.key" :timestamp="noticeT.createTime" placement="top">
                <el-card>
                  <el-button  size="medium"  style="float: right;" type="text" icon="el-icon-view"  @click="openNodeHtml(noticeT)"  ></el-button>
                  <p>{{noticeT.noticeTitle}}</p>
                </el-card>
              </el-timeline-item>

            </el-timeline>
          </div>
        </el-card>
       
      </el-col>
      <el-col :xs="24" :sm="24" :md="12" :lg="8">

      </el-col>
    </el-row>

    <node-html
    v-if="openNodeIf"
    :title="title"
    :openNode="openNode"
    :graphNodeUrl="graphNodeUrl"
    @closeNodeHtml="closeNodeHtml"
  ></node-html>

    <!-- 添加或修改申请审核对话框 -->
    <el-dialog title="欢迎加入，请填写备注" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="备注" prop="applyRemark">
          <el-input v-model="form.applyRemark" type="textarea" placeholder="请输入内容" />
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
  import GraphModel from "./graph/GraphModel.vue";
  import NodeHtml from "./tool/NodeHtml.vue";
  import { listNotice } from "@/api/system/notice";
  import { listGraphIndex ,findIndexGraphKey} from "@/api/neo4j/graph";
  import { addApply} from "@/api/neo4j/apply";
export default {
  name: "Index",
  components: { GraphModel , NodeHtml },
  data() {
    return {
      // 版本号
      version: "1.0.1",
      showSearch: true,
      title: "",
      graphNodeUrl: "",
      // 是否显示弹出层
      open: false,
      openNode: false,
      openNodeIf: false,
      // 总条数
      total: 0,
      graphList:[],
      noticeGList:[],
      noticeTList:[],
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
        applyRemark: [
                    { required: true, message: "备注不能为空", trigger: "blur" },
                    {min: 2,  max: 30, message: '长度在 2 到 30 个字符',  trigger: 'blur'  },
                   ],
      }

    };
  },
  created() {
    this.getGraphList();
    this.getNoticeGList();
    this.getNoticeTList();

  },
  methods: {
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
        /** 新增按钮操作 */
    handleAdd(graph) {
      this.reset();
      this.form.graphKey = graph.graphKey;
      this.open = true;
      this.title = "添加申请审核";
    },
        /** 提交按钮 */
        submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
            addApply(this.form).then(response => {
              console.log("apply",response)
              this.open = false;
              if(response.data == 1){
                this.$modal.msgSuccess("申请成功");
              }else if(response.data == 2){
                this.$modal.msgSuccess("已在图谱团队中，不能申请");
              }else if(response.data == 3){
                this.$modal.msgSuccess("存在待审核的申请，不能申请");
              }
              
              
            });
        }
      });
    },
    handleGraphIn(row){
      this.$router.push({
            path: "/graph/GraphModel", //path：路由地址
            query: { //query向路由传值
              graphKey: row.graphKey, //传递的参数：可使用 this.$route.query.graphKey 接受传递的参数
            },
        });
    },
    getIndexGraphKey(){
      findIndexGraphKey().then(response => {
        let graphKey = response.msg;
        if(graphKey == null || graphKey == undefined){
          this.$message({ message: "管理员尚未指定引导图谱!", type: 'warning' });
        }else{
          this.$router.push({
            path: "/graph/GraphModel", //path：路由地址
            query: { //query向路由传值
              graphKey: graphKey, //传递的参数：可使用 this.$route.query.graphKey 接受传递的参数
            },
        });
        }

      });
    },
    /** 查询图谱维护列表 */
    getGraphList() {
      this.queryParams.graphType = 1;
      listGraphIndex(this.queryParams).then(response => {
        this.graphList = response.rows;
        this.total = response.total;
        console.log(this.total)
      });
    },
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getGraphList();
    },
    goTarget(href) {
      window.open(href, "_blank");
    },
    /** 查询公告列表 */
    getNoticeGList() {
      let queryParam= {
        pageNum: 1,
        pageSize: 10,
        noticeType: 2,
      };
      listNotice(queryParam).then(response => {
        this.noticeGList = response.rows;
      });
    },
    /** 查询公告列表 */
    getNoticeTList() {
      let queryParam= {
        pageNum: 1,
        pageSize: 10,
        noticeType: 1,
      };
      listNotice(queryParam).then(response => {
        this.noticeTList = response.rows;
      });
    },
    //打开弹窗
    openNodeHtml(data){
        this.graphNodeUrl = data.noticeContent;
        this.title = data.createTime + "-"+ data.noticeTitle ;
        this.openNodeIf = true;
        this.openNode = true;
    },
    //关闭弹窗
    closeNodeHtml(){
        this.openNode = false;
        this.openNodeIf = false;
        // this.getList();
    },

  },
};
</script>

<style scoped lang="scss">
.home {
  blockquote {
    padding: 10px 20px;
    margin: 0 0 20px;
    font-size: 17.5px;
    border-left: 5px solid #eee;
  }
  hr {
    margin-top: 20px;
    margin-bottom: 20px;
    border: 0;
    border-top: 1px solid #eee;
  }
  .col-item {
    margin-bottom: 20px;
  }

  ul {
    padding: 0;
    margin: 0;
  }

  font-family: "open sans", "Helvetica Neue", Helvetica, Arial, sans-serif;
  font-size: 13px;
  color: #676a6c;
  overflow-x: hidden;

  ul {
    list-style-type: none;
  }

  h4 {
    margin-top: 0px;
  }

  h2 {
    margin-top: 10px;
    font-size: 26px;
    font-weight: 100;
  }

  p {
    margin-top: 10px;

    b {
      font-weight: 700;
    }
  }

  .update-log {
    ol {
      
      display: block;
      list-style-type: decimal;
      margin-block-start: 1em;
      margin-block-end: 1em;
      margin-inline-start: 0;
      margin-inline-end: 0;
      padding-inline-start: 40px;
    }
  }

  .blog-content {
    padding: 10px;
    height: auto;
    border-bottom: 1px solid rgb(199, 163, 92);
    /*border-bottom: 1px solid rgba(34, 36, 38, .15);*/
    transition: .3s;


    .el-image {
      border-radius: 5px; box-sizing: border-box;  flex-shrink: 0;
    }

    .blog-info {
      display: flex;
      align-items: center;
      color: rgba(0, 0, 0, .4);
      font-size: 10px;

      .user-info {
        display: flex;
        justify-content: space-around;
        align-items: center;
        margin-right: 15px;


        .header {
          text-decoration: none;
          color: #3a8ee6;
          font-weight: bold;
        }
      }

      .blog-date {
        margin-right: 15px;
      }

      .blog-type {
        margin-left: auto;
      }
    }
  }
}
</style>

