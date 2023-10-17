<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admindashboard.aspx.cs" Inherits="timeLog.admindashboard" EnableEventValidation="false" %>

<!DOCTYPE html>
<!--=== Coding by CodingLab | www.codinglabweb.com === -->
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!----======== CSS ======== -->
    <%-- <link rel="stylesheet" href="style.css">--%>
    <link href="style.css" rel="stylesheet" />

    <!----===== Iconscout CSS ===== -->
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">

    <title>Admin Dashboard Panel</title>
    <style type="text/css">
        .auto-style1 {
            margin-left: 14px;
        }
        .auto-style2 {
            margin-left: 0;
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

                    <%--<img src="images/VB.jpeg" alt=""/>--%>
                </div>

                <span class="logo_name">Vulcansbuild</span>
            </div>

            <div class="menu-items">
                <ul class="nav-links">
                    <li><a href="admindashboard.aspx">
                        <i class="uil uil-estate"></i>
                        <span class="list-group-item list-group-item-action list-group-item-light">Dahsboard</span>
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

                    </a></li> <li><a href="exportreports.aspx">
                        <i class="uil uil-share"></i>
                        <span class="link-name">Export Reports</span>
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
                <a href="adminprofile.aspx"><b>Hello Admin</b></a>
                <!--<img src="images/profile.jpg" alt="">-->
            </div>

            <div class="dash-content">
                <div class="overview">
                    <div class="title">
                        <i class="uil uil-tachometer-fast-alt"></i>
                        <span class="text">Dashboard</span>
                    </div>

                    <div class="boxes">
                        <div class="box box1">
                            <!--<i class="uil uil-thumbs-up"></i>-->
                            <span class="text">Budget  (INR)</span>
                            <span class="number" id="box1"></span>
                        </div>
                        <div class="box box2">
                            <!--<i class="uil uil-comments"></i>-->
                            <span class="text">Consumed (INR)</span>
                            <span class="number" id="box2"></span>
                        </div>
                        <div class="box box3">
                            <!--<i class="uil uil-share"></i>-->
                            <span class="text">Balance (INR)</span>
                            <span class="number" id="box3"></span>
                        </div>
                    </div>
                </div>

                <div class="activity">
                    <div class="title">
                        <i class="uil uil-clock-three"></i>
                        <span class="text">Projects Details</span>
                    </div>

                    <div class="activity-data">

                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" AllowPaging="True" BackColor="Transparent" BorderColor="Black" BorderStyle="Solid" BorderWidth="2px" CellPadding="4" CssClass="auto-style1" Height="251px" Width="1091px" ForeColor="Black" CellSpacing="2" OnRowDataBound="GridView1_RowDataBound3">
                            <Columns>
                                <%--  <asp:CommandField ShowSelectButton="True" SelectText="Select" />--%>
                                <asp:TemplateField HeaderText="S.No" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="lblSerial" runat="server"></asp:Label>
                                    </ItemTemplate>

                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                </asp:TemplateField>

                                <asp:BoundField DataField="project_name" HeaderText="NAME" SortExpression="project_name" ItemStyle-HorizontalAlign="Center">
                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="issuedate" HeaderText="ISSUEDDATE" SortExpression="issuedate" ItemStyle-HorizontalAlign="Center" DataFormatString="{0:dd/MM/yyyy}">
                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="status" HeaderText="STATUS" SortExpression="status" ItemStyle-HorizontalAlign="Center">
                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                </asp:BoundField>

                                <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="View ">
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chk" runat="server" OnCheckedChanged="chk_CheckedChanged" ClientIDMode="Static" data-index='<%# Container.DataItemIndex %>' AutoPostBack="True" onchange="handleCheckBoxClick(this);" BorderColor="White" />
                                    </ItemTemplate>

                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                </asp:TemplateField>
                            </Columns>
                            <FooterStyle BackColor="#CCCCCC" />
                            <HeaderStyle BackColor="#3366CC" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="Transparent" ForeColor="Black" HorizontalAlign="Left" />
                            <RowStyle CssClass="clickable-row" />
                            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#F1F1F1" />
                            <SortedAscendingHeaderStyle BackColor="#808080" />
                            <SortedDescendingCellStyle BackColor="#CAC9C9" />
                            <SortedDescendingHeaderStyle BackColor="#383838" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TimesheetConnectionString %>" SelectCommand="SELECT [Project_Id], [Project_name], [Issuedate], [Status] FROM [master_project_table]"></asp:SqlDataSource>
                    </div>
                </div>
            </div>

        </section>

        <%-- <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chk" runat="server" OnCheckedChanged="chk_CheckedChanged" ClientIDMode="Static" data-index='<%# Container.DataItemIndex %>' AutoPostBack="True" onchange="handleCheckBoxClick(this);"  BorderColor="White" />
                                    </ItemTemplate>

<ItemStyle HorizontalAlign="Center"></ItemStyle>
                                </asp:TemplateField>--%>

        <script>
            function filterGridView() {
                var input, filter, table, tr, td, i, txtValue, noResultsMessage;
                input = document.getElementById("Username");
                filter = input.value.toUpperCase();
                table = document.getElementById("<%=GridView1.ClientID %>");
                tr = table.getElementsByTagName("tr");
                noResultsMessage = document.getElementById("noResultsMessage");

                // Reset the message
                noResultsMessage.style.display = "none";
                var found = false;

                for (i = 0; i < tr.length; i++) {
                    td = tr[i].getElementsByTagName("td")[1]; // Assuming the Project ID is in the second column
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
            function handleCheckBoxClick(checkbox) {
                var checkboxes = document.querySelectorAll('input[type="checkbox"]');
                var index = checkbox.getAttribute('data-index');

                // Uncheck all checkboxes except the clicked one
                checkboxes.forEach(function (chk, i) {
                    if (i != index) {
                        chk.checked = false;
                    }
                });
            }
        </script>


        <script src="script.js"></script>

    </form>
</body>
</html>
