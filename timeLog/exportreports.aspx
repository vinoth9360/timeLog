<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="exportreports.aspx.cs" Inherits="timeLog.exportrepotrs" %>

<!DOCTYPE html><!--=== Coding by CodingLab | www.codinglabweb.com === --><html lang="en"><head><meta charset="UTF-8"><meta http-equiv="X-UA-Compatible" content="IE=edge"><meta name="viewport" content="width=device-width, initial-scale=1.0"><!----======== CSS ======== --><%-- <link rel="stylesheet" href="style.css">--%><link href="style.css" rel="stylesheet" /><!----===== Iconscout CSS ===== --><link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css"><title>Admin Dashboard Panel</title><style type="text/css">
        /* Modal Styles */
/* Modal Styles */
.modal-content {
    position: absolute;
    top: 55%;
    left: 50%;
    transform: translate(-50%, -50%);
    background-color: #fff;
    padding: 20px;
    border: 1px solid #000;
    width:40%;
}

/* Style for the close button */
.close {
    position: absolute;
    top: 10px;
    right: 10px;
    font-size: 24px;
    cursor: pointer;
}
.form_container{
  background: #fff;
  padding: 30px;
  margin-top: 20px;
  border-radius: 3px;
}

.form_container .form_item{
  margin-bottom: 25px;
}

.form_container .form_wrap.form_grp{
  display: flex;
}

.form_container .form_wrap.form_grp .form_item{
  width: 50%;
}

.form_container .form_wrap.form_grp .form_item:first-child{
  margin-right: 4%;
}

.form_container .form_item label{
  display: block;
  margin-bottom: 5px;
}

.form_container .form_item input,
.form_container .form_item select{
  width: 100%;
  padding: 10px;
  font-size: 16px;
  border: 1px solid #dadce0;
  border-radius: 3px;
}
 
.form_container .btn input[type="submit"]{
  background: #6271f0;
  border: 1px solid #6271f0;
  padding: 10px;
  width: 100%;
  border-radius: 3px;
  cursor: pointer;
  color: #fff;
}

        .auto-style2 {
            width: 107%;
        }

        .auto-style3 {
            position: absolute;
            top: 13px;
            right: 10px;
            font-size: 24px;
            cursor: pointer;
        }

        </style></head><body><form id="form1" runat="server">
        <nav>
            <div class="logo-name">
                <div class="logo-image">
                    <!--<img src="images/logo.png" alt="">-->
                    <a href="admindashboard.aspx">
                        <img src="images/VB-8.jpg" alt="" />
                    </a>

                    <%--<img src="images/VB.jpeg" alt=""/>--%>
                </div>


            </div>

                <span class="logo_name">Vulcansbuild</span>
            

            <div class="menu-items">
                <ul class="nav-links">
                    <li><a href="admindashboard.aspx">
                        <i class="uil uil-estate"></i>
                        <span class="link-name">Dahsboard</span>
                    </a></li>
                    <li><a href="projectlist.aspx">
                        <i class="uil uil-files-landscapes"></i>
                        <span class="link-name">Project List</span>
                    </a></li>
                    <li><a href="employeelist.aspx">
                        <i class="uil uil-chart"></i>
                        <span class="link-name">Employees List</span>
                    </a></li>
                    <li><a href="Timesheeetdata.aspx">
                        <i class="uil uil-thumbs-up"></i>
                        <span class="link-name">Timesheet</span>

                    </a></li>
                    <li><a href="#">
                        <i class="uil uil-share"></i>
                        <span class="list-group-item list-group-item-action list-group-item-light">Export Reports</span>
                    </a></li>

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
                            <%--//<span class="switch"></span>--%>
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
                    <input type="text" id="Username" runat="server" placeholder="Search here..." oninput="filterGridView()">
                </div>

                <div id="noResultsMessage" style="display: none;">
                    !Such project is not found
                </div>
                <a href="#"><b>Hello Admin</b></a>
                <!--<img src="images/profile.jpg" alt="">-->
            </div>
            <div class="dash-content">
                <div class="activity">
                    <div class="title">
                        <i class="uil uil-share"></i>
                        <span class="text">Export Data</span>
                    </div>
                    <div class="activity-data">
                        <div id="popupForm" class="modal" method="POST">
                          <div class="modal-content">
                                <div class="form_container">
                                    <formview name="form">
                                        <div class="form_wrap form_grp">
                                             
                                            <div class="form_item" style="width: 100%">
                                                <label>Select Month</label>
                                                <input type="month" id="mnt" runat="server">
                                            </div>
                                            
                                        </div>
                                        <div class="form_wrap form_grp">
                                            <div class="form_item">
                                                <label>Project Data</label>
                                                <input type="radio" id="pjdata" runat="server" class="auto-style5" readonly="true" name="dataOption">
                                            </div>
                                            <div class="form_item">
                                                <label>Employee Data</label>
                                                <input type="radio" id="empdata" runat="server" class="auto-style5" readonly="true" name="dataOption">
                                            </div>

                                        </div>
                                        <div class="form_wrap form_grp">

                                            <div class="form_item" style="width: 100%">
                                                <label>Select Project</label>
                                                <asp:DropDownList ID="ddlProjectNames" runat="server" Width="417px">
                                                    <asp:ListItem Text=" Select " Value="" runat="server" />
                                                </asp:DropDownList>
                                            </div>

                                        </div> <div class="form_wrap form_grp">

                                            <%--<div class="form_item" style="width: 100%">
                                                <label>Select Employee</label>
                                                <asp:DropDownList ID="empNames" runat="server" Width="417px">
                                                    <asp:ListItem Text=" Select " Value="" runat="server" />
                                                </asp:DropDownList>
                                            </div>--%>

                                        </div>
                                        

                                        <div class="btn">
                                            <input type="submit" value="Export to excel" onclick="openForm()">
                                        </div>
<%--                                        <span class="close" onclick="closeForm()"></span>--%>
                                    </formview>
                                </div>
                            </div>
                            </div>
                                         
                       
                </div>
                </div>
            </div>
        </section>
                      
        <script src="script.js"></script>
         <script>
             function openForm() {
                 document.getElementById("popupForm1").style.display = "block";
             }


             function closeForm() {
                 document.getElementById("popupForm1").style.display = "none";
                 //window.location.href = "userdashoard.aspx";
             }
         </script>

    </form>
</body>
</html>

       
