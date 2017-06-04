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
                            <asp:TextBox runat="server" ID="app_spec_date" AutoPostBack="true" OnTextChanged="app_spec_date_TextChanged" type="date" class="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="app_spec_date" ErrorMessage="*"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label>ОБРАТИ СПЕЦІАЛІСТА</label>
                            <asp:DropDownList runat="server" ID="app_spec" DataValueField="id_specialty" AutoPostBack="True"  OnSelectedIndexChanged="app_spec_SelectedIndexChanged" DataTextField="name_specialty" class="form-control"></asp:DropDownList>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label>ОБРАТИ ЛІКАРЯ</label>
                            <asp:DropDownList runat="server" ID="app_spec_name" AutoPostBack="true" OnSelectedIndexChanged="app_spec_name_SelectedIndexChanged" DataValueField="id_doctor" DataTextField="name" type="text" class="form-control"></asp:DropDownList>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-2">
                        <div class="form-group">
                            <label>ЧАС</label>
                            <telerik:RadTimePicker ID="RadTimePicker1" runat="server"  AutoPostBack="true"></telerik:RadTimePicker>    
                             <asp:RequiredFieldValidator runat="server" ControlToValidate="RadTimePicker1" ErrorMessage="*"></asp:RequiredFieldValidator>
                        </div>                       
                    </div>
                    </div>
    </form>
</body>


</html>
