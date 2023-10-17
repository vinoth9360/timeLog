<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="projectlist.aspx.cs" Inherits="timeLog.projectlist" %>

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

    <title>Admin Dashboard Panel</title>

      <style >
        .modal {
    display: none;
    position: fixed;
    top: 0%;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.7);
    z-index: 1;
   
}

/* Style for the modal content */
.modal-content {
    position: absolute;
    top: 55%;
    left: 50%;
    transform: translate(-50%, -50%);
    background-color: #fff;
    padding: 20px;
    border: 1px solid #000;
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
          .auto-style4 {
              height: 38px;
              width: 192px;
          }
          .auto-style5 {
              width: 108%;
          }
          .auto-style6 {
              width: 107%;
          }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <nav>
            <div class="logo-name">
                <div class="logo-image">
                    <!--<img src="images/logo.png" alt="">-->

                    <a href="admindashboard.aspx">
                        <img src="images/VB-8.jpg" alt="" />
                    </a>
                </div>

                <span class="logo_name">Vulcansbuild</span>
            </div>

            <div class="menu-items">
                <ul class="nav-links">
                    <li><a href="admindashboard.aspx">
                        <i class="uil uil-estate"></i>
                        <span class="link-name">Dahsboard</span>
                    </a></li>
                    <li><a href="projectlist.aspx">
                        <i class="uil uil-files-landscapes"></i>
                        <span class="list-group-item list-group-item-action list-group-item-primary">Project List</span>
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
                        <span class="link-name">Export Reports</span>
                    </a></li>
                    <%-- <li><a href="#">
                    <i class="uil uil-thumbs-up"></i>
                    <span class="link-name">Timesheet</span>
                </a></li>--%>
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
                        <%-- <a href="#">
                            <i class="uil uil-moon"></i>
                            <span class="link-name">Dark Mode</span>
                        </a>--%>

                        <div class="mode-toggle">
                            <%-- <span class="switch"></span>--%>
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
                    <input type="text" placeholder="Search here..." oninput="filterGridView()" runat="server" id="Username">
                </div>
                <div id="noResultsMessage" style="display: none;">
                    Not exist!....
                </div>
                <a href="#"><b>Hello Admin</b></a>
                <!--<img src="images/profile.jpg" alt="">-->
            </div>

            <div class="dash-content">
                <div class="activity">
                    <div class="title">
                        <i class="uil uil-clock-three"></i>
                        <span class="text">Projects Details&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>

                        <button id="btnOpenForm" type="button" class="auto-style4" style="border: 2px solid White; background-color: #6699FF; font-weight: bold; " onclick="openForm()">Create new Project</button>

                    </div>

                    <div class="activity-data" style="width: 72%">

                        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Height="231px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged1" Width="881px" BorderColor="Black" BorderStyle="Solid" BorderWidth="2px" OnRowDataBound="GridView2_RowDataBound1">
                            <Columns>
                                <asp:TemplateField HeaderText="S.No" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="lblSerial" runat="server"></asp:Label>
                                    </ItemTemplate>

                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                </asp:TemplateField>
                                <asp:BoundField DataField="Project_name" HeaderText="Project Name" SortExpression="Project_name" ItemStyle-HorizontalAlign="Center">
                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="Budget" HeaderText="Budget (INR)" SortExpression="Budget" ItemStyle-HorizontalAlign="Center">
                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="Issuedate" HeaderText="Issued Date" SortExpression="Issuedate" ItemStyle-HorizontalAlign="Center" DataFormatString="{0:dd/MM/yyyy}">
                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" ItemStyle-HorizontalAlign="Center">
                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                </asp:BoundField>
                            </Columns>
                            <FooterStyle BackColor="#CCCCCC" />
                            <HeaderStyle BackColor="#3366CC" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="Transparent" ForeColor="Black" HorizontalAlign="Left" />
                            <RowStyle BackColor="Transparent" BorderColor="Black" />
                            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#F1F1F1" />
                            <SortedAscendingHeaderStyle BackColor="#808080" />
                            <SortedDescendingCellStyle BackColor="#CAC9C9" />
                            <SortedDescendingHeaderStyle BackColor="#383838" />
                        </asp:GridView>
                    </div>
                </div>
            </div>
            <label></label>
            <label></label>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TimesheetConnectionString %>" SelectCommand="SELECT * FROM [master_project_table]"></asp:SqlDataSource>

        </section>
        <dsiv id="popupForm" class="modal" method="POST">
            <div class="modal-content">
                <div class="form_container">
                    <formview name="form">
                        <div class="form_wrap form_grp">
                            <%--<div class="form_item">
                                <label>Project Id</label>
                                <input id="id" runat="server" type="text" readonly="readonly">
                            </div>--%>
                            <div class="form_item" style="width: 117%">
                                <label>Project Name</label>
                                  <input type="text" id="name" runat="server">
                            </div>
                        </div>

                        <div class="form_wrap form_grp">
                            <div class="form_item">
                                <label>Budget(INR)</label>
                                <input type="text" id="budget" runat="server" class="auto-style5">
                            </div>
                            <div class="form_item">
                                <label>Date</label>
                                <input type="date" id="dt" runat="server" class="auto-style6">
                            </div>
                            
                        </div>
                       
                        <div class="btn">
                            <input type="submit" value="Create">
                        </div>
                        <span class="close" onclick="closeForm()">&times;</span>
                    </formview>
                </div>
            </div>


            <!-- Add your form fields here -->

        </dsiv>
        
        <script>
            function filterGridView() {
                var input, filter, table, tr, td, i, txtValue, noResultsMessage;
                input = document.getElementById("Username");
                filter = input.value.toUpperCase();
                table = document.getElementById("<%= GridView2.ClientID %>");
                tr = table.getElementsByTagName("tr");
                noResultsMessage = document.getElementById("noResultsMessage");

                // Reset the message
                noResultsMessage.style.display = "none";
                var found = false;

                for (i = 0; i < tr.length; i++) {
                    td = tr[i].getElementsByTagName("td")[0]; // Assuming the Project ID is in the second column
                    if (td) {
                        txtValue = td.textContent || td.innerText;
                        if (txtValue.toUpperCase().indexOf(filter) > -1) {
                            tr[i].style.display = "";
                            found = true;
                        } else {
                            tr[i].style.display = "none";
                        }
                    }
                }

                // Display "No such project" message if no results found
                if (!found) {
                    noResultsMessage.style.display = "block";
                }
            }
        </script>
        <script>
            function openForm() {
                document.getElementById("popupForm").style.display = "block";
            }


            function closeForm() {
                document.getElementById("myForm").style.display = "none";
            }
        </script>
        <script>
            function openForm() {
                document.getElementById("popupForm").style.display = "block";
            }

            function closeForm() {
                document.getElementById("popupForm").style.display = "none";
            }

        </script>

        <script src="script.js"></script>

    </form>
</body>
</html>

