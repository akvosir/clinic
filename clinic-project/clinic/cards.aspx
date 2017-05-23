﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cards.aspx.cs" Inherits="clinic.cards" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta charset="utf-8" />
    <link rel="icon" type="image/png" href="assets/img/favicon.ico">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />


    <!-- Bootstrap core CSS     -->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Animation library for notifications   -->
    <link href="assets/css/animate.min.css" rel="stylesheet" />

    <!--  Light Bootstrap Table core CSS    -->
    <link href="assets/css/light-bootstrap-dashboard.css" rel="stylesheet" />

    <!--     Fonts and icons     -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300' rel='stylesheet' type='text/css'>
    <link href="assets/css/pe-icon-7-stroke.css" rel="stylesheet" />
    <link href="assets/css/pe-icon-7-stroke.css" rel="stylesheet" />
    <link type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.6/semantic.min.css" rel="stylesheet" />
    <link type="text/css" href="https://cdn.datatables.net/1.10.15/css/dataTables.semanticui.min.css" rel="stylesheet" />

    <script type="text/javascript" language="javascript" src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script type="text/javascript" language="javascript" src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>

    <script type="text/javascript" language="javascript" src="https://cdn.datatables.net/1.10.15/js/dataTables.semanticui.min.js"></script>
    <script type="text/javascript" language="javascript" src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.6/semantic.min.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            $('#GridView1').dataTable();
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="wrapper">
            <div class="sidebar" data-color="blue" data-image="assets/img/sidebar-2.jpg">
                <div class="sidebar-wrapper">
                    <div class="logo">PERSON'S NAME</div>
                    <ul class="nav">
                        <li>
                            <a href="reception_registration.aspx">
                                <i class="pe-7s-graph"></i>
                                <p>Реєстрація пацієнта</p>
                            </a>
                        </li>
                        <li>
                            <a href="reception_registration.aspx">
                                <i class="pe-7s-graph"></i>
                                <p>Реєстрація пацієнта</p>
                            </a>
                        </li>
                        <li>
                            <a href="reception_registration.aspx">
                                <i class="pe-7s-graph"></i>
                                <p>Реєстрація пацієнта</p>
                            </a>
                        </li>
                    </ul>


                </div>
            </div>

            <div class="main-panel">
                <nav class="navbar navbar-default navbar-fixed">
                    <div class="container-fluid">
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle" data-toggle="collapse">
                                <span class="sr-only">Toggle navigation</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                            <a class="navbar-brand" href="#">Dashboard</a>
                        </div>
                        <div class="collapse navbar-collapse">
                            <ul class="nav navbar-nav navbar-left">
                                <li>
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                        <i class="fa fa-dashboard"></i>
                                    </a>
                                </li>
                            </ul>

                            <ul class="nav navbar-nav navbar-right">
                                <li>
                                    <a href="">Account
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>


                <div class="content">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-16">
        <div class="card">
            <div class="content">
                    <div class="col-md-12">
                        <div class="card card-plain">

                            <asp:GridView runat="server" ID="GridView1" AutoGenerateColumns="false" Width="100%" AllowPaging="true">
                                <Columns>
                                    <asp:BoundField DataField="idpatient_card" HeaderText="ID" />
                                    <asp:BoundField DataField="name" HeaderText="name" />
                                    <asp:BoundField DataField="birthday" HeaderText="birthday" />
                                </Columns>
                            </asp:GridView>

                        </div>
                    </div>
                    <div class="clearfix"></div>
            </div>
        </div>
    </div>
                        </div>
                    </div>
                </div>


                <footer class="footer">
                    <div class="container-fluid">
                        <nav class="pull-left">
                            <ul>
                                <li>
                                    <a href="#">Home
                                    </a>
                                </li>

                            </ul>
                        </nav>
                        <p class="copyright pull-right">
                            &copy;
                            <script>document.write(new Date().getFullYear())</script>
                            CHANGE NAME
                        </p>
                    </div>
                </footer>

            </div>
        </div>

    </form>
</body>

<!--   Core JS Files   -->
<script src="assets/js/jquery-1.10.2.js" type="text/javascript"></script>
<script src="assets/js/bootstrap.min.js" type="text/javascript"></script>

<!--  Checkbox, Radio & Switch Plugins -->
<script src="assets/js/bootstrap-checkbox-radio-switch.js"></script>

<!--  Charts Plugin -->
<script src="assets/js/chartist.min.js"></script>

<!--  Notifications Plugin    -->
<script src="assets/js/bootstrap-notify.js"></script>

<!-- Light Bootstrap Table Core javascript and methods for Demo purpose -->
<script src="assets/js/light-bootstrap-dashboard.js"></script>
</html>