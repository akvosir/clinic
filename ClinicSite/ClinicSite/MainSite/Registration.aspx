<%@ Page Title="" Language="C#" MasterPageFile="~/MainSite/Site1.Master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="ClinicSite.MainSite.Registration" %>

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
                </ul>
            </div>
        </div>
    </nav>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" runat="server">
    <asp:ScriptManager runat="server" ID="ScriptManager1"></asp:ScriptManager>    
        <div class="section">
            <div class="container">
                <h1 class="text-center">Реєстрація</h1>
                <h2>
                    <p class="lead text-center">Вітаємо Вас на сайті районної поліклініки без черг. Для того, щоб записатися на прийом та кристуватися кабінетом користувача, Вам необхідно пройти реєстрацію.</p>
                    <p class="lead text-center">Якщо ви вже маєте обліковий запис, можете перейти у свій кабінет.</p>
                </h2>
                <div class="contBody">

                    <div class="row">
                        <div class="col-md-4">
                            <div class="form-group has-feedback">
                                <label class="sr-only">Призвище</label>
                                <asp:TextBox runat="server" type="text" ID="rec_surname" CssClass="form-control" placeholder="Прізвище"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="rec_surname" ErrorMessage="Поле повинно бути заповненим" ForeColor="#dd4242" Font-Size="12px"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator runat="server" ValidationExpression="[^0-9]+$"
                                    ControlToValidate="rec_surname" ErrorMessage="Не повинно містити цифри!" ForeColor="#dd4242" Font-Size="12px"></asp:RegularExpressionValidator>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group has-feedback">
                                <label class="sr-only">Ім'я</label>
                                <asp:TextBox runat="server" type="text" ID="rec_name" CssClass="form-control" placeholder="Ім'я"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ErrorMessage="Поле повинно бути заповненим" ForeColor="#dd4242" Font-Size="12px" ControlToValidate="rec_name"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator runat="server" ValidationExpression="[^0-9]+$"
                                    ControlToValidate="rec_name" ErrorMessage="Не повинно містити цифри!" ForeColor="#dd4242" Font-Size="12px"></asp:RegularExpressionValidator>

                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group has-feedback">
                                <label class="sr-only">Побатькові</label>
                                <asp:TextBox runat="server" type="text" ID="rec_fathers" CssClass="form-control" placeholder="По батькові"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ErrorMessage="Поле повинно бути заповненим" ForeColor="#dd4242" Font-Size="12px" ControlToValidate="rec_fathers"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator runat="server" ValidationExpression="[^0-9]+$"
                                    ControlToValidate="rec_fathers" ErrorMessage="Не повинно містити цифри!" ForeColor="#dd4242" Font-Size="12px"></asp:RegularExpressionValidator>

                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group has-feedback">
                                <asp:DropDownList ID="ddlGender" runat="server" class="form-control">
                                    <asp:ListItem Text="Жінка" Value="Жінка"></asp:ListItem>
                                    <asp:ListItem Text="Чоловік" Value="Чоловік"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group has-feedback">
                                <label class="sr-only">Дата народження</label>
                                <asp:TextBox runat="server" type="date" ID="rec_birthday" CssClass="form-control" placeholder="Дата"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" Display="Dynamic" ErrorMessage="Поле повинно бути заповненим" ForeColor="#dd4242" Font-Size="12px" ControlToValidate="rec_birthday"></asp:RequiredFieldValidator>

                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group has-feedback">
                                <label class="sr-only">Телефон</label>
                                <asp:TextBox runat="server" type="text" ID="rec_number" CssClass="form-control" placeholder="+38 (ХХХ) ХХХ-ХХ-ХХ"></asp:TextBox>
                                <ajaxToolkit:MaskedEditExtender ID="MaskedEditExtender1" runat="server" ClearMaskOnLostFocus="false" Mask="+99(999) 999-99-99" TargetControlID="rec_number" />
                                <asp:RequiredFieldValidator runat="server" ErrorMessage="Поле повинно бути заповненим" ForeColor="#dd4242" Font-Size="12px" ControlToValidate="rec_number"></asp:RequiredFieldValidator>
                                <asp:RequiredFieldValidator runat="server" Display="Dynamic" ErrorMessage="Поле повинно бути заповненим" ForeColor="#dd4242" Font-Size="12px" ControlToValidate="rec_number"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group has-feedback">
                                <label class="sr-only">Адреса</label>
                                <asp:TextBox runat="server" type="text" ID="rec_address" CssClass="form-control" placeholder="Домашня адреса"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ErrorMessage="Поле повинно бути заповненим" ForeColor="#dd4242" Font-Size="12px" ControlToValidate="rec_address"></asp:RequiredFieldValidator>

                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group has-feedback">
                                <label class="sr-only">Місто</label>
                                <asp:TextBox runat="server" type="text" ID="rec_city" CssClass="form-control" placeholder="Місто"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ErrorMessage="Поле повинно бути заповненим" ForeColor="#dd4242" Font-Size="12px" ControlToValidate="rec_city"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator runat="server" ErrorMessage="Не повинно містити цифри!" ForeColor="#dd4242" Font-Size="12px"
                                    ControlToValidate="rec_city" ValidationExpression="[^0-9]+$"></asp:RegularExpressionValidator>

                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group has-feedback">
                                <label class="sr-only">>Поштовий індекс</label>
                                <asp:TextBox runat="server" type="number" ID="rec_zip" CssClass="form-control" placeholder="Індекс"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ErrorMessage="Поле повинно бути заповненим" ForeColor="#dd4242" Font-Size="12px" ControlToValidate="rec_zip"></asp:RequiredFieldValidator>                   

                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group has-feedback">
                                <label class="sr-only">Пошта</label>
                                <asp:TextBox runat="server" type="email" ID="rec_email" CssClass="form-control" placeholder="Пошта"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Введіть дійсний e-mail!" ForeColor="#dd4242" Font-Size="12px"
                                    ValidationGroup="vgSubmit" ControlToValidate="rec_email" CssClass="requiredFieldValidateStyle"
                                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
                                </asp:RegularExpressionValidator>

                                <asp:RequiredFieldValidator runat="server" Display="Dynamic" ErrorMessage="Поле повинно бути заповненим" ForeColor="#dd4242" Font-Size="12px" ControlToValidate="rec_email"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group has-feedback">
                                <label class="sr-only">Пароль</label>
                                <asp:TextBox runat="server" type="password" ID="reg_psswrd" CssClass="form-control" placeholder="Введіть пароль"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ErrorMessage="Поле повинно бути заповненим" ForeColor="#dd4242" Font-Size="12px" ControlToValidate="rec_zip"></asp:RequiredFieldValidator>
                            </div>
                        </div>                        
                        <div class="col-md-12">
                            <asp:Button runat="server" Text="Відправити данні" OnClick="Register_Click" ID="Register" CssClass="btn btn-default pull-right" />
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>   
</asp:Content>
