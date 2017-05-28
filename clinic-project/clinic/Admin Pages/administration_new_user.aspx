<%@ Page Title="" Language="C#" MasterPageFile="~/Admin Pages/admin.Master" AutoEventWireup="true" CodeBehind="administration_new_user.aspx.cs" Inherits="clinic.administration_new_user" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMenu" runat="server">
    <li class="active">
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
    <li>
        <a href="administration_schedule_manag.aspx">
            <i class="pe-7s-clock"></i>
            <p>Управління</p>
        </a>
    </li>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolderMain" runat="server">
    <div class="container-fluid">
        <div class="card">
            <div class="content">
                <div class="row">
                    <div class="col-md-12">
                        <div class="content">
                            <div class="row">
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <asp:Label runat="server">Прізвище </asp:Label>
                                        <asp:TextBox runat="server" ID="admin_surname" type="text" class="form-control" placeholder="Прізвище"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="col">
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <asp:Label runat="server">Ім`я </asp:Label>
                                            <asp:TextBox runat="server" ID="admin_name" class="form-control" placeholder="Ім`я"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <div class="col">
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <asp:Label runat="server">По батькові </asp:Label>
                                            <asp:TextBox runat="server" ID="admin_fathers" class="form-control" placeholder="По батькові"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <asp:Label runat="server">Логін</asp:Label>
                                        <asp:TextBox runat="server" ID="admin_login" type="text" class="form-control" placeholder="Логін"></asp:TextBox>
                                    </div>
                                </div>


                                <div class="col-md-3">
                                    <div class="form-group">
                                        <asp:Label runat="server">Пароль</asp:Label>
                                        <asp:TextBox runat="server" ID="admin_password" type="text" class="form-control" placeholder="Пароль"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="col-md-3">
                                    <asp:Label runat="server">Тип працівника</asp:Label>
                                    <asp:DropDownList runat="server" ID="adm_type" class="form-control" AutoPostBack="true" OnSelectedIndexChanged="admin_dspec_SelectedIndexChanged">
                                        <asp:ListItem Text="Працівник реєстратури" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="Лікар" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="Адміністратор" Value="3"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                        </div>

                        <div class="row">
                            <div class="col-md-3">
                                <asp:DropDownList runat="server" ID="admin_dspec" Visible="false" class="form-control" DataTextField="name_specialty" DataValueField="id_specialty"></asp:DropDownList>
                            </div>
                            <div class="col-md-3">
                                <asp:TextBox runat="server" type="text" ID="admin_droom" Visible="false" class="form-control" placeholder="Номер кабінету"></asp:TextBox>
                            </div>
                        </div>

                         <asp:Button runat="server" type="button" ID="submit_staff" OnClick="submit_staff_Click" class="btn btn-info btn-fill pull-right" Text="Додати працівника"></asp:Button>
                         <div class="clearfix"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
