<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="timesheet.aspx.cs" Inherits="timeLog.timesheet" EnableEventValidation="false" %>

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
    
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <style type="text/css">
        .auto-style2 {
            margin-left: 0px;
        }
        .auto-style3 {
            margin-left: 428px;
            margin-top: 0;
            width: 100px;
            height: 41px;
        }
    </style>
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
                        <span class="link-name">Project List</span>
                    </a></li>
                    <li><a href="employeedetailsforuser.aspx">
                        <i class="uil uil-chart"></i>
                        <span class="link-name">Employees List</span>
                    </a></li>
                    <li><a href="timesheet.aspx">
                        <i class="uil uil-thumbs-up"></i>
                        <span class="list-group-item list-group-item-action list-group-item-primary">Timesheet</span>
                    </a></li>
                  
                </ul>

                <ul class="logout-mode">
                    <li><a href="Home.aspx">
                        <i class="uil uil-signout"></i>
                        <span class="link-name">Logout</span>
                    </a></li>

                    <li class="mode">
                      

                        <div class="mode-toggle">
                          
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
                        <span class="text">Timesheet Details&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>
                        &nbsp;
                        <button id="btnOpenForm" type="button" class="auto-style3" style="border: 2px solid White; background-color: #6699FF; font-weight: bold; " onclick="openForm()">+</button>
                    </div>

                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="auto-style2" DataSourceID="SqlDataSource1" Height="303px" Width="907px" BorderColor="Black" BorderStyle="Solid" BorderWidth="2px" OnRowDataBound="GridView1_RowDataBound">
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
                            <asp:BoundField DataField="Task_desc" HeaderText="Task Desc" SortExpression="Task_desc" ItemStyle-HorizontalAlign="Center">
                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="Total_time" HeaderText="Total Time (Hrs)" SortExpression="Total_time" ItemStyle-HorizontalAlign="Center">
                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" ItemStyle-HorizontalAlign="Center" DataFormatString="{0:dd/MM/yyyy}">
                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="Emp_Id" HeaderText="Emp Id" SortExpression="Emp_Id" ItemStyle-HorizontalAlign="Center">
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
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TimesheetConnectionString %>"  SelectCommand="SELECT * FROM [transaction_timesheet_table] WHERE Emp_Id = @EmpId">
                        <SelectParameters>
                            <asp:Parameter Name="EmpId" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                </div>
            </div>

        </section>

        <dsiv id="popupForm" class="modal" method="POST">
            <div class="modal-content">
                <div class="form_container">
                    <formview name="form">
                        <div class="form_wrap form_grp">
                            <%--<div class="form_item">
                                <label>Project Id</label>
                                <input type="text" readonly="readonly" id="id" runat="server">
                            </div>--%>
                            <div class="form_item">
                                <label>Project Name</label>
                                <asp:DropDownList ID="ddlProjectNames" runat="server" Width="417px"   >
                                    <asp:ListItem Text=" Select " Value=""  runat="server" />
                                </asp:DropDownList>

                            </div>
                        </div>

                        <div class="form_wrap form_grp">
                            <div class="form_item">
                                <label>Date</label>
                                <input type="date" id="dt" runat="server">
                            </div>
                            <div class="form_item">
                                <label>Total Time(Hr)</label>
                                <input type="text" id="Time" runat="server">
                            </div>
                        </div>
                        <div class="form_wrap">
                            <div class="form_item">
                                <label>Task</label>
                                <input type="text" id="task" runat="server">
                            </div>
                        </div>
                        <div class="form_wrap">
                            <div class="form_item">
                                <label>Task Description</label>
                                <textarea id="TextArea1" cols="20" rows="5" style="width: 412px; height: 100px" draggable="false"  runat="server"></textarea>

                            </div>
                        </div>
                        <div class="btn">
                            <input type="submit" value="Submit">
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
