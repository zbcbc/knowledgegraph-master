<template>
  <div class="app-container home">
    
    <el-row :gutter="20">
      <!-- <el-col :sm="24" :lg="12" style="padding-left: 20px">
        <h2 style="font-weight: bolder; ">Java知识图谱</h2>
        <p>
          Neo4j是一位前辈带我认识的，他也是我正式步入Java实际开发路途的引导者。系统的开发灵感也源于那位前辈，本系统实践探索Neo4j图数据库在Java知识体系学习的应用（本系统整合开源项目若依-vue，很棒的项目，推荐大家了解一下-gitee搜若依）。
        </p>
        <p>
          <b>当前版本:</b> <span>v{{ version }}</span>
        </p>
      </el-col> -->

      <el-col :sm="24" :lg="24" style="padding-left: 20px">
        <el-card style="background-color: rgba(255,255,255,0.9)" class="left-item">
            <div slot="header" class="clearfix">
                <h2 style="font-weight: bolder; ">{{nodeData.graphNodeName}}</h2>
                <p>
                  {{nodeData.graphNodeRemark}}
                </p>
                <el-divider />
              <div class="clearfix"  style="font-weight: bolder; font-size: 20px">
                <span >全部节点链接</span>
                <span   style="float: right; padding: 3px 0" >共 <span style="color: #3a8ee6; font-size: 20px">{{total}}</span> 个</span>
              </div>
  
              <div class="clearfix">
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
                  </el-form-item>
                </el-form>
              </div>
              
            </div>

            <el-table height="250" v-loading="loading" :data="videoList">
                <el-table-column label="资源简介" align="center" prop="graphNodeVideoRemark" />
                <el-table-column label="创建者" align="center" prop="createName" />
                <el-table-column label="创建时间" align="center" prop="createTime" />
                <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
                  <template slot-scope="scope">
                    <el-button
                      size="medium"
                      type="text"
                      icon="el-icon-view"
                      @click="openNodeLink(scope.row.graphNodeVideoUrl)"
                    >跳转链接</el-button>
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
          </el-card>
  
         

      </el-col>
    </el-row>
    <el-divider />
    <el-row :gutter="24">
      <el-col :xs="24" :sm="24" :md="12" :lg="24">
        <h2 style="font-weight: bolder; ">节点详情</h2>
        <p v-html="nodeData.graphNodeUrl" ></p>

      </el-col>
      
    </el-row>

    <node-html
    v-if="openNodeIf"
    :title="title"
    :openNode="openNode"
    :graphNodeUrl="graphNodeUrl"
    @closeNodeHtml="closeNodeHtml"
  ></node-html>

  </div>
</template>

<script>
    import { listVideo, getVideo, delVideo, addVideo, updateVideo } from "@/api/neo4j/video";
  import NodeHtml from "../tool/NodeHtml.vue";
  import {  getNode } from "@/api/neo4j/node";
  import { listNotice } from "@/api/system/notice";
  import { listGraphIndex } from "@/api/neo4j/graph";
export default {
  name: "Index",
  components: {   NodeHtml },
  data() {
    return {
      // 版本号
      version: "1.0.1",
      showSearch: true,
      title: "",
      graphNodeUrl: "",
      graphNodeKey: "",
      // 是否显示弹出层
      openNode: false,
      openNodeIf: false,
      // 总条数
      total: 0,
      nodeData:{},
      graphList:[],
      videoList: [],
      noticeGList:[],
      noticeTList:[],
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        graphName: null,
        graphType: null,
      },
    };
  },
  created() {
    this.graphNodeKey = this.$route.query.graphNodeKey;
    this.getGraphNodeDetails();
    this.getList();


  },
  methods: {
    openNodeLink(linkHref){
      window.open(linkHref, '_blank');
    },
    getList() {
      this.loading = true;
      this.queryParams.graphNodeKey = this.graphNodeKey;
      listVideo(this.queryParams).then(response => {
        this.videoList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },

    getGraphNodeDetails() {
        getNode(this.graphNodeKey).then(response => {
        this.nodeData = response.data;
        console.log(this.nodeData)
      });
    },
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
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

