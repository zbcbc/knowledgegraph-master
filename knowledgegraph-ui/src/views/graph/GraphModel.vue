<template>
  <div class="app-container home">
    <div ref="myPage" style="height: calc(100vh - 50px);">
      <h2 style="font-weight: bolder; ">{{graphTxt}}</h2>
      <el-divider />
      <SeeksRelationGraph
        ref="seeksRelationGraph"
        :options="graphOptions"
        :on-node-click="onNodeClick"
        :on-line-click="onLineClick"
        >

        <div slot="node" slot-scope="{node}" @contextmenu.prevent="contextmenuPrevent(node)">
          <div style="height:64px;line-height: 64px;border-radius: 32px;cursor:  pointer; ">
            <i style="font-size: 30px;" class="el-icon-star-on"  @mouseover="showNodeTips(node, $event)" @mouseout="hideNodeTips(node, $event)" />
          </div>
          <div style="color: forestgreen;font-size: 16px;position: absolute;width: 160px;height:25px;line-height: 25px;margin-top:5px;margin-left:-48px;text-align: center;background-color: rgba(66,187,66,0.2);">
            {{ node.text }}
          </div>
        </div>
      </SeeksRelationGraph>

    </div>
    <div v-if="isShowNodeTipsPanel" :style="{left: nodeMenuPanelPosition.x + 'px', top: nodeMenuPanelPosition.y + 'px' }" style="z-index: 999;padding:10px;background-color: #ffffff;border:#eeeeee solid 1px;box-shadow: 0px 0px 8px #cccccc;position: absolute;">
      <div style="line-height: 25px;padding-left: 10px;color: #888888;font-size: 12px;">节点名称：{{currentNode.text}}</div>
      <div class="c-node-menu-item">节点简介:{{currentNode.data.graphNodeRemark}}</div>
    </div>
  </div>
</template>

<script>
  import SeeksRelationGraph from 'relation-graph';
  import {getGraphJsonDataTest ,getNeo4jGraphJson} from "@/api/neo4j/test";
