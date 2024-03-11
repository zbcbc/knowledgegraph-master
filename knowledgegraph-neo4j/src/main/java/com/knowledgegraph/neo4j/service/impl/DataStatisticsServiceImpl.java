package com.knowledgegraph.neo4j.service.impl;

import com.knowledgegraph.neo4j.mapper.DataStatisticsMapper;
import com.knowledgegraph.neo4j.service.IDataStatisticsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class DataStatisticsServiceImpl implements IDataStatisticsService {

    @Autowired
    private DataStatisticsMapper dataStatisticsMapper;


    @Override
    public Map<String, Object> lineChart() {

        List<Map<String,Object>> userList = dataStatisticsMapper.selectDataStatisticsUser();
        List<Map<String,Object>> graphList = dataStatisticsMapper.selectDataStatisticsGraph();
        List<Map<String,Object>> graphNodeList = dataStatisticsMapper.selectDataStatisticsGraphNode();
        List<Map<String,Object>> videoList = dataStatisticsMapper.selectDataStatisticsVideo();
        int numberValue = 0;


        List<String> expectedData = null;
        List<Integer> actualData = null;
        Map<String,Object> lineChartData = new HashMap<>();
        Map<String,Object> map = null;

        expectedData = new ArrayList<>();
        actualData = new ArrayList<>();
        for(Map<String,Object> dataMap : userList){
            numberValue += Integer.parseInt(dataMap.get("number").toString());
            expectedData.add(dataMap.get("dataday").toString());
            actualData.add(Integer.parseInt(dataMap.get("number").toString()));
        }
        map = new HashMap<>();
        map.put("value",numberValue);
        map.put("expectedData",expectedData);
        map.put("actualData",actualData);
        lineChartData.put("newVisitis",map);

        numberValue = 0;
        expectedData = new ArrayList<>();
        actualData = new ArrayList<>();
        for(Map<String,Object> dataMap : graphList){
            numberValue += Integer.parseInt(dataMap.get("number").toString());
            expectedData.add(dataMap.get("dataday").toString());
            actualData.add(Integer.parseInt(dataMap.get("number").toString()));
        }
        map = new HashMap<>();
        map.put("value",numberValue);
        map.put("expectedData",expectedData);
        map.put("actualData",actualData);
        lineChartData.put("messages",map);

        numberValue = 0;
        expectedData = new ArrayList<>();
        actualData = new ArrayList<>();
        for(Map<String,Object> dataMap : graphNodeList){
            numberValue += Integer.parseInt(dataMap.get("number").toString());
            expectedData.add(dataMap.get("dataday").toString());
            actualData.add(Integer.parseInt(dataMap.get("number").toString()));
        }
        map = new HashMap<>();
        map.put("value",numberValue);
        map.put("expectedData",expectedData);
        map.put("actualData",actualData);
        lineChartData.put("purchases",map);

        numberValue = 0;
        expectedData = new ArrayList<>();
        actualData = new ArrayList<>();
        for(Map<String,Object> dataMap : videoList){
            numberValue += Integer.parseInt(dataMap.get("number").toString());
            expectedData.add(dataMap.get("dataday").toString());
            actualData.add(Integer.parseInt(dataMap.get("number").toString()));
        }
        map = new HashMap<>();
        map.put("value",numberValue);
        map.put("expectedData",expectedData);
        map.put("actualData",actualData);
        lineChartData.put("shoppings",map);


        return lineChartData;
    }
}
