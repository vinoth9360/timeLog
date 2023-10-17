<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Timesheeetdata.aspx.cs" Inherits="timeLog.Timesheeetdata" %>

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
                        <span class="list-group-item list-group-item-action list-group-item-light">Timesheet</span>
                    </a></li>
                    <li><a href="#">
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
                    Not Exist!!!..
                </div>
                <a href="#"><b>Hello Admin</b></a>
                <!--<img src="images/profile.jpg" alt="">-->
            </div>

            <div class="dash-content">
                <div class="activity">
                    <div class="title">
                        <i class="uil uil-clock-three"></i>
                        <span class="text">Timesheet Details</span>
                    </div>
                </div>
            </div>
            <div class="activity-data">

                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Width="984px" Height="241px" BorderColor="Black" BorderStyle="Solid" BorderWidth="2px" OnRowDataBound="GridView1_RowDataBound1">
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
                        <asp:BoundField DataField="Task" HeaderText="Task" SortExpression="Task" ItemStyle-HorizontalAlign="Center">
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="Task_desc" HeaderText="Task Description" SortExpression="Task_desc" ItemStyle-HorizontalAlign="Center">
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="Total_time" HeaderText="Total Time" SortExpression="Total_time" ItemStyle-HorizontalAlign="Center">
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" ItemStyle-HorizontalAlign="Center" DataFormatString="{0:dd/MM/yyyy}">
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="Emp_Id" HeaderText="Emp Id" SortExpression="Emp_Id" ItemStyle-HorizontalAlign="Center" DataFormatString="{0:dd/MM/yyyy}">
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
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TimesheetConnectionString %>" SelectCommand="SELECT [Project_Id], [Project_name], [Task], [Task_desc], [Total_time], [Date], [Emp_Id] FROM [transaction_timesheet_table]"></asp:SqlDataSource>

            </div>
        </section>
        <script>
            function filterGridView() {
                var input, filter, table, tr, td, i, txtValue, noResultsMessage;
                input = document.getElementById("Username");
                filter = input.value.toUpperCase();
                table = document.getElementById("<%= GridView1.ClientID %>");
                tr = table.getElementsByTagName("tr");
                noResultsMessage = document.getElementById("noResultsMessage");

                // Reset the message
                noResultsMessage.style.display = "none";
                var found = false;

                for (i = 0; i < tr.length; i++) {
                    td = tr[i].getElementsByTagName("td")[6]; // Assuming the Project ID is in the second column
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
        <script src="script.js"></script>

    </form>
</body>
</html>
