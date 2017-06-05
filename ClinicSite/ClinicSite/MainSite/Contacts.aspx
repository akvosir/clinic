<%@ Page Title="" Language="C#" MasterPageFile="~/MainSite/Site1.Master" AutoEventWireup="true" CodeBehind="Contacts.aspx.cs" Inherits="ClinicSite.MainSite.Contacts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Banner" runat="server">
    <nav class="navbar navbar-inverse">
        <div class="container-fluid">
            <div class="row">
                <div class ="col-md-2"></div>
                <div class="col-md-4 navbar-header">
                    <a class="navbar-brand" style="font-size: 1.6em" href="LogIn.aspx">Районна поліклініка</a>                
                </div>
                <ul class="col-md-6 nav navbar-nav">
                    <li ><a href="LogIn.aspx">Головна</a></li>
                    <li><a href="DocInfo.aspx">Лікарі</a></li>
                    <li class="active"><a href="Contacts.aspx">Контакти</a></li>
                    <li><a class="overlay-container" data-toggle="modal" data-target="#room">Кабінет</a></li>
                    <li>
                        <div class="modal fade" id="room" role="dialog" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Закрити</span></button>
                                        <h4 class="modal-title">Кабінет</h4>
                                    </div>
                                    <div class="modal-body small">

                                        <div class="form-group has-feedback">
                                            <label class="sr-only">Телефон</label>
                                            <asp:TextBox runat="server" type="text" ID="log_phone" CssClass="form-control" placeholder="+38 (ХХХ) ХХХ-ХХ-ХХ"></asp:TextBox>                                            
                                        </div>
                                        <div class="form-group has-feedback">
                                            <label class="sr-only">Пароль</label>
                                            <asp:TextBox runat="server" type="password" ID="log_psswrd" CssClass="form-control" placeholder="Введіть пароль"></asp:TextBox>                                            
                                        </div>
                                        <asp:Button runat="server" Text="Ввійти" OnClick="LogInAcc_Click" ID="LogInAcc" CssClass="btn btn-primary btn-sm" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </nav>    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" runat="server">
    <div class="section">
        <h1 class="title text-center" id="contact">Контакти</h1>
        <div class="space"></div>
        
                <h2 class="large text-center">Ви можете зв'язатися з нами, зателефонувавши за номерами нижче</h2>
                <ul class="list-icons">
                    <li><i class="fa fa-map-marker pr-10"></i>  Адреса клініки</li>
                    <li><i class="fa fa-phone pr-10"></i>  +38 (ХХХ) ХХХ-ХХ-ХХ</li>
                    <li><i class="fa fa-phone pr-10"></i>  +38 (ХХХ) ХХХ-ХХ-ХХ </li>
                    <li><i class="fa fa-envelope-o pr-10"></i>  your@email.com</li>
                </ul>
            
    </div>
</asp:Content>
