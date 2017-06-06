<%@ Page Title="" Language="C#" MasterPageFile="Site.Master" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="reception_registration.aspx.cs" Inherits="clinic.reception_registration" %>

<asp:Content runat="server" ID="scripts" ContentPlaceHolderID="Content5">
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="Content1" runat="server">
    <li>
        <a href="reception_cards.aspx">
            <i class="pe-7s-note2"></i>
            <p>Медичні картки</p>
        </a>
    </li>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Content2" runat="server">
    <li>
        <a href="reception_schedule.aspx">
            <i class="pe-7s-clock"></i>
            <p>Розклад</p>
        </a>
    </li>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Content3" runat="server">
    <li class="active">
        <a href="reception_registration.aspx">
            <i class="pe-7s-graph"></i>
            <p>Реєстрація пацієнта</p>
        </a>
    </li>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolderMain" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="col-md-16">
        <div class="card">
            <div class="header">
                <h4 class="title">РЕЄСТРАЦІЯ ПАЦІЄНТА</h4>
            </div>
            <div class="content">
                <div class="row">
                    <div class="col-md-4">
                        <div class="form-group">
                            <label>Прізвище</label>
                            <asp:TextBox runat="server" type="text" ID="rec_surname" class="form-control" placeholder="Прізвище"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="rec_surname" ErrorMessage="Поле повинно бути заповненим!" ForeColor="#dd4242" Font-Size="11px"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator runat="server" ValidationExpression="^[\s\S][^0-9]{3,20}$"
                                ControlToValidate="rec_surname" ErrorMessage="Введіть більше 3 знаків без цифр!" ForeColor="#dd4242" Font-Size="11px"></asp:RegularExpressionValidator>
                       </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label>Ім'я</label>
                            <asp:TextBox runat="server" type="text" ID="rec_name" class="form-control" placeholder="Ім'я"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ErrorMessage="Поле повинно бути заповненим!" Display="Dynamic" ForeColor="#dd4242" Font-Size="11px" ControlToValidate="rec_name"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator runat="server" ValidationExpression="^[\s\S][^0-9]{3,20}$"
                                ControlToValidate="rec_name" ErrorMessage="Введіть більше 3 знаків без цифр!" ForeColor="#dd4242" Font-Size="11px"></asp:RegularExpressionValidator>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label>По батькові</label>
                            <asp:TextBox runat="server" type="text" ID="rec_fathers" class="form-control" placeholder="По батькові"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ErrorMessage="Поле повинно бути заповненим!" Display="Dynamic" ForeColor="#dd4242" Font-Size="11px" ControlToValidate="rec_fathers"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator runat="server" ValidationExpression="^[\s\S][^0-9]{3,20}$"
                                ControlToValidate="rec_fathers" ErrorMessage="Введіть більше 3 знаків без цифр!" Display="Dynamic" ForeColor="#dd4242" Font-Size="11px"></asp:RegularExpressionValidator>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-4">
                        <div class="form-group">
                            <label>Стать</label>
                            <asp:DropDownList ID="ddlGender" runat="server" class="form-control">
                                <asp:ListItem Text="Жінка" Value="Жінка"></asp:ListItem>
                                <asp:ListItem Text="Чоловік" Value="Чоловік"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label>Дата народження</label>
                            <asp:TextBox runat="server" ID="rec_birthday" class="form-control" type="date" Text=" " placeholder="Дата"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" Display="Dynamic" ErrorMessage="Поле повинно бути заповненим!" ForeColor="#dd4242" Font-Size="12px" ControlToValidate="rec_birthday"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label>Електронна пошта</label>
                            <asp:TextBox runat="server" ID="rec_email" class="form-control" placeholder="Email"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" Display="Dynamic" runat="server" ErrorMessage="Введіть дійсний e-mail!" ForeColor="#dd4242" Font-Size="11px"
                                ValidationGroup="vgSubmit" ControlToValidate="rec_email" CssClass="requiredFieldValidateStyle"
                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
                            </asp:RegularExpressionValidator>
                        </div>
                    </div>
                </div>
            
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label>Адреса</label>
                            <asp:TextBox runat="server" type="text" ID="rec_address" class="form-control" placeholder="Домашня адреса"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ErrorMessage="Поле повинно бути заповненим!" Display="Dynamic" ForeColor="#dd4242" Font-Size="11px" ControlToValidate="rec_address"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator runat="server" Display="Dynamic" ValidationExpression="^[\s\S]{10,}$" 
                                ControlToValidate="rec_address" ErrorMessage="Введіть більше 10 знаків" ForeColor="#dd4242" Font-Size="11px"></asp:RegularExpressionValidator>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-4">
                        <div class="form-group">
                            <label>Місто</label>
                            <asp:DropDownList ID="rec_cit" runat="server" class="form-control">
                                <asp:ListItem Text="Дніпро" Value="Дніпро"></asp:ListItem>
                                <asp:ListItem Text="Львів" Value="Львів"></asp:ListItem>
                                <asp:ListItem Text="Київ" Value="Київ"></asp:ListItem>
                                <asp:ListItem Text="Одеса" Value="Одеса"></asp:ListItem>
                                <asp:ListItem Text="Харків" Value="Харків"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        </div>
                    
                    <div class="col-md-4">
                        <div class="form-group">
                            <label>Поштовий індекс</label>
                            <asp:TextBox runat="server" ID="rec_zip" class="form-control" placeholder="Індекс"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" Display="Dynamic" ErrorMessage="Поле повинно бути заповненим!" ForeColor="#dd4242" Font-Size="11px" ControlToValidate="rec_zip"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator Display="Dynamic" ID="RegularExpressionValidator6" runat="server" ErrorMessage="Тільки цифри!" ForeColor="#dd4242" Font-Size="11px" ValidationGroup="vgSubmit" 
                                ControlToValidate="rec_zip" CssClass="requiredFieldValidateStyle"
                                ValidationExpression="\d{5}">
                            </asp:RegularExpressionValidator>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="form-group">
                            <label>Номер телефону</label>
                            <asp:TextBox runat="server" type="text" ID="rec_number" class="form-control" placeholder="Номер телефону"></asp:TextBox>
                            <ajaxToolkit:MaskedEditExtender ID="MaskedEditExtender1" runat="server" ClearMaskOnLostFocus="false" Mask="+99(999) 999-99-99" TargetControlID="rec_number" />
                            <asp:RequiredFieldValidator runat="server" Display="Dynamic" ErrorMessage="Поле повинно бути заповненим" ForeColor="#dd4242" Font-Size="11px" ControlToValidate="rec_number"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-4">
                        <div class="form-group">
                            <label>Пароль для входу на сайт</label>
                            <asp:TextBox runat="server" type="password" ID="rec_password" class="form-control" placeholder="Пароль"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" Display="Dynamic" ErrorMessage="Поле повинно бути заповненим" ForeColor="#dd4242" Font-Size="11px" ControlToValidate="rec_password"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator runat="server" ValidationExpression="[a-z || A-Z || 0-9\w\.\-]{5,20}$" ControlToValidate="rec_password" ErrorMessage="Більше 5 символів латиницею!" ForeColor="#dd4242" Font-Size="11px"></asp:RegularExpressionValidator>
                        </div>
                    </div>
                </div>

                <asp:Button runat="server" Text="Додати пацієнта" OnClick="rec_submitButton_Click" type="submit" ID="rec_submitButton" class="btn btn-info btn-fill pull-right"></asp:Button>
                <div class="clearfix"></div>

            </div>
            </div>
    </div>
</asp:Content>

