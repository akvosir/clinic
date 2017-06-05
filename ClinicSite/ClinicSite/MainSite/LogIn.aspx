<%@ Page Title="" Language="C#" MasterPageFile="~/MainSite/Site1.Master" AutoEventWireup="true" CodeBehind="LogIn.aspx.cs" Inherits="ClinicSite.MainSite.LogIn" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Banner" runat="server">

    <nav class="navbar navbar-inverse">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-2"></div>
                <div class="col-md-4 navbar-header">
                    <a class="navbar-brand" style="font-size: 1.6em" href="LogIn.aspx">Районна поліклініка</a>


                </div>
                <ul class="col-md-6 nav navbar-nav">
                    <li class="active"><a href="LogIn.aspx">Головна</a></li>
                    <li><a href="DocInfo.aspx">Лікарі</a></li>
                    <li><a href="Contacts.aspx">Контакти</a></li>
                    <li><a class="overlay-container" data-toggle="modal" data-target="#room">Кабінет</a></li>
                    <li>
                        <div class="modal fade" id="room" role="dialog" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content small">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Закрити</span></button>
                                        <h4 class="modal-title">Кабінет</h4>
                                    </div>
                                    <div class="modal-body small">
                                        <asp:ScriptManager runat="server" ID="ScriptManager1"></asp:ScriptManager>
                                        <div class="form-group has-feedback">
                                            <label class="sr-only">Телефон</label>
                                            <asp:TextBox runat="server" type="text" ID="log_phone" CssClass="form-control" placeholder="+38 (ХХХ) ХХХ-ХХ-ХХ"></asp:TextBox>
                                            <ajaxToolkit:MaskedEditExtender ID="MaskedEditExtender1" runat="server" ClearMaskOnLostFocus="false" Mask="+999999999999" TargetControlID="log_phone" />                                            
                                            <asp:RequiredFieldValidator runat="server" Display="Dynamic" ErrorMessage="Поле повинно бути заповненим" ForeColor="#dd4242" Font-Size="12px" ControlToValidate="log_phone"></asp:RequiredFieldValidator>
                                        </div>
                                        <div class="form-group has-feedback">
                                            <label class="sr-only">Пароль</label>
                                            <asp:TextBox runat="server" type="password" ID="log_psswrd" CssClass="form-control" placeholder="Введіть пароль"></asp:TextBox>
                                            <asp:RequiredFieldValidator runat="server" ErrorMessage="Поле повинно бути заповненим" ForeColor="#dd4242" Font-Size="12px" ControlToValidate="log_psswrd"></asp:RequiredFieldValidator>
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
        <div class="container">
            <div class="row">
                <div class="col-md-8 col-md-offset-2 object-non-visible" data-animation-effect="fadeIn">
                    <div class="text-center">
                        <button class="btn btn-default">
                            <a data-toggle="modal" data-target="#Visit">Записатися на прийом</a>
                        </button>
                        <div class="modal fade" id="Visit" style="z-index: 999" role="dialog" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Закрити</span></button>
                                        <h4 class="modal-title">Записатися на прийом</h4>
                                    </div>
                                    <div class="modal-body">
                                        <h5 class="text-center">Для того, щоб записатися на прийом, Вам необхідно ввійти у Кабінет</h5>
                                        <button class="btn btn-default">
                                            <a data-toggle="modal" data-target="#room">Перейти в кабінет</a>
                                        </button>
                                        <a class="text-center" href="Registration.aspx">
                                            <h6>Вперше на сайті?</h6>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <h1 class="text-center">Районна поліклініка</h1>
                    <h2>
                        <p class="lead text-center">Вітаємо Вас на сайті районної поліклініки без черг.</p>
                    </h2>
                </div>
            </div>
        </div>
    </div>
</asp:Content>


