package com.knowledgegraph.neo4j.domain;

import java.math.BigDecimal;
import java.util.Scanner;

public class test {

    public static void main(String[] args) {
        System.out.println(quotient());

    }

    /**
     * 求商
     * @return
     *
     * 异常：
     * 在不输入字符的情况下（输入字符，报非数字异常）
     * 1、输入数字个数不足7个会下标越界
     * 2、第七位为0 ，报分母不能为零异常
     *
     */
    public static BigDecimal  quotient(){
        Scanner sc = new Scanner(System.in);
        String intStr = sc.next();
        String[] ints = intStr.split(",");
        if(ints.length < 7){
            System.out.println("至少输入7位小数！");
            return null;
        }else if(ints[6].equals("0")){
            System.out.println("求商第二位不可为0！");
            return null;
        }
        BigDecimal one = new BigDecimal(ints[3]);
        BigDecimal two = new BigDecimal(ints[6]);
        return one.divide(two,4, BigDecimal.ROUND_HALF_UP);
    }

}
