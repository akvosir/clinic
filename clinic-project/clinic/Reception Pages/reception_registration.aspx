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
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label>Ім'я</label>
                                <asp:TextBox runat="server" type="text" ID="rec_name" class="form-control" placeholder="Ім'я"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label>По батькові</label>
                                <asp:TextBox runat="server" type="text" ID="rec_fathers" class="form-control" placeholder="По батькові"></asp:TextBox>
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
                                <asp:TextBox runat="server" type="date" ID="rec_birthday" class="form-control" placeholder="Дата"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="exampleInputEmail1">Електронна пошта</label>
                                <asp:TextBox runat="server" type="email" ID="rec_email" class="form-control" placeholder="Email"></asp:TextBox>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label>Адреса</label>
                                <asp:TextBox runat="server" type="text" ID="rec_address" class="form-control" placeholder="Домашня адреса"></asp:TextBox>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-4">
                            <div class="form-group">
                                <label>Місто</label>
                                <asp:TextBox runat="server" type="text" ID="rec_city" class="form-control" placeholder="Місто"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label>Поштовий індекс</label>
                                <asp:TextBox runat="server" type="number" ID="rec_zip" class="form-control" placeholder="Індекс"></asp:TextBox>
                            </div>
                        </div>
                        <!--ISPRAVIT'-->
                        <div class="col-md-4">
                            <div class="form-group">
                                <label>Номер телефону</label>
                                <asp:TextBox runat="server" type="text" ID="rec_number" class="form-control" placeholder="Номер телефону"></asp:TextBox>
                            </div>
                        </div>

                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label>Хронічні хвороби</label>
                                <textarea rows="5" id="rec_diseases" class="form-control" placeholder=""></textarea>
                            </div>
                        </div>
                    </div>

                    <asp:Button runat="server" Text="Додати пацієнта" OnClick="rec_submitButton_Click" type="submit" ID="rec_submitButton" class="btn btn-info btn-fill pull-right"></asp:Button>
                    <div class="clearfix"></div>
            </div>
        </div>
    </div>
</asp:Content>

