<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.util.Date" %>

<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Dashboard</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.6 -->
  <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
  <!-- jvectormap -->
  <link rel="stylesheet" href="plugins/jvectormap/jquery-jvectormap-1.2.2.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
</head>
<body class="hold-transition skin-blue sidebar-mini">
<script>
var sensors = [];
var price = [];
var sensors1 = [];
var states1= [];
var sensors2 = [];
var states2 = [];

</script>

  <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>

    <script type="text/javascript" src="http://code.highcharts.com/highcharts.js"></script>
    <script type="text/javascript" src="http://code.highcharts.com/modules/exporting.js"></script> 

<%
  String driver = "com.mysql.jdbc.Driver";
  String dbURL = "jdbc:mysql://sql3.freemysqlhosting.net:3306/sql3147883";
  String username = "sql3147883";
  String password = "2yC7asI8Rs";

  Connection conn = null;
  Statement stmt = null;
  
  Class.forName("com.mysql.jdbc.Driver").newInstance(); 
  conn = DriverManager.getConnection(dbURL, username, password);
  

  stmt = conn.createStatement();
  String user =(String)session.getAttribute("username");
  String sql = "select sensorname, sum(cost) as a from billing where username='"+user+"' group by sensorname ";
  String sql1 = "SELECT hubname, count(*) as a FROM sensortable where username='"+user+"' GROUP BY hubname ";
   String sql2 = "select sensorid, State from sensortable where username='"+user+"' ";
  ResultSet rs = stmt.executeQuery(sql);
 
 
  
  while (rs.next()){%>
  <script>
    sensors.push("<%=rs.getString("sensorname")%>");
    price.push("<%= rs.getString("a")%>");
    </script>  
  <%   
  }
  ResultSet rs1 = stmt.executeQuery(sql1);
   while (rs1.next()){%>
  <script>
    sensors1.push("<%=rs1.getString("hubname")%>");
    states1.push("<%= rs1.getInt("a")%>");
    </script>  
  <%   
  }
   ResultSet rs2 = stmt.executeQuery(sql2);
  while (rs2.next()){%>
  <script>
    sensors2.push("<%=rs2.getString("sensorid")%>");
    states2.push("<%= rs2.getString("State")%>");
    </script>  
  <%   
  }

  %>
  
<div class="wrapper">

  <header class="main-header">

    <!-- Logo -->
    <a href="userdashboard.jsp" class="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini"><b>A</b>LT</span>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg"><b>City </b>Guide</span>
    </a>

    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
        <span class="sr-only">Toggle navigation</span>
      </a>
      <!-- Navbar Right Menu -->
      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
          
          <!-- User Account: style can be found in dropdown.less -->
          <li class="dropdown user user-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <img src="dist/img/user2-160x160.jpg" class="user-image" alt="User Image">
              <span class="hidden-xs"><%= session.getAttribute("username") %></span>
            </a>
            <ul class="dropdown-menu">
              <!-- User image -->
              <li class="user-header">
                <img src="dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">

              </li>              
              <!-- Menu Footer-->
              <li class="user-footer">
                <div class="pull-left">
                  <a href="#" class="btn btn-default btn-flat">Profile</a>
                </div>
                <div class="pull-right">
                  <a href="index.jsp" class="btn btn-default btn-flat">Sign out</a>
                </div>
              </li>
            </ul>
          </li>
          
    </nav>
  </header>
  <!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <!-- Sidebar user panel -->
      <div class="user-panel">
        <div class="pull-left image">
          <img src="dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
        </div>
        <div class="pull-left info">
          <p><%= session.getAttribute("username") %></p>
          <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
        </div>
      </div>
      
      <!-- /.search form -->
      <!-- sidebar menu: : style can be found in sidebar.less -->
      <ul class="sidebar-menu">
        <li class="header">MAIN NAVIGATION</li>
        <li class="active treeview">
          <a href="#">
            <i class="fa fa-dashboard"></i> <span>Dashboard</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="userdashboard.jsp"><i class="fa fa-circle-o"></i> Main Dashboard </a></li>            
          </ul>
        </li>
        
                        
        
      </ul>
    </section>
    <!-- /.sidebar -->
  </aside>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Dashboard
        
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Dashboard</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      
      <div class="row">
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-aqua">
            <div class="inner">
              <h3>Manage</h3>
              <p>Create,Start,Stop & Delete Sensors</p>
            </div>
            <div class="icon">
              
            </div>
            
            <a href="manage.jsp" class="small-box-footer"> <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
         <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-yellow">
            <div class="inner">
              <h3>View</h3>
              <p>See all your deployed sensors</p>
            </div>
            <div class="icon">
              
            </div>
            <a href="viewallsensors.jsp" class="small-box-footer"> <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>

        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-red">
            <div class="inner">
              <h3>Patrolling</h3>
              <p>Decide a route and start patrol</p>
            </div>
            <div class="icon">
              
            </div>
            <a href="patroling.jsp" class="small-box-footer"> <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-green">
            <div class="inner">
              <h3>Account Info</h3>
              <p>View your account and billing info</p>
            </div>
            <div class="icon">
              
            </div>
            <a href="userdetails.jsp" class="small-box-footer"> <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>

      <
 


</div>
<div id="container" style="height: 400px"></div>
</br></br></br>
<div id="container1" style="height: 400px"></div>
</br></br></br>
<div id="container2" style="height: 400px"></div>

<center><h2>Sensors Deployed</h2></center></div>
<div id="map_canvas" style="height: 400px"></div>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAw2jBXNkaAns3t3N2K3c1EjNBb-H5nYBQ&callback=initMap"></script>

