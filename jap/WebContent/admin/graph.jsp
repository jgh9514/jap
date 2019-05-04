<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="event.*" %>
<%@ page import="admin.*" %>
<%@ page import="java.util.ArrayList" %>
<%
	UserDAO userDAO = new UserDAO();
	AdminDAO date = new AdminDAO();
%>

<script>
$(document).ready(function(){
	Highcharts.chart('container', {
	    chart: {
	        type: 'column'
	    },
	    title: {
	        text: '이벤트 참여현황'
	    },
	    subtitle: {
	        text: ''
	    },
	    xAxis: {
	        type: 'category'
	    },
	    yAxis: {
	        title: {
	            text: ''
	        }
	    },
	    legend: {
	        enabled: false
	    },
	    plotOptions: {
	        series: {
	            borderWidth: 0,
	            dataLabels: {
	                enabled: true,
	                format: '{point.y:1f}'
	            }
	        }
	    },
	
	    tooltip: {
	        headerFormat: '<span style="font-size:11px">{series.name}</span><br>',
	        pointFormat: '<span style="color:{point.color}">{point.name}</span>: <b>{point.y:1f}</b>번 참여<br/>'
	    },
	
	    "series": [
	        {
	            "name": "참여수",
	            //"colorByPoint": true,
	            "data": [
	                {
	                    "name": "<%=date.get_date2(-6)%>",
	                    "y": <%=userDAO.date_count(date.get_date(-6), date.get_date(-5)) %>,
	                    "drilldown": "type1"
	                },
	                {
	                    "name": "<%=date.get_date2(-5)%>",
	                    "y": <%=userDAO.date_count(date.get_date(-5), date.get_date(-4)) %>,
	                    "drilldown": "type2"
	                },
	                {
	                    "name": "<%=date.get_date2(-4)%>",
	                    "y": <%=userDAO.date_count(date.get_date(-4), date.get_date(-3)) %>,
	                    "drilldown": "type3"
	                },
	                {
	                    "name": "<%=date.get_date2(-3)%>",
	                    "y": <%=userDAO.date_count(date.get_date(-3), date.get_date(-2)) %>,
	                    "drilldown": "type4"
	                },
	                {
	                    "name": "<%=date.get_date2(-2)%>",
	                    "y": <%=userDAO.date_count(date.get_date(-2), date.get_date(-1)) %>,
	                    "drilldown": "type5"
	                },
	                {
	                    "name": "<%=date.get_date2(-1)%>",
	                    "y": <%=userDAO.date_count(date.get_date(-1), date.get_date(0)) %>,
	                    "drilldown": "type6"
	                },
	                {
	                    "name": "<%=date.get_date2(0)%>",
	                    "y": <%=userDAO.date_count(date.get_date(0), date.get_date(1)) %>,
	                    "drilldown": "type7"
	                }
	            ]
	        }
	    ],
	    "drilldown": {
	    	
	        "series": [
	        	{
	                "name": "type1",
	                "id": "type1",
	                "data": [
	                	[
	                        "0시",
	                        <%=userDAO.time_count(date.get_date(-6), 0) %>
	                    ],
	                    [
	                        "1시",
	                        <%=userDAO.time_count(date.get_date(-6), 1) %>
	                    ],
	                    [
	                        "2시",
	                        <%=userDAO.time_count(date.get_date(-6), 2) %>
	                    ],
	                    [
	                        "3시",
	                        <%=userDAO.time_count(date.get_date(-6), 3) %>
	                    ],
	                    [
	                        "4시",
	                        <%=userDAO.time_count(date.get_date(-6), 4) %>
	                    ],
	                    [
	                        "5시",
	                        <%=userDAO.time_count(date.get_date(-6), 5) %>
	                    ],
	                    [
	                        "6시",
	                        <%=userDAO.time_count(date.get_date(-6), 6) %>
	                    ],
	                    [
	                        "7시",
	                        <%=userDAO.time_count(date.get_date(-6), 7) %>
	                    ],
	                    [
	                        "8시",
	                        <%=userDAO.time_count(date.get_date(-6), 8) %>
	                    ],
	                    [
	                        "9시",
	                        <%=userDAO.time_count(date.get_date(-6), 9) %>
	                    ],
	                    [
	                        "10시",
	                        <%=userDAO.time_count(date.get_date(-6), 10) %>
	                    ],
	                    [
	                        "11시",
	                        <%=userDAO.time_count(date.get_date(-6), 11) %>
	                    ],
	                    [
	                        "12시",
	                        <%=userDAO.time_count(date.get_date(-6), 12) %>
	                    ],
	                    [
	                        "13시",
	                        <%=userDAO.time_count(date.get_date(-6), 13) %>
	                    ],
	                    [
	                        "14시",
	                        <%=userDAO.time_count(date.get_date(-6), 14) %>
	                    ],
	                    [
	                        "15시",
	                        <%=userDAO.time_count(date.get_date(-6), 15) %>
	                    ],
	                    [
	                        "16시",
	                        <%=userDAO.time_count(date.get_date(-6), 16) %>
	                    ],
	                    [
	                        "17시",
	                        <%=userDAO.time_count(date.get_date(-6), 17) %>
	                    ],
	                    [
	                        "18시",
	                        <%=userDAO.time_count(date.get_date(-6), 18) %>
	                    ],
	                    [
	                        "19시",
	                        <%=userDAO.time_count(date.get_date(-6), 19) %>
	                    ],
	                    [
	                        "20시",
	                        <%=userDAO.time_count(date.get_date(-6), 20) %>
	                    ],
	                    [
	                        "21시",
	                        <%=userDAO.time_count(date.get_date(-6), 21) %>
	                    ],
	                    [
	                        "22시",
	                        <%=userDAO.time_count(date.get_date(-6), 22) %>
	                    ],
	                    [
	                        "23시",
	                        <%=userDAO.time_count(date.get_date(-6), 23) %>
	                    ]
	                ]
	            }, 
	        	{
	                "name": "type2",
	                "id": "type2",
	                "data": [
	                	[
	                        "0시",
	                        <%=userDAO.time_count(date.get_date(-5), 0) %>
	                    ],
	                    [
	                        "1시",
	                        <%=userDAO.time_count(date.get_date(-5), 1) %>
	                    ],
	                    [
	                        "2시",
	                        <%=userDAO.time_count(date.get_date(-5), 2) %>
	                    ],
	                    [
	                        "3시",
	                        <%=userDAO.time_count(date.get_date(-5), 3) %>
	                    ],
	                    [
	                        "4시",
	                        <%=userDAO.time_count(date.get_date(-5), 4) %>
	                    ],
	                    [
	                        "5시",
	                        <%=userDAO.time_count(date.get_date(-5), 5) %>
	                    ],
	                    [
	                        "6시",
	                        <%=userDAO.time_count(date.get_date(-5), 6) %>
	                    ],
	                    [
	                        "7시",
	                        <%=userDAO.time_count(date.get_date(-5), 7) %>
	                    ],
	                    [
	                        "8시",
	                        <%=userDAO.time_count(date.get_date(-5), 8) %>
	                    ],
	                    [
	                        "9시",
	                        <%=userDAO.time_count(date.get_date(-5), 9) %>
	                    ],
	                    [
	                        "10시",
	                        <%=userDAO.time_count(date.get_date(-5), 10) %>
	                    ],
	                    [
	                        "11시",
	                        <%=userDAO.time_count(date.get_date(-5), 11) %>
	                    ],
	                    [
	                        "12시",
	                        <%=userDAO.time_count(date.get_date(-5), 12) %>
	                    ],
	                    [
	                        "13시",
	                        <%=userDAO.time_count(date.get_date(-5), 13) %>
	                    ],
	                    [
	                        "14시",
	                        <%=userDAO.time_count(date.get_date(-5), 14) %>
	                    ],
	                    [
	                        "15시",
	                        <%=userDAO.time_count(date.get_date(-5), 15) %>
	                    ],
	                    [
	                        "16시",
	                        <%=userDAO.time_count(date.get_date(-5), 16) %>
	                    ],
	                    [
	                        "17시",
	                        <%=userDAO.time_count(date.get_date(-5), 17) %>
	                    ],
	                    [
	                        "18시",
	                        <%=userDAO.time_count(date.get_date(-5), 18) %>
	                    ],
	                    [
	                        "19시",
	                        <%=userDAO.time_count(date.get_date(-5), 19) %>
	                    ],
	                    [
	                        "20시",
	                        <%=userDAO.time_count(date.get_date(-5), 20) %>
	                    ],
	                    [
	                        "21시",
	                        <%=userDAO.time_count(date.get_date(-5), 21) %>
	                    ],
	                    [
	                        "22시",
	                        <%=userDAO.time_count(date.get_date(-5), 22) %>
	                    ],
	                    [
	                        "23시",
	                        <%=userDAO.time_count(date.get_date(-5), 23) %>
	                    ]
	                ]
	            },
		        {
	                "name": "type3",
	                "id": "type3",
	                "data": [
	                	[
	                        "0시",
	                        <%=userDAO.time_count(date.get_date(-4), 0) %>
	                    ],
	                    [
	                        "1시",
	                        <%=userDAO.time_count(date.get_date(-4), 1) %>
	                    ],
	                    [
	                        "2시",
	                        <%=userDAO.time_count(date.get_date(-4), 2) %>
	                    ],
	                    [
	                        "3시",
	                        <%=userDAO.time_count(date.get_date(-4), 3) %>
	                    ],
	                    [
	                        "4시",
	                        <%=userDAO.time_count(date.get_date(-4), 4) %>
	                    ],
	                    [
	                        "5시",
	                        <%=userDAO.time_count(date.get_date(-4), 5) %>
	                    ],
	                    [
	                        "6시",
	                        <%=userDAO.time_count(date.get_date(-4), 6) %>
	                    ],
	                    [
	                        "7시",
	                        <%=userDAO.time_count(date.get_date(-4), 7) %>
	                    ],
	                    [
	                        "8시",
	                        <%=userDAO.time_count(date.get_date(-4), 8) %>
	                    ],
	                    [
	                        "9시",
	                        <%=userDAO.time_count(date.get_date(-4), 9) %>
	                    ],
	                    [
	                        "10시",
	                        <%=userDAO.time_count(date.get_date(-4), 10) %>
	                    ],
	                    [
	                        "11시",
	                        <%=userDAO.time_count(date.get_date(-4), 11) %>
	                    ],
	                    [
	                        "12시",
	                        <%=userDAO.time_count(date.get_date(-4), 12) %>
	                    ],
	                    [
	                        "13시",
	                        <%=userDAO.time_count(date.get_date(-4), 13) %>
	                    ],
	                    [
	                        "14시",
	                        <%=userDAO.time_count(date.get_date(-4), 14) %>
	                    ],
	                    [
	                        "15시",
	                        <%=userDAO.time_count(date.get_date(-4), 15) %>
	                    ],
	                    [
	                        "16시",
	                        <%=userDAO.time_count(date.get_date(-4), 16) %>
	                    ],
	                    [
	                        "17시",
	                        <%=userDAO.time_count(date.get_date(-4), 17) %>
	                    ],
	                    [
	                        "18시",
	                        <%=userDAO.time_count(date.get_date(-4), 18) %>
	                    ],
	                    [
	                        "19시",
	                        <%=userDAO.time_count(date.get_date(-4), 19) %>
	                    ],
	                    [
	                        "20시",
	                        <%=userDAO.time_count(date.get_date(-4), 20) %>
	                    ],
	                    [
	                        "21시",
	                        <%=userDAO.time_count(date.get_date(-4), 21) %>
	                    ],
	                    [
	                        "22시",
	                        <%=userDAO.time_count(date.get_date(-4), 22) %>
	                    ],
	                    [
	                        "23시",
	                        <%=userDAO.time_count(date.get_date(-4), 23) %>
	                    ]
	                ]
	            },
	            {
	                "name": "type4",
	                "id": "type4",
	                "data": [
	                	[
	                        "0시",
	                        <%=userDAO.time_count(date.get_date(-3), 0) %>
	                    ],
	                    [
	                        "1시",
	                        <%=userDAO.time_count(date.get_date(-3), 1) %>
	                    ],
	                    [
	                        "2시",
	                        <%=userDAO.time_count(date.get_date(-3), 2) %>
	                    ],
	                    [
	                        "3시",
	                        <%=userDAO.time_count(date.get_date(-3), 3) %>
	                    ],
	                    [
	                        "4시",
	                        <%=userDAO.time_count(date.get_date(-3), 4) %>
	                    ],
	                    [
	                        "5시",
	                        <%=userDAO.time_count(date.get_date(-3), 5) %>
	                    ],
	                    [
	                        "6시",
	                        <%=userDAO.time_count(date.get_date(-3), 6) %>
	                    ],
	                    [
	                        "7시",
	                        <%=userDAO.time_count(date.get_date(-3), 7) %>
	                    ],
	                    [
	                        "8시",
	                        <%=userDAO.time_count(date.get_date(-3), 8) %>
	                    ],
	                    [
	                        "9시",
	                        <%=userDAO.time_count(date.get_date(-3), 9) %>
	                    ],
	                    [
	                        "10시",
	                        <%=userDAO.time_count(date.get_date(-3), 10) %>
	                    ],
	                    [
	                        "11시",
	                        <%=userDAO.time_count(date.get_date(-3), 11) %>
	                    ],
	                    [
	                        "12시",
	                        <%=userDAO.time_count(date.get_date(-3), 12) %>
	                    ],
	                    [
	                        "13시",
	                        <%=userDAO.time_count(date.get_date(-3), 13) %>
	                    ],
	                    [
	                        "14시",
	                        <%=userDAO.time_count(date.get_date(-3), 14) %>
	                    ],
	                    [
	                        "15시",
	                        <%=userDAO.time_count(date.get_date(-3), 15) %>
	                    ],
	                    [
	                        "16시",
	                        <%=userDAO.time_count(date.get_date(-3), 16) %>
	                    ],
	                    [
	                        "17시",
	                        <%=userDAO.time_count(date.get_date(-3), 17) %>
	                    ],
	                    [
	                        "18시",
	                        <%=userDAO.time_count(date.get_date(-3), 18) %>
	                    ],
	                    [
	                        "19시",
	                        <%=userDAO.time_count(date.get_date(-3), 19) %>
	                    ],
	                    [
	                        "20시",
	                        <%=userDAO.time_count(date.get_date(-3), 20) %>
	                    ],
	                    [
	                        "21시",
	                        <%=userDAO.time_count(date.get_date(-3), 21) %>
	                    ],
	                    [
	                        "22시",
	                        <%=userDAO.time_count(date.get_date(-3), 22) %>
	                    ],
	                    [
	                        "23시",
	                        <%=userDAO.time_count(date.get_date(-3), 23) %>
	                    ]
	                ]
	            },
	            {
	                "name": "type5",
	                "id": "type5",
	                "data": [
	                	[
	                        "0시",
	                        <%=userDAO.time_count(date.get_date(-2), 0) %>
	                    ],
	                    [
	                        "1시",
	                        <%=userDAO.time_count(date.get_date(-2), 1) %>
	                    ],
	                    [
	                        "2시",
	                        <%=userDAO.time_count(date.get_date(-2), 2) %>
	                    ],
	                    [
	                        "3시",
	                        <%=userDAO.time_count(date.get_date(-2), 3) %>
	                    ],
	                    [
	                        "4시",
	                        <%=userDAO.time_count(date.get_date(-2), 4) %>
	                    ],
	                    [
	                        "5시",
	                        <%=userDAO.time_count(date.get_date(-2), 5) %>
	                    ],
	                    [
	                        "6시",
	                        <%=userDAO.time_count(date.get_date(-2), 6) %>
	                    ],
	                    [
	                        "7시",
	                        <%=userDAO.time_count(date.get_date(-2), 7) %>
	                    ],
	                    [
	                        "8시",
	                        <%=userDAO.time_count(date.get_date(-2), 8) %>
	                    ],
	                    [
	                        "9시",
	                        <%=userDAO.time_count(date.get_date(-2), 9) %>
	                    ],
	                    [
	                        "10시",
	                        <%=userDAO.time_count(date.get_date(-2), 10) %>
	                    ],
	                    [
	                        "11시",
	                        <%=userDAO.time_count(date.get_date(-2), 11) %>
	                    ],
	                    [
	                        "12시",
	                        <%=userDAO.time_count(date.get_date(-2), 12) %>
	                    ],
	                    [
	                        "13시",
	                        <%=userDAO.time_count(date.get_date(-2), 13) %>
	                    ],
	                    [
	                        "14시",
	                        <%=userDAO.time_count(date.get_date(-2), 14) %>
	                    ],
	                    [
	                        "15시",
	                        <%=userDAO.time_count(date.get_date(-2), 15) %>
	                    ],
	                    [
	                        "16시",
	                        <%=userDAO.time_count(date.get_date(-2), 16) %>
	                    ],
	                    [
	                        "17시",
	                        <%=userDAO.time_count(date.get_date(-2), 17) %>
	                    ],
	                    [
	                        "18시",
	                        <%=userDAO.time_count(date.get_date(-2), 18) %>
	                    ],
	                    [
	                        "19시",
	                        <%=userDAO.time_count(date.get_date(-2), 19) %>
	                    ],
	                    [
	                        "20시",
	                        <%=userDAO.time_count(date.get_date(-2), 20) %>
	                    ],
	                    [
	                        "21시",
	                        <%=userDAO.time_count(date.get_date(-2), 21) %>
	                    ],
	                    [
	                        "22시",
	                        <%=userDAO.time_count(date.get_date(-2), 22) %>
	                    ],
	                    [
	                        "23시",
	                        <%=userDAO.time_count(date.get_date(-2), 23) %>
	                    ]
	                ]
	            },
	            {
	                "name": "type6",
	                "id": "type6",
	                "data": [
	                	[
	                        "0시",
	                        <%=userDAO.time_count(date.get_date(-1), 0) %>
	                    ],
	                    [
	                        "1시",
	                        <%=userDAO.time_count(date.get_date(-1), 1) %>
	                    ],
	                    [
	                        "2시",
	                        <%=userDAO.time_count(date.get_date(-1), 2) %>
	                    ],
	                    [
	                        "3시",
	                        <%=userDAO.time_count(date.get_date(-1), 3) %>
	                    ],
	                    [
	                        "4시",
	                        <%=userDAO.time_count(date.get_date(-1), 4) %>
	                    ],
	                    [
	                        "5시",
	                        <%=userDAO.time_count(date.get_date(-1), 5) %>
	                    ],
	                    [
	                        "6시",
	                        <%=userDAO.time_count(date.get_date(-1), 6) %>
	                    ],
	                    [
	                        "7시",
	                        <%=userDAO.time_count(date.get_date(-1), 7) %>
	                    ],
	                    [
	                        "8시",
	                        <%=userDAO.time_count(date.get_date(-1), 8) %>
	                    ],
	                    [
	                        "9시",
	                        <%=userDAO.time_count(date.get_date(-1), 9) %>
	                    ],
	                    [
	                        "10시",
	                        <%=userDAO.time_count(date.get_date(-1), 10) %>
	                    ],
	                    [
	                        "11시",
	                        <%=userDAO.time_count(date.get_date(-1), 11) %>
	                    ],
	                    [
	                        "12시",
	                        <%=userDAO.time_count(date.get_date(-1), 12) %>
	                    ],
	                    [
	                        "13시",
	                        <%=userDAO.time_count(date.get_date(-1), 13) %>
	                    ],
	                    [
	                        "14시",
	                        <%=userDAO.time_count(date.get_date(-1), 14) %>
	                    ],
	                    [
	                        "15시",
	                        <%=userDAO.time_count(date.get_date(-1), 15) %>
	                    ],
	                    [
	                        "16시",
	                        <%=userDAO.time_count(date.get_date(-1), 16) %>
	                    ],
	                    [
	                        "17시",
	                        <%=userDAO.time_count(date.get_date(-1), 17) %>
	                    ],
	                    [
	                        "18시",
	                        <%=userDAO.time_count(date.get_date(-1), 18) %>
	                    ],
	                    [
	                        "19시",
	                        <%=userDAO.time_count(date.get_date(-1), 19) %>
	                    ],
	                    [
	                        "20시",
	                        <%=userDAO.time_count(date.get_date(-1), 20) %>
	                    ],
	                    [
	                        "21시",
	                        <%=userDAO.time_count(date.get_date(-1), 21) %>
	                    ],
	                    [
	                        "22시",
	                        <%=userDAO.time_count(date.get_date(-1), 22) %>
	                    ],
	                    [
	                        "23시",
	                        <%=userDAO.time_count(date.get_date(-1), 23) %>
	                    ]
	                ]
	            }, 
	            {
	                "name": "type7",
	                "id": "type7",
	                "data": [
	                	[
	                        "0시",
	                        <%=userDAO.time_count(date.get_date(0), 0) %>
	                    ],
	                    [
	                        "1시",
	                        <%=userDAO.time_count(date.get_date(0), 1) %>
	                    ],
	                    [
	                        "2시",
	                        <%=userDAO.time_count(date.get_date(0), 2) %>
	                    ],
	                    [
	                        "3시",
	                        <%=userDAO.time_count(date.get_date(0), 3) %>
	                    ],
	                    [
	                        "4시",
	                        <%=userDAO.time_count(date.get_date(0), 4) %>
	                    ],
	                    [
	                        "5시",
	                        <%=userDAO.time_count(date.get_date(0), 5) %>
	                    ],
	                    [
	                        "6시",
	                        <%=userDAO.time_count(date.get_date(0), 6) %>
	                    ],
	                    [
	                        "7시",
	                        <%=userDAO.time_count(date.get_date(0), 7) %>
	                    ],
	                    [
	                        "8시",
	                        <%=userDAO.time_count(date.get_date(0), 8) %>
	                    ],
	                    [
	                        "9시",
	                        <%=userDAO.time_count(date.get_date(0), 9) %>
	                    ],
	                    [
	                        "10시",
	                        <%=userDAO.time_count(date.get_date(0), 10) %>
	                    ],
	                    [
	                        "11시",
	                        <%=userDAO.time_count(date.get_date(0), 11) %>
	                    ],
	                    [
	                        "12시",
	                        <%=userDAO.time_count(date.get_date(0), 12) %>
	                    ],
	                    [
	                        "13시",
	                        <%=userDAO.time_count(date.get_date(0), 13) %>
	                    ],
	                    [
	                        "14시",
	                        <%=userDAO.time_count(date.get_date(0), 14) %>
	                    ],
	                    [
	                        "15시",
	                        <%=userDAO.time_count(date.get_date(0), 15) %>
	                    ],
	                    [
	                        "16시",
	                        <%=userDAO.time_count(date.get_date(0), 16) %>
	                    ],
	                    [
	                        "17시",
	                        <%=userDAO.time_count(date.get_date(0), 17) %>
	                    ],
	                    [
	                        "18시",
	                        <%=userDAO.time_count(date.get_date(0), 18) %>
	                    ],
	                    [
	                        "19시",
	                        <%=userDAO.time_count(date.get_date(0), 19) %>
	                    ],
	                    [
	                        "20시",
	                        <%=userDAO.time_count(date.get_date(0), 20) %>
	                    ],
	                    [
	                        "21시",
	                        <%=userDAO.time_count(date.get_date(0), 21) %>
	                    ],
	                    [
	                        "22시",
	                        <%=userDAO.time_count(date.get_date(0), 22) %>
	                    ],
	                    [
	                        "23시",
	                        <%=userDAO.time_count(date.get_date(0), 23) %>
	                    ]
	                ]
	            },
	        ]
	    }
	});
	
	$(".highcharts-credits").css("display","none");
});

</script>