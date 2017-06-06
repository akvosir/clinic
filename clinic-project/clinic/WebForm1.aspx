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
        <div class="col-md-16">
            <div class="card card-plain">
                <div class="header">
                    <p class="category">Препарати</p>
                </div>
                <div class="row">
                    <div class="col-md-4">
                        <div class="form-group">
                            <asp:DropDownList runat="server" ID="medicine" DataValueField="id_medicine" DataTextField="medicine_name"  class="form-control"></asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <asp:TextBox runat="server" type="text" ID="med_take" class="form-control" placeholder="Спосіб прийому"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="form-group">
                            <asp:TextBox runat="server" type="date" ID="med_st" class="form-control" placeholder="Початок прийому"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="form-group">
                            <asp:TextBox runat="server" type="date" ID="med_en" class="form-control" placeholder="Кінець прийому"></asp:TextBox>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-4">
                        <div class="form-group">
                            <asp:DropDownList runat="server" ID="medicine1" DataValueField="id_medicine" DataTextField="medicine_name" class="form-control"></asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <asp:TextBox runat="server" type="text" ID="med_take1" class="form-control" placeholder="Спосіб прийому"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="form-group">
                            <asp:TextBox runat="server" type="date" ID="med_st1" class="form-control" placeholder="Початок прийому"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="form-group">
                            <asp:TextBox runat="server" type="date" ID="med_en1" class="form-control" placeholder="Кінець прийому"></asp:TextBox>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-4">
                        <div class="form-group">
                            <asp:DropDownList runat="server" ID="medicine2" DataValueField="id_medicine" DataTextField="medicine_name"  class="form-control"></asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <asp:TextBox runat="server" type="text" ID="med_take2" class="form-control" placeholder="Спосіб прийому"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="form-group">
                            <asp:TextBox runat="server" type="date" ID="med_st2" class="form-control" placeholder="Початок прийому"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="form-group">
                            <asp:TextBox runat="server" type="date" ID="med_en2" class="form-control" placeholder="Кінець прийому"></asp:TextBox>
                        </div>
                    </div>
                </div>

                <asp:Button runat="server" OnClick="Button1_Click" />
            </div>
        </div>
    </form>
</body>


</html>
