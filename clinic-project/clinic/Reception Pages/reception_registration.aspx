<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="reception_registration.aspx.cs" Inherits="clinic.WebForm2" %>

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
                    <form>

                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Прізвище</label>
                                    <input type="text" name="rec_surname" class="form-control" placeholder="Прізвище" value="">
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Ім'я</label>
                                    <input type="text" name="rec_name" class="form-control" placeholder="Ім'я" value="">
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>По батькові</label>
                                    <input type="text" name="rec_fathers" class="form-control" placeholder="По батькові" value="">
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label>Стать</label>
                                    <input type="text" name="rec_gender" class="form-control" placeholder="Стать" list="gender">
                                    <datalist id="gender">
                                        <option>Жінка</option>
                                        <option>Чоловік</option>
                                    </datalist>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Дата народження</label>
                                    <input type="date" name="rec_birthday" class="form-control" placeholder="Дата" value="">
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Електронна пошта</label>
                                    <input type="email" name="rec_email" class="form-control" placeholder="Email">
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label>Адреса</label>
                                    <input type="text" name="rec_adress" class="form-control" placeholder="Домашня адреса" value="">
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Місто</label>
                                    <input type="text" name="rec_city" class="form-control" placeholder="Місто">
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Поштовий індекс</label>
                                    <input type="number" name="rec_zip" class="form-control" placeholder="Індекс">
                                </div>
                            </div>
                            <!--ISPRAVIT'-->
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Номер телефону</label>
                                    <input type="tel" name="rec_number" class="form-control" placeholder="Номер телефону">
                                </div>
                            </div>

                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label>Хронічні хвороби</label>
                                    <textarea rows="5" name="rec_diseases" class="form-control" placeholder=""></textarea>
                                </div>
                            </div>
                        </div>

                        <button type="submit" name="rec_submitButton" class="btn btn-info btn-fill pull-right">Додати пацієнта</button>
                        <div class="clearfix"></div>
                    </form>
                </div>
            </div>
        </div>
</asp:Content>
