<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="reception_card_individual.aspx.cs" Inherits="clinic.reception_card_individual" %>

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
    <div class="col-md-16">
        <div class="card">
            <div class="header">
                <asp:Label runat="server"  ID="rci_name"></asp:Label>
                
            </div>  

            <div class="content">
                <ul role="tablist" class="nav nav-tabs">
                    <li role="presentation" class="active">
                        <a href="#general_info" aria-controls="general_info" role="tab" data-toggle="tab">Основна інформація</a>
                    </li>
                    <li>
                        <a href="#visits" aria-controls="visits" role="tab" data-toggle="tab">Історія візитів</a>
                    </li>
                </ul>

                <div class="tab-content">
                    <div id="general_info" role="tabpanel" class="tab-pane active">
                            <div class="row">
                                <div class="col-md-2">
                                    <div class="form-group">
                                        <label>Номер картки</label>
                                        <asp:TextBox  runat="server" type="text" id="rci_id" class="form-control" disabled/>
                                    </div>
                                </div>
                                </div>

                                <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>Дата народження</label>
                                        <asp:TextBox  runat="server" type="text" id="rci_birthday" class="form-control" disabled/>
                                    </div>
                                </div>
                                <div class="col-md-2">
                                    <div class="form-group">
                                        <label>Стать</label>
                                        <asp:TextBox  runat="server" type="text" id="rci_gender" class="form-control" placeholder="Стать" list="gender" />
                                        <datalist id="gender">
                                            <option>Жінка</option>
                                            <option>Чоловік</option>
                                        </datalist>
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Електронна пошта</label>
                                        <asp:TextBox  runat="server"  type="email" id="rci_email" class="form-control" placeholder="Email"/>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label>Адреса</label>
                                        <asp:TextBox runat="server"  type="text" id="rci_address" class="form-control" placeholder="Домашня адреса"/>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>Місто</label>
                                        <asp:TextBox  runat="server"  type="text" id="rci_city" class="form-control" placeholder="Місто"/>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>Поштовий індекс</label>
                                        <asp:TextBox  runat="server"  type="number" id="rci_zip" class="form-control" placeholder="Індекс"/>
                                    </div>
                                </div>
                                <!--ISPRAVIT'-->
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>Номер телефону</label>
                                        <asp:TextBox  runat="server" type="tel" id="rci_phonenumber" class="form-control" placeholder="Номер телефону"/>
                                    </div>
                                </div>

                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label>Хронічні хвороби</label>
                                        <textarea rows="5" id="rci_disease" class="form-control">Журба за Вкраїну</textarea>
                                    </div>
                                </div>
                            </div> 
                    </div>
                    <div id="visits" role="tabpanel" class="tab-pane">
                            <div class="content table-responsive table-full-width">
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                        <th>Дата візиту</th>
                                        <th>Лікар</th>
                                        <th>Результати</th>
                                         </tr>
                                    </thead>
                                    <tbody>
                                        
                                    </tbody>
                                </table>
                            </div>
                    </div>
                </div>
            </div>
        </div>
</asp:Content>
