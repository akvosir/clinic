<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebApplication1.WebForm1" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.maskedinput.js" type="text/javascript"></script>

<!-- Bootstrap core CSS     -->
<link href="~/assets/css/bootstrap.min.css" rel="stylesheet" />

<!-- Animation library for notifications   -->
<link href="~/assets/css/animate.min.css" rel="stylesheet" />

<!--  Light Bootstrap Table core CSS    -->
<link href="~/assets/css/light-bootstrap-dashboard.css" rel="stylesheet" />

<!--     Fonts and icons     -->
<link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
<link href="~/assets/css/pe-icon-7-stroke.css" rel="stylesheet" />
<link href="~/assets/css/pe-icon-7-stroke.css" rel="stylesheet" />
<!--   Core JS Files   -->
<script src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js" type="text/javascript"></script>
<script src="~/assets/js/bootstrap.min.js" type="text/javascript"></script>

<!--  Checkbox, Radio & Switch Plugins -->
<script src="~/assets/js/bootstrap-checkbox-radio-switch.js"></script>

<!--  Charts Plugin -->
<script src="~/assets/js/chartist.min.js"></script>

<!--  Notifications Plugin    -->
<script src="~/assets/js/bootstrap-notify.js"></script>

<!-- Light Bootstrap Table Core javascript and methods for Demo purpose -->
<script src="~/assets/js/light-bootstrap-dashboard.js"></script>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.6/semantic.min.css" rel="stylesheet" />
    <link type="text/css" href="https://cdn.datatables.net/1.10.15/css/dataTables.semanticui.min.css" rel="stylesheet" />

    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>

    <script type="text/javascript" src="https://cdn.datatables.net/1.10.15/js/dataTables.semanticui.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.6/semantic.min.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            $('#GridView1').dataTable();
        });
    </script>

</head>

<body>
    <form id="form1" runat="server">
        <telerik:RadScriptManager runat="server" id="RadScriptManager1" />
        <telerik:RadTimePicker  ID="RadTimePicker2" runat="server"></telerik:RadTimePicker>
        <div>
            <asp:GridView runat="server" ID="GridView1" AutoGenerateColumns="false" Width="100%" CssClass="ui celled table" AllowPaging="true">
                <Columns>
                    <asp:BoundField DataField="idpatient_card" HeaderText="ID" />
                    <asp:TemplateField HeaderText="ПІБ">
                        <ItemTemplate>
                            <%# Eval("surname") + " " + Eval("name") + " " + Eval("fathers_name")%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="birthday" DataFormatString="{0:dd-MM-yyyy}" HeaderText="Дата народження" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="card_Click" runat="server" ItemStyle-Width="150">Картка</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>



        </div>
    </form>
</body>


</html>
