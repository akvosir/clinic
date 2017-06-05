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
        <asp:ScriptManager runat="server"></asp:ScriptManager>
         <div class="row">
                    <div class="col-md-2">
                        <div class="form-group">
                            <label>ДАТА</label>
                            <asp:TextBox runat="server" Width="500" ID="app_spec_date" AutoPostBack="true" type="text" class="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="app_spec_date" ErrorMessage="*"></asp:RequiredFieldValidator>
                        </div>
                    </div>

                        <div class="form-group">
                            <label>ДАТА</label>
                            <asp:TextBox runat="server" Width="500" ID="TextBox1" AutoPostBack="true" type="time" class="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="app_spec_date" ErrorMessage="*"></asp:RequiredFieldValidator>
                        </div>
                    </div>
 
                        <div class="form-group">
                            <label>ДАТА</label>
                            <asp:TextBox runat="server" Width="500" ID="TextBox2" AutoPostBack="true" type="time" class="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="app_spec_date" ErrorMessage="*"></asp:RequiredFieldValidator>
                        </div>
  

        
               

        <asp:Button ID="Button1" runat="server" CausesValidation="false" OnClick="Button1_Click" Text="Button" />
    </form>
</body>


</html>