export default {
  name: "Index",
  components: { SeeksRelationGraph },
  data() {
    return {
      // 版本号
      version: "3.8.1",
      isShowCodePanel: false,
      isShowNodeTipsPanel: false,
      nodeMenuPanelPosition: { x: 0, y: 0 },
      graphTxt: "",
      graphKey: "",
      currentNode: {},
      graphOptions: {
        // defaultNodeBorderWidth: 0,
        // defaultNodeColor: 'rgba(238, 178, 94, 1)',
        allowSwitchLineShape: true,
        // defaultLineShape: 1,
        allowSwitchJunctionPoint: true,
        defaultJunctionPoint: 'border',
        'layouts': [
          {
            'label': '中心',
            'layoutName': 'center',
            'layoutClassName': 'seeks-layout-center'
          }
        ]

        // 这里可以参考"Graph 图谱"中的参数进行设置
      }
    };
  },
  mounted() {
    this.graphKey = this.$route.query.graphKey;
    this.showSeeksGraph(this.graphKey )
  },
  watch: {
			// 路由变化就是刷新数据，为了解决子级跳转到这个页面，数据不刷新问题
			'$route': {
				handler() {
					if (this.$route.query.graphKey) {
						this.graphKey = this.$route.query.graphKey;
            this.showSeeksGraph(this.graphKey )
					}
				},
				immediate: true
			}
		},
  methods: {
    goTarget(href) {
      window.open(href, "_blank");
    },
    
    showSeeksGraph(query) {
      getNeo4jGraphJson(query).then(response => {
        this.graphTxt=response.data.graphTxt  ;
        let __graph_json_data  = response.data;

      //        let __graph_json_data = {
      //           graphTxt:"使用教程",
      //   nodes: [
      //     { id: '1',  name: '节点-1'  ,data:{remark:'备注内容'}  },
      //     { id: '2',  name: '节点-2'  ,data:{remark:'备注内容'}  },
      //     { id: '3',  name: '节点-3'  ,data:{remark:'备注内容'}  },
      //     { id: '4',  name: '节点-4'  ,data:{remark:'备注内容'}  },
      //     { id: '6',  name: '节点-6'  ,data:{remark:'备注内容'}  },
      //     { id: '7',  name: '节点-7'  ,data:{remark:'备注内容'}  },
      //     { id: '8',  name: '节点-8'  ,data:{remark:'备注内容'}  },
      //     { id: '9',  name: '节点-9'  ,data:{remark:'备注内容'}  },
      //     { id: '71', name: '节点-71' ,data:{remark:'备注内容'} },
      //     { id: '72', name: '节点-72' ,data:{remark:'备注内容'} },
      //     { id: '73', name: '节点-73' ,data:{remark:'备注内容'} },
      //     { id: '81', name: '节点-81' ,data:{remark:'备注内容'} },
      //     { id: '82', name: '节点-82' ,data:{remark:'备注内容'} },
      //     { id: '83', name: '节点-83' ,data:{remark:'备注内容'} },
      //     { id: '84', name: '节点-84' ,data:{remark:'备注内容'} },
      //     { id: '85', name: '节点-85' ,data:{remark:'备注内容'} },
      //     { id: '91', name: '节点-91' ,data:{remark:'备注内容'} },
      //     { id: '92', name: '节点-82' ,data:{remark:'备注内容'} },
      //     { id: '51', name: '节点-51' ,data:{remark:'备注内容'} },
      //     { id: '52', name: '节点-52' ,data:{remark:'备注内容'} },
      //     { id: '53', name: '节点-53' ,data:{remark:'备注内容'} },
      //     { id: '54', name: '节点-54' ,data:{remark:'备注内容'} },
      //     { id: '55', name: '节点-55' ,data:{remark:'备注内容'} },
      //     { id: '5',  name: '节点-5'  ,data:{remark:'备注内容'}  }
      //   ],
      //   links: [
      //     { from: '7', to: '71', text: '投资' },
      //     { from: '7', to: '72', text: '投资' },
      //     { from: '7', to: '73', text: '投资' },
      //     { from: '8', to: '81', text: '投资' },
      //     { from: '8', to: '82', text: '投资' },
      //     { from: '8', to: '83', text: '投资' },
      //     { from: '8', to: '84', text: '投资' },
      //     { from: '8', to: '85', text: '投资' },
      //     { from: '9', to: '91', text: '投资' },
      //     { from: '9', to: '92', text: '投资' },
      //     { from: '5', to: '51', text: '投资1' },
      //     { from: '5', to: '52', text: '投资' },
      //     { from: '5', to: '53', text: '投资3' },
      //     { from: '5', to: '54', text: '投资4' },
      //     { from: '5', to: '55', text: '投资' },
      //     { from: '1', to: '2', text: '投资' },
      //     { from: '3', to: '1', text: '高管' },
      //     { from: '4', to: '2', text: '高管' },
      //     { from: '6', to: '2', text: '高管' },
      //     { from: '7', to: '2', text: '高管' },
      //     { from: '8', to: '2', text: '高管' },
      //     { from: '9', to: '2', text: '高管' },
      //     { from: '1', to: '5', text: '投资' }
      //   ]
      // };
        console.log('showSeeksGraph', __graph_json_data)
        this.$refs.seeksRelationGraph.setJsonData(__graph_json_data, (seeksRGGraph) => {
        // 这些写上当图谱初始化完成后需要执行的代码
        console.log('seeksRelationGraph', seeksRGGraph)
      })
      });
      


      
    },
    onNodeClick(nodeObject, $event) {
      console.log('左击事件:', nodeObject, $event)

      // var graph = this.$refs.seeksRelationGraph
      // var _index = graph.getNodes().length + 1
      // var _new_node_id = 'zhankai-' + _index
      // var __graph_json_data = {
      //   nodes: [
      //     { id: _new_node_id, name: '扩展-' + _index }
      //   ],
      //   links: [
      //     { from: nodeObject.id, to: _new_node_id, text: '扩展' }
      //   ]
      // }
      // graph.appendJsonData(__graph_json_data, true, (seeksRGGraph) => {
      //   // 这些写上当图谱初始化完成后需要执行的代码
      //   console.log('图谱渲染', seeksRGGraph)
      // })
    },
    onLineClick(lineObject, $event) {
      console.log('onLineClick:', lineObject)
    },
    contextmenuPrevent(nodeObject) {
      console.log('右击事件:', nodeObject.data.graphNodeKey)

      this.$router.push({
            path: "/graph/nodeDetails", //path：路由地址
            query: { //query向路由传值
              graphNodeKey: nodeObject.data.graphNodeKey, //传递的参数：可使用 this.$route.query.graphNodeKey 接受传递的参数
            },
        });

    },
    showNodeTips(nodeObject, $event) {
      console.log('悬浮事件:', nodeObject)
      this.currentNode = nodeObject
      var _base_position = this.$refs.myPage.getBoundingClientRect()
      this.isShowNodeTipsPanel = true
      this.nodeMenuPanelPosition.x = $event.clientX - _base_position.x + 10
      this.nodeMenuPanelPosition.y = $event.clientY - _base_position.y + 10
    },
    hideNodeTips(nodeObject, $event) {
      this.isShowNodeTipsPanel = false
      console.log('hideNodeTips', nodeObject)
    }
  },
};
</script>

<style scoped lang="scss">
</style>