<script>
$(function () {
    Highcharts.chart('container', {
        chart: {
            type: 'line'
        },
        title: {
            text: 'Billing Chart'
        },
        subtitle: {
            text: 'Grouped by sensors'
        },
        xAxis: {
            categories: sensors
        },
        yAxis: {
            title: {
                text: 'Cost ($)'
            }
        },
        plotOptions: {
            line: {
                dataLabels: {
                    enabled: true
                },
                enableMouseTracking: false
            }
        },
        series: [{
            name: 'Billing',
            data: JSON.parse("[" + price + "]")
        }]
    });
});
</script>

<script>

$(function () {
    Highcharts.chart('container1', {
        title: {
            text: 'No of Sensors'
        },

        subtitle: {
            text: 'Grouped by Hubs'
        },


        xAxis: {
            categories: sensors1
        },
    yAxis : [{
      tickInterval: 1,
            minRange: 1,
            allowDecimals: false,
            startOnTick: true,
            endOnTick: true
    }],
        series: [{
          name: 'No of Sensors',
            data: JSON.parse("[" + states1 + "]")
        }]
    });
});
</script>

<script>
var datas = [];
  var temp;
  for(temp=0;temp<states2.length;temp++){
    if(states2[temp]=="Running")
      datas[temp] = 1;
    else
      datas[temp] = 0;
  }

  $(function () {
	    Highcharts.chart('container2', {
	        title: {
	            text: 'Sensors State'
	        },




	        xAxis: {
	            categories: sensors2
	        },
	    yAxis : [{
	      tickInterval: 1,
	            minRange: 1,
	            allowDecimals: false,
	            startOnTick: true,
	            endOnTick: true
	    }],
	        series: [{
	          name: 'State',
	            data: JSON.parse("[" + datas + "]")
	        }]
	    });
	});
</script>
<script>
   locations_name = [];
   locations_address = [];
   </script>
   <%
   
  
   
   Class.forName("com.mysql.jdbc.Driver").newInstance(); 
   conn = DriverManager.getConnection(dbURL, username, password);
   
   
   stmt = conn.createStatement();
   String sql3 = "select sensorid, source from sensortable where username='"+user+"' ";
   ResultSet rs3 = stmt.executeQuery(sql3);
   while (rs3.next()){%>
   <script>
     locations_name.push("<%=rs3.getString("sensorid")%>");
     locations_address.push("<%= rs3.getString("source")%>");
     </script>  
   <%   
   }  
%>  
<script>
var i;
var locations= [];
for(i=0;i<locations_address.length;i++) {
  locations.push([locations_name[i],locations_address[i]]);
}

var geocoder;
var map;
var bounds = new google.maps.LatLngBounds();

function initialize() {
    map = new google.maps.Map(
    document.getElementById("map_canvas"), {
        center: new google.maps.LatLng(37.4419, -122.1419),
        zoom: 13,
        mapTypeId: google.maps.MapTypeId.ROADMAP
    });
    geocoder = new google.maps.Geocoder();

    for (i = 0; i < locations.length; i++) {


        geocodeAddress(locations, i);
    }
}
google.maps.event.addDomListener(window, "load", initialize);

function geocodeAddress(locations, i) {
    var title = locations[i][0];
    var address = locations[i][1];
    var url = locations[i][2];
    geocoder.geocode({
        'address': locations[i][1]
    },

    function (results, status) {
        if (status == google.maps.GeocoderStatus.OK) {
            var marker = new google.maps.Marker({
                icon: 'http://maps.google.com/mapfiles/ms/icons/blue.png',
                map: map,
                position: results[0].geometry.location,
                title: title,
                animation: google.maps.Animation.DROP,
                address: address,
                url: url
            })
            infoWindow(marker, map, title, address, url);
            bounds.extend(marker.getPosition());
            map.fitBounds(bounds);
        } else {
            alert("geocode of " + address + " failed:" + status);
        }
    });
}

function infoWindow(marker, map, title, address) {
    google.maps.event.addListener(marker, 'click', function () {
        var html = "<div><h3>" + title + "</h3><p>" + address + "<br>";
        iw = new google.maps.InfoWindow({
            content: html,
            maxWidth: 350
        });
        iw.open(map, marker);
    });
}

function createMarker(results) {
    var marker = new google.maps.Marker({
        icon: 'http://maps.google.com/mapfiles/ms/icons/blue.png',
        map: map,
        position: results[0].geometry.location,
        title: title,
        animation: google.maps.Animation.DROP,
        address: address,
    })
    bounds.extend(marker.getPosition());
    map.fitBounds(bounds);
    infoWindow(marker, map, title, address);
    return marker;
}

   </script>

<!-- ./wrapper -->

<!-- jQuery 2.2.3 -->
<script src="plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="bootstrap/js/bootstrap.min.js"></script>
<!-- FastClick -->
<script src="plugins/fastclick/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/app.min.js"></script>
<!-- Sparkline -->
<script src="plugins/sparkline/jquery.sparkline.min.js"></script>
<!-- jvectormap -->
<script src="plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script src="plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
<!-- SlimScroll 1.3.0 -->
<script src="plugins/slimScroll/jquery.slimscroll.min.js"></script>
<!-- ChartJS 1.0.1 -->
<script src="plugins/chartjs/Chart.min.js"></script>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="dist/js/pages/dashboard2.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="dist/js/demo.js"></script>
</body>
</html>
