<%-- 
    Document   : grafica
    Created on : 19/11/2021, 06:23:59 PM
    Author     : yayah
--%>

<%@page import="org.jfree.data.category.DefaultCategoryDataset"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*" %>
<%@page import="org.jfree.chart.*" %>
<%@page import="org.jfree.chart.plot.*" %>
<%@page import="org.jfree.data.general.*" %>
<%@page import="org.jfree.data.category.DefaultCategoryDataset.*" %>
<!DOCTYPE html>
<html>
    <head>
        <title>FOUNDAPP</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="CSSd/CSSmenuadmin.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <link rel="stylesheet" type="text/css" href="//cdnjs.cloudflare.com/ajax/libs/jquery-jgrowl/1.4.1/jquery.jgrowl.min.css" />
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery-jgrowl/1.4.1/jquery.jgrowl.min.js"></script>
            
        
    </head>
   
    <body>
        
        <header class="barraroja">
            <p class="per">FOUNDAPP</p>
        </header>
           </div>
           
        
            <div class="box box-two">
                 
             
                <% 
            //aqui va codigo java
            
            
            Connection con = null;
            Statement set = null;
            String url, userName, password, driver;
            
            url = "jdbc:mysql://localhost/rainsoft";
            userName = "root";
            password = "343122";
            driver = "com.mysql.jdbc.Connection";
                Class.forName("com.mysql.jdbc.Driver");
                con = (Connection)DriverManager.getConnection(url, userName, password);
                Statement cmd =con.createStatement();
                String sql = "select dondeloen, count(dondeloen)from encontrado group by dondeloen";
                ResultSet rs = cmd.executeQuery(sql);
                System.out.println(rs);
                 try{
                     DefaultPieDataset data = new DefaultPieDataset();
                     while(rs.next()){
                         data.setValue(rs.getString("dondeloen"), rs.getInt(2));
                     }
                         JFreeChart grafico = ChartFactory.createPieChart("Cantidad", data,true,true,true);
                         response.setContentType("image/JPEG");
                         OutputStream sa = response.getOutputStream();
                         ChartUtilities.writeChartAsJPEG(sa, grafico, 800,800);
                     
                     
                 }catch(Exception ex){
                     out.print(ex);
                 
                 } 
                
                
                %>