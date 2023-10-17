<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="userdashoard.aspx.cs" Inherits="timeLog.userdashoard" %>



<!DOCTYPE html>
<!--=== Coding by CodingLab | www.codinglabweb.com === -->
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <!----======== CSS ======== -->
    <link rel="stylesheet" href="style.css">
     
    <!----===== Iconscout CSS ===== -->
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">

    <title>User Dashboard Panel</title> 
</head>
<body>
    <nav>
        <div class="logo-name">
            <div class="logo-image">
                <!--<img src="images/logo.png" alt="">-->
                <a href="userdashoard.aspx">
                    <img src="images/VB-8.jpg" alt="" />
                </a>
            </div>

            <span class="logo_name">Vulcansbuild</span>
        </div>

        <div class="menu-items">
            <ul class="nav-links">
                <%-- <li><a href="#">
                    <i class="uil uil-estate"></i>
                    <span class="link-name">Dahsboard</span>
                </a></li>--%>
                <li><a href="projectlistforuser.aspx">
                    <i class="uil uil-files-landscapes"></i>
                    <span class="link-name">Project List</span>
                </a></li>
                <li><a href="employeedetailsforuser.aspx">
                    <i class="uil uil-chart"></i>
                    <span class="link-name">Employees List</span>
                </a></li>
                <li><a href="timesheet.aspx">
                    <i class="uil uil-thumbs-up"></i>
                    <span class="link-name">Timesheet</span>
                </a></li>
                <!--<li><a href="#">
                    <i class="uil uil-comments"></i>
                    <span class="link-name">Comment</span>
                </a></li>
                <li><a href="#">
                    <i class="uil uil-share"></i>
                    <span class="link-name">Share</span>
                </a></li>-->
            </ul>

            <ul class="logout-mode">
                <li><a href="Home.aspx">
                    <i class="uil uil-signout"></i>
                    <span class="link-name">Logout</span>
                </a></li>

                <li class="mode">
                    <%--<a href="#">
                        <i class="uil uil-moon"></i>     
                    <span class="link-name">Dark Mode</span>
                </a>--%>

                    <div class="mode-toggle">
                        <%--<span class="switch"></span>--%>
                    </div>
                </li>
            </ul>
        </div>
    </nav>

    <section class="dashboard">
        <div class="top">
            <i class="uil uil-bars sidebar-toggle"></i>

            <div class="search-box">
                <i class="uil uil-search"></i>
                <input type="text" placeholder="Search here...">
            </div>

            <a href="Userprofile.aspx">
                <b>Hello User</b>

            </a>
            <!--<img src="images/profile.jpg" alt="">-->
        </div>
        <%--        <div class="dash-content">
            <div class="overview">
                <div class="title">
                    <i class="uil uil-tachometer-fast-alt"></i>
                    <span class="text">Dashboard</span>
                </div>

                <div class="boxes">
                    <div class="box box1">
                        <!--<i class="uil uil-thumbs-up"></i>-->
                        <span class="text">Budget</span>
                        <span class="number" id="box1-content"></span>
                    </div>
                    <div class="box box2">
                        <!--<i class="uil uil-comments"></i>-->
                        <span class="text">Consumed</span>
                        <span class="number" id="box2-content"></span>
                    </div>
                    <div class="box box3">
                        <!--<i class="uil uil-share"></i>-->
                        <span class="text">Balance</span>
                        <span class="number" id="box3-content"></span>
                    </div>
                </div>
            </div>
           
            <div class="activity">
                <div class="title">
                    <i class="uil uil-clock-three"></i>
                    <span class="text" >Projects Details</span>
                </div>

                
                   

                </div>
           
        </div>--%>
    </section>

    <script src="script.js"></script>


</body>
</html>
