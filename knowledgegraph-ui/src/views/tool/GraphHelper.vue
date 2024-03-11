<template>
    <div id="app">
      <el-dialog
        @closed="cancelHtml"
        :close-on-click-modal="false"
        :title="title"
        :visible.sync="openNodeIn"
        width="1450px"
        append-to-body
      >

        

            

        <div slot="footer" class="dialog-footer">
          <el-button @click="cancelHtml">关 闭</el-button>
        </div>
      </el-dialog>
    </div>
  </template>
  
  <script>
  
  
  export default {
    props: ["byGraphKey","openNode","closeNodeHtml","title"
    ],
    data() {
      return {
        graphKey:"",
        openNodeIn : false
      };
    },
    created(){
      this.graphKey = this.byGraphKey;
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
  
