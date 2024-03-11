<template>
    <div id="app">
      <el-dialog
        @closed="cancelHtml"
        :close-on-click-modal="false"
        title="节点文档详情"
        :visible.sync="openNodeIn"
        width="1450px"
        append-to-body
      >

            <p v-html="htmlTxt" ></p>

            

        <div slot="footer" class="dialog-footer">
          <el-button @click="cancelHtml">取 消</el-button>
        </div>
      </el-dialog>
    </div>
  </template>
  
  <script>
  
  
  export default {
    props: ["graphNodeUrl","openNode","closeNodeHtml"
    ],
    data() {
      return {
          htmlTxt:"",
          openNodeIn : false
      };
    },
    created(){
      this.htmlTxt = this.graphNodeUrl;
      this.openNodeIn = this.openNode;
    },
    methods: {
        cancelHtml() {
          this.openNodeIn = false;
        this.$emit("closeNodeHtml", false);
      },
    },
  };
  </script>
  
