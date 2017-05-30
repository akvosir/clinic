<%@ Page Title="" Language="C#" MasterPageFile="~/Admin Pages/admin.Master" AutoEventWireup="true" CodeBehind="administrator_add.aspx.cs" Inherits="clinic.Admin_Pages.administrator_add" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderMenu" runat="server">
    <li>
        <a href="administration_new_user.aspx">
            <i class="pe-7s-note2"></i>
            <p>Створити нового користувача</p>
        </a>
    </li>
    <li>
        <a href="administrator_password_manag.aspx">
            <i class="pe-7s-note2"></i>
            <p>Управління паролями</p>

        </a>
    </li>
    <li>
        <a href="administration_rooms_manag.aspx">
            <i class="pe-7s-clock"></i>
            <p>Управління кабінетами лікаря</p>
        </a>
    </li>
    <li>
        <a href="administration_schedule_manag.aspx">
            <i class="pe-7s-clock"></i>
            <p>Управління розкладом лікаря</p>
        </a>
    </li>
    <li class="active">
        <a href="administrator_add.aspx">
            <i class="pe-7s-clock"></i>
            <p>Управління</p>
        </a>
    </li>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" runat="server">
    <div class="container-fluid">
        <div class="card">
            <div class="content">
                <div class="row">
                    <div class="col-md-12">

                        <div class="header">
                            <asp:Label runat="server" Font-Size="20px" Text="Управління чимось"></asp:Label>
                        </div>
                        <div class="content">
                            <div class="row">
                                <div class="col-md-8">
                                    <div class="form-group">
                                        <div class="input-group">
                                            <asp:TextBox runat="server" ID="admin_spectype" type="text" class="form-control" placeholder="Спеціаліст"></asp:TextBox>
                                            <span class="input-group-btn">
                                                <asp:Button runat="server" ID="submit_spectype" OnClick="submit_spectype_Click" type="button" class="btn btn-default" Text="Додати працівника"></asp:Button>
                                            </span>
                                        </div>
                                        <asp:RegularExpressionValidator runat="server" ValidationExpression="^[a-zA-Z''-'\s]{1,40}$"
                                            ControlToValidate="admin_spectype" ErrorMessage="Не повинно містити цифри!" ForeColor="#dd4242" Font-Size="11px"></asp:RegularExpressionValidator>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-8">
                                    <div class="form-group">
                                        <div class="input-group">
                                            <asp:TextBox runat="server" ID="admin_med" class="form-control" placeholder="Назва препарату"></asp:TextBox>
                                            <span class="input-group-btn">
                                                <asp:Button runat="server" ID="submit_med" OnClick="submit_med_Click" type="button" class="btn btn-default" Text="Додати препарат"></asp:Button>
                                            </span>
                                        </div>
                                        <asp:RegularExpressionValidator runat="server" ValidationExpression="[a-zA-Z/'/-\]+"
                                            ControlToValidate="admin_med" ErrorMessage="Не повинно містити цифри!" ForeColor="#dd4242" Font-Size="11px"></asp:RegularExpressionValidator>
                                    </div>
                                </div>
                            </div>


                            <div class="row">
                                <div class="col-md-8">
                                    <div class="form-group">
                                        <div class="input-group">
                                            <asp:TextBox runat="server" ID="admin_an" class="form-control" placeholder="Назва аналізу"></asp:TextBox>
                                            <span class="input-group-btn">
                                                <asp:Button runat="server" type="button" ID="submit_antype" OnClick="submit_antype_Click" class="btn btn-default" Text="Додати тип аналізу"></asp:Button>
                                            </span>
                                        </div>
                                        <asp:RegularExpressionValidator runat="server" ValidationExpression="^[a-zA-Z''-'\s]{1,40}$"
                                            ControlToValidate="admin_an" ErrorMessage="Не повинно містити цифри!" ForeColor="#dd4242" Font-Size="11px"></asp:RegularExpressionValidator>
                                    </div>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
