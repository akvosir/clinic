<%@ Page Title="" Language="C#" MasterPageFile="~/MainSite/Site1.Master" AutoEventWireup="true" CodeBehind="LogIn.aspx.cs" Inherits="ClinicSite.MainSite.LogIn" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Banner" runat="server">

    <nav class="navbar navbar-inverse">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-2"></div>
                <div class="col-md-4 navbar-header">
                    <a class="navbar-brand" style="font-size: 1.6em" href="#">Районна поліклініка</a>
                    <a href="#banner">
                        <img id="logo" src="" alt="Лого">
                    </a>

                </div>
                <ul class="col-md-6 nav navbar-nav">
                    <li class="active"><a href="LogIn.aspx">Головна</a></li>
                    <li><a href="LogIn.aspx">Лікарі</a></li>
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
    <div class="main">
        <div class="section">
            <div class="container">
                <div class="row">
                    <div class="col-md-8 col-md-offset-2 object-non-visible" data-animation-effect="fadeIn" >
                        <div class="text-center">
                            <button class="btn btn-default">
                                <a class="overlay-container" data-toggle="modal" data-target="#Visit">Записатися на прийом</a>
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
                                                <a class="overlay-container" data-toggle="modal" data-target="#room">Перейти в кабінет</a>
                                            </button>
                                            <a class="overlay-container" data-toggle="modal" data-target="#FirstTime">
                                                <h6 class="text-center">Вперше на сайті?</h6>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal fade" id="FirstTime" style="padding-top: 100px" tabindex="-1" role="dialog"  aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content" data-spy="scroll">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Закрити</span></button>
                                            <h4 class="modal-title">Реєстрація</h4>
                                        </div>
                                        <div class="modal-body" >

                                            <div class="form-group has-feedback">
                                                <asp:RadioButtonList ID="ddlGender" CssClass="radioButtonList" runat="server" RepeatDirection="Horizontal">
                                                    <asp:ListItem Text="Жінка" Value="Жінка" />
                                                    <asp:ListItem Text="Чоловік" Value="Чоловік" />
                                                </asp:RadioButtonList>
                                            </div>
                                            <div class="form-group has-feedback">
                                                <label class="sr-only">Призвище</label>
                                                <asp:TextBox runat="server" type="text" ID="rec_surname" CssClass="form-control" placeholder="Прізвище"></asp:TextBox>
                                               
                                            </div>
                                            <div class="form-group has-feedback">
                                                <label class="sr-only">Ім'я</label>
                                                <asp:TextBox runat="server" type="text" ID="rec_name" CssClass="form-control" placeholder="Ім'я"></asp:TextBox>
                                                
                                            </div>
                                            <div class="form-group has-feedback">
                                                <label class="sr-only">Побатькові</label>
                                                <asp:TextBox runat="server" type="text" ID="rec_fathers" CssClass="form-control" placeholder="По батькові"></asp:TextBox>
                                                
                                            </div>
                                            <div class="form-group has-feedback">
                                                <label class="sr-only">Дата народження</label>
                                                <asp:TextBox runat="server" type="date" ID="rec_birthday" CssClass="form-control" placeholder="Дата"></asp:TextBox>
                                                
                                            </div>
                                            <div class="form-group has-feedback">
                                                <label class="sr-only">Телефон</label>
                                                <asp:TextBox runat="server" type="text" ID="rec_number" CssClass="form-control" placeholder="+38 (ХХХ) ХХХ-ХХ-ХХ"></asp:TextBox>
                                            
                                            </div>
                                            <div class="form-group has-feedback">
                                                <label class="sr-only">Адреса</label>
                                                <asp:TextBox runat="server" type="text" ID="rec_address" CssClass="form-control" placeholder="Домашня адреса"></asp:TextBox>
                                                
                                            </div>
                                            <div class="form-group has-feedback">
                                                <label class="sr-only">Місто</label>
                                                <asp:TextBox runat="server" type="text" ID="rec_city" CssClass="form-control" placeholder="Місто"></asp:TextBox>
                                                
                                            </div>
                                            <div class="form-group has-feedback">
                                                <label class="sr-only">>Поштовий індекс</label>
                                                <asp:TextBox runat="server" type="number" ID="rec_zip" CssClass="form-control" placeholder="Індекс"></asp:TextBox>
                                                
                                            </div>
                                            <div class="form-group has-feedback">
                                                <label class="sr-only">Пошта</label>
                                                <asp:TextBox runat="server" type="email" ID="rec_email" CssClass="form-control" placeholder="Пошта"></asp:TextBox>
                                         
                                            </div>
                                            <div class="form-group has-feedback">
                                                <label class="sr-only">Пароль</label>
                                                <asp:TextBox runat="server" type="password" ID="reg_psswrd" CssClass="form-control" placeholder="Введіть пароль"></asp:TextBox>
                                                
                                            </div>


                                            <asp:Button runat="server" Text="Відправити данні" OnClick="Register_Click" ID="Register" CssClass="btn btn-default" />
                                            <div class="clearfix"></div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <h1 class="text-center">Назва клініки</h1>
                        <h2>
                            <p class="lead text-center">Короткий опис клініки.</p>
                        </h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>


