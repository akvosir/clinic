<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="clinic.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button  runat="server" ID="butt" OnClick="butt_Click" />
             <asp:TextBox runat="server" type="text" ID="rci_gender" class="form-control"/>
             <asp:TextBox runat="server" type="text" ID="TextBox1" class="form-control"/>
             <asp:TextBox runat="server" type="text" ID="TextBox2" class="form-control"  />
             <asp:TextBox runat="server" type="text" ID="TextBox3" class="form-control" />

        </div>
    </form>
</body>
</html>
