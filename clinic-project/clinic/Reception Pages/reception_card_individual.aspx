﻿<%@ Page ValidateRequest="false" Title="" Language="C#" MasterPageFile="Site.Master" AutoEventWireup="true" CodeBehind="reception_card_individual.aspx.cs" Inherits="clinic.reception_card_individual" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content1" runat="server">
    <li class="active">
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
    <li>
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
                <asp:Label runat="server" Font-Size="24px" ID="rci_name"></asp:Label>
            </div>

            <div class="content">
                <div class="tab-content">
                    <div id="general_info">
                        <div class="row">
                            <div class="col-md-2">
                                <div class="form-group">
                                    <label>Номер картки</label>
                                    <asp:TextBox runat="server" type="text" ID="rci_id" class="form-control" ReadOnly="true" />
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <asp:Label runat="server" ID="rci_surnameLab" Text="Прізвище" Visible="false"></asp:Label>
                                    <asp:TextBox runat="server" Visible="false" type="text" AutoPostBack="true" ID="rci_surname" class="form-control" placeholder="Прізвище"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="rci_surname" ErrorMessage="Поле повинно бути заповненим" ForeColor="#dd4242" Font-Size="11px"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator runat="server" ValidationExpression="[^0-9]+$"
                                        ControlToValidate="rci_surname" ErrorMessage="Не повинно містити цифри!" ForeColor="#dd4242" Font-Size="11px"></asp:RegularExpressionValidator>
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="form-group">
                                    <asp:Label runat="server" ID="rci_nameLab" Text="Ім'я" Visible="false"></asp:Label>
                                    <asp:TextBox runat="server" Visible="false" type="text" ID="rci_editname" class="form-control" placeholder="Ім'я"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="rci_editname" ErrorMessage="Поле повинно бути заповненим" ForeColor="#dd4242" Font-Size="11px"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator runat="server" ValidationExpression="[^0-9]+$"
                                        ControlToValidate="rci_surname" ErrorMessage="Не повинно містити цифри!" ForeColor="#dd4242" Font-Size="11px"></asp:RegularExpressionValidator>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <asp:Label runat="server" ID="rci_fathnameLab" Text="По батькові" Visible="false"></asp:Label>
                                    <asp:TextBox runat="server" Visible="false" type="text" ID="rci_fathers" class="form-control" placeholder="По батькові"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="rci_fathers" ErrorMessage="Поле повинно бути заповненим" ForeColor="#dd4242" Font-Size="11px"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator runat="server" ValidationExpression="[^0-9]+$"
                                        ControlToValidate="rci_surname" ErrorMessage="Не повинно містити цифри!" ForeColor="#dd4242" Font-Size="11px"></asp:RegularExpressionValidator>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Дата народження</label>
                                    <asp:TextBox runat="server" type="text" ID="rci_birthday" class="form-control" ReadOnly="true" />
                                    <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="rci_birthday" />
                                    <asp:RequiredFieldValidator runat="server" Display="Dynamic" ErrorMessage="Поле повинно бути заповненим" ForeColor="#dd4242" Font-Size="12px" ControlToValidate="rci_birthday"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="form-group">
                                    <label>Стать</label>
                                    <asp:TextBox runat="server" type="text" ID="rci_gender" class="form-control" ReadOnly="true" />
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Електронна пошта</label>
                                    <asp:TextBox runat="server" type="email" ID="rci_email" class="form-control" placeholder="Email" ReadOnly="true" />
                                    
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Введіть дійсний e-mail!" ForeColor="#dd4242" Font-Size="11px"
                                ValidationGroup="vgSubmit" ControlToValidate="rci_email" CssClass="requiredFieldValidateStyle"
                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
                            </asp:RegularExpressionValidator>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label>Адреса</label>
                                    <asp:TextBox runat="server" type="text" ID="rci_address" class="form-control" ReadOnly="true" />
                                    <asp:RequiredFieldValidator runat="server" ErrorMessage="Поле повинно бути заповненим" ForeColor="#dd4242" Font-Size="11px" ControlToValidate="rci_address"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Місто</label>
                                    <asp:TextBox runat="server" type="text" ID="rci_city" class="form-control" ReadOnly="true" />
                                    <asp:RequiredFieldValidator runat="server" ErrorMessage="Поле повинно бути заповненим" ForeColor="#dd4242" Font-Size="11px" ControlToValidate="rci_city"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ErrorMessage="Не повинно містити цифри!" ForeColor="#dd4242" Font-Size="11px" ValidationGroup="vgSubmit"
                                        ControlToValidate="rci_city" CssClass="requiredFieldValidateStyle"
                                        ValidationExpression="[^0-9]+$">
                                    </asp:RegularExpressionValidator>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Поштовий індекс</label>
                                    <asp:TextBox runat="server" type="number" ID="rci_zip" class="form-control" ReadOnly="true" />
                                    <asp:RequiredFieldValidator runat="server" ErrorMessage="Поле повинно бути заповненим" ForeColor="#dd4242" Font-Size="11px" ControlToValidate="rci_zip"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ErrorMessage="Тільки цифри!" ForeColor="#dd4242" Font-Size="11px" ValidationGroup="vgSubmit"
                                        ControlToValidate="rci_zip" CssClass="requiredFieldValidateStyle"
                                        ValidationExpression="\d{5}">
                                    </asp:RegularExpressionValidator>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Номер телефону</label>
                                    <asp:TextBox runat="server" type="tel" ID="rci_phonenumber" class="form-control" ReadOnly="true" />
                                     <ajaxToolkit:MaskedEditExtender ID="MaskedEditExtender1" runat="server" ClearMaskOnLostFocus="false" Mask="+99(999) 999-99-99" TargetControlID="rci_phonenumber" />
                            <asp:RequiredFieldValidator runat="server" ErrorMessage="Поле повинно бути заповненим" ForeColor="#dd4242" Font-Size="11px" ControlToValidate="rci_phonenumber"></asp:RequiredFieldValidator>

                                </div>
                            </div>

                        </div>

                        <asp:Button runat="server" Text="Записати на прийом" type="button" ID="rci_app" OnClick="rci_app_Click" class="btn btn-info btn-fill"></asp:Button>
                        <asp:Button runat="server" Text="Змінити інформацію про пацієнта" OnClick="rci_edit_Click" type="button" ID="rci_edit" class="btn btn-info btn-fill"></asp:Button>
                        <asp:Button runat="server" Text="Зберегти" Visible="false" type="button" ID="rci_save" OnClick="rci_save_Click" class="btn btn-info btn-fill"></asp:Button>

                    </div>


                    <div class="container">
                        <h4>ІСТОРІЯ ВІЗИТІВ</h4>
                        <div class="card card-plain">
                            <asp:GridView runat="server" ID="visit_table" AutoGenereteSelectButton="true" AutoGenerateColumns="false" Width="100%" CssClass="ui celled table" AllowPaging="true">
                                <Columns>
                                    <asp:BoundField DataField="visit_date" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Дата візиту" />
                                    <asp:TemplateField HeaderText="Лікар">
                                        <ItemTemplate>
                                            <%# Eval("doctor_surname") + " " + Eval("doctor_name") + " " + Eval("doctor_fathersname")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:LinkButton ID="visitClick" runat="server" OnClick="visitClick_Click" ItemStyle-Width="150">Результати</asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
