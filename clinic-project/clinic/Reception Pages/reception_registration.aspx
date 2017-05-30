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

<asp:Content ID="Content4" ContentPlaceHolderID="mainContent" runat="server">
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
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="rec_surname" ErrorMessage="Поле повинно бути заповненим" ForeColor="#dd4242" Font-Size="11px"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator runat="server" ValidationExpression="[^0-9]+$" 
                                ControlToValidate="rec_surname" ErrorMessage="Не повинно містити цифри!" ForeColor="#dd4242" Font-Size="11px"></asp:RegularExpressionValidator>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label>Ім'я</label>
                            <asp:TextBox runat="server" type="text" ID="rec_name" class="form-control" placeholder="Ім'я"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ErrorMessage="Поле повинно бути заповненим" ForeColor="#dd4242" Font-Size="11px" ControlToValidate="rec_name"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator runat="server" ValidationExpression="[^0-9]+$"
                                ControlToValidate="rec_name" ErrorMessage="Не повинно містити цифри!" ForeColor="#dd4242" Font-Size="11px"></asp:RegularExpressionValidator>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label>По батькові</label>
                            <asp:TextBox runat="server" type="text" ID="rec_fathers" class="form-control" placeholder="По батькові"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server"  ErrorMessage="Поле повинно бути заповненим" ForeColor="#dd4242" Font-Size="11px" ControlToValidate="rec_fathers"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator runat="server" ValidationExpression="[^0-9]+$" 
                                ControlToValidate="rec_fathers" ErrorMessage="Не повинно містити цифри!" ForeColor="#dd4242" Font-Size="11px"></asp:RegularExpressionValidator>
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
                            <asp:TextBox runat="server" ID="rec_birthday" class="form-control" placeholder="Дата"></asp:TextBox>
                            <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="rec_birthday"/>
                            <asp:RequiredFieldValidator runat="server" Display="Dynamic" ErrorMessage="Поле повинно бути заповненим" ForeColor="#dd4242" Font-Size="12px" ControlToValidate="rec_birthday"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label>Електронна пошта</label>
                            <asp:TextBox runat="server" ID="rec_email" class="form-control" placeholder="Email"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Введіть дійсний e-mail!" ForeColor="#dd4242" Font-Size="11px"
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
                            <asp:RequiredFieldValidator runat="server" ErrorMessage="Поле повинно бути заповненим" ForeColor="#dd4242" Font-Size="11px" ControlToValidate="rec_address"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-4">
                        <div class="form-group">
                            <label>Місто</label>
                            <asp:TextBox runat="server" type="text" ID="rec_city" class="form-control" placeholder="Місто"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ErrorMessage="Поле повинно бути заповненим" ForeColor="#dd4242" Font-Size="11px" ControlToValidate="rec_city"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ErrorMessage="Не повинно містити цифри!" ForeColor="#dd4242" Font-Size="11px" ValidationGroup="vgSubmit" 
                                ControlToValidate="rec_city" CssClass="requiredFieldValidateStyle"
                                ValidationExpression="[^0-9]+$">
                            </asp:RegularExpressionValidator>
                        </div>
                    </div>
                    
                    <div class="col-md-4">
                        <div class="form-group">
                            <label>Поштовий індекс</label>
                            <asp:TextBox runat="server" ID="rec_zip" class="form-control" placeholder="Індекс"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ErrorMessage="Поле повинно бути заповненим" ForeColor="#dd4242" Font-Size="11px" ControlToValidate="rec_zip"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ErrorMessage="Тільки цифри!" ForeColor="#dd4242" Font-Size="11px" ValidationGroup="vgSubmit" 
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
                            <asp:RequiredFieldValidator runat="server" ErrorMessage="Поле повинно бути заповненим" ForeColor="#dd4242" Font-Size="11px" ControlToValidate="rec_number"></asp:RequiredFieldValidator>
                        </div>

                    </div>

                </div>
                <asp:Button runat="server" Text="Додати пацієнта" OnClick="rec_submitButton_Click" type="submit" ID="rec_submitButton" class="btn btn-info btn-fill pull-right"></asp:Button>
                <div class="clearfix"></div>

            </div>
        </div>
    </div>
</asp:Content>

