<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="projectlistforuser.aspx.cs" Inherits="timeLog.projectlistforuser" %>

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
    <style type="text/css">
        .auto-style1 {
            margin-right: 426px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
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
                    <li><a href="projectlistforuser.aspx">
                        <i class="uil uil-files-landscapes"></i>
                        <span class="list-group-item list-group-item-action list-group-item-primary">Project List</span>
                    </a></li>
                    <li><a href="employeedetailsforuser.aspx">
                        <i class="uil uil-chart"></i>
                        <span class="link-name">Employees List</span>
                    </a></li>
                    <li><a href="timesheet.aspx">
                        <i class="uil uil-thumbs-up"></i>
                        <span class="link-name">Timesheet</span>
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
                        <%--<a href="#">
                            <i class="uil uil-moon"></i>
                            <span class="link-name">Dark Mode</span>
                        </a--%>

                        <div class="mode-toggle" style="right: 270px; top: 229px">
                            <%--  <span class="switch"></span>--%>
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
                <a href="#"><b>Hello User</b></a>
                <!--<img src="images/profile.jpg" alt="">-->
            </div>

            <div class="dash-content">
                <div class="activity">
                    <div class="title">
                        <i class="uil uil-clock-three"></i>
                        <span class="text">Project Details</span>

                    </div>

                    <div class="activity-data" style="width: 72%">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="auto-style1" DataSourceID="SqlDataSource1" Height="236px" Width="804px" BackColor="Transparent" BorderColor="Black" BorderStyle="Solid" BorderWidth="2px" CellPadding="4" ForeColor="Black" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnRowDataBound="GridView1_RowDataBound">
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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TimesheetConnectionString %>" SelectCommand="SELECT [Project_Id], [Project_name], [Issuedate], [Status] FROM [master_project_table]"></asp:SqlDataSource>

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
        <script src="script.js"></script>

    </form>
</body>
</html>
