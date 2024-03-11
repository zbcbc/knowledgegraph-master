<template>
    <div class="dashboard-editor-container">
      <panel-group :v-if = "groupFign" :lineChartData="chartData" @handleSetLineChartData="handleSetLineChartData" />
      <el-row style="background: #fff; padding: 16px 16px 0; margin-bottom: 32px">
        <line-chart :chart-data="lineChartData" />
      </el-row>
  
      <!-- <el-row :gutter="32">
        <el-col :xs="24" :sm="24" :lg="8">
          <div class="chart-wrapper">
            <raddar-chart />
          </div>
        </el-col>
        <el-col :xs="24" :sm="24" :lg="8">
          <div class="chart-wrapper">
            <pie-chart />
          </div>
        </el-col>
        <el-col :xs="24" :sm="24" :lg="8">
          <div class="chart-wrapper">
            <bar-chart />
          </div>
        </el-col>
      </el-row> -->
    </div>
  </template>
  
  <script>
  import PanelGroup from "./dashboard/PanelGroup";
  import LineChart from "./dashboard/LineChart";
  import RaddarChart from "./dashboard/RaddarChart";
  import PieChart from "./dashboard/PieChart";
  import BarChart from "./dashboard/BarChart";
  import { mapState } from "vuex";
  import { getLineChart } from "@/api/neo4j/dataStatistics";
//   const lineChartData = {
//     newVisitis: {
//       actualData: null
//     },
//     messages: {
//       actualData: null
//     },
//     purchases: {
//       actualData: null
//     },
//     shoppings: {
//       actualData: null
//     }
//   }
//   const lineChartData = {
//     newVisitis: {
//         value:123,
//       expectedData: ['4/11','4/12', '4/13', '4/14', '4/15', '4/16', '4/17'],
//       actualData: [0, 0, 1, 0, 0, 0, 1],
//     },
//     messages: {
//         value:1231,
//        expectedData: ['4/11','4/12', '4/13', '4/14', '4/15', '4/16', '4/17'],
//       actualData: [180, 160, 151, 106, 145, 150, 130],
//     },
//     purchases: {
//         value:1223,
//         expectedData: ['4/11','4/12', '4/13', '4/14', '4/15', '4/16', '4/17'],
//       actualData: [120, 90, 100, 138, 142, 130, 130],
//     },
//     shoppings: {
//         value:1233,
//         expectedData: ['4/11','4/12', '4/13', '4/14', '4/15', '4/16', '4/17'],
//       actualData: [120, 82, 91, 154, 162, 140, 130],
//     },
//   };
  
  export default {
    name: "Index",
    components: {
      PanelGroup,
      LineChart,
      RaddarChart,
      PieChart,
      BarChart,
    },
    data() {
      return {
        groupFign: false,
        chartData :{},
        lineChartData : {
                    value:0,
                expectedData: ['0/0','0/0', '0/0', '0/0', '0/0', '0/0', '0/0'],
                actualData: [0, 0, 0, 0, 0, 0, 1],
                },
        // lineChartData: {
        //   actualData: null,
        // },
      };
    },
    created() {
        // this.chartData =  lineChartData;
        this.getList();
    },
    methods: {
      handleSetLineChartData(type) {
        this.lineChartData = this.chartData[type];
      },
      getList() {
        getLineChart().then((response) => {
            console.log(response.data)
          this.chartData =  response.data;
          this.lineChartData = response.data.newVisitis;
          this.groupFign = true;
          // this.ChartData = this.lineChartData["newVisitis"];
        });
      },
    },
  };
  </script>
  
  <style lang="scss" scoped>
  .dashboard-editor-container {
    padding: 32px;
    background-color: rgb(226, 234, 245);
    position: relative;
  }
  
  .chart-wrapper {
    background: rgb(232, 235, 240);
    padding: 16px 16px 0;
    margin-bottom: 32px;
  }
  
  @media (max-width: 1024px) {
    .chart-wrapper {
      padding: 8px;
    }
  }
  </style>