<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="clinic.WebForm1" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

</head>

<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

        <telerik:RadTimePicker ID="RadTimePicker1" runat="server" AutoPostBack="true"></telerik:RadTimePicker>

        <asp:TextBox runat="server" ID="date" type="date" OnTextChanged="date_TextChanged"></asp:TextBox>
        <asp:Button runat="server" OnClick="Unnamed_Click"/>
        <asp:TextBox runat="server" ID="doc_id" ></asp:TextBox>
    </form>
</body>


</html>
