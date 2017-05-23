<%@ Page Title="" Language="C#" MasterPageFile="~/Reception Pages/Site.Master" AutoEventWireup="true" CodeBehind="reception_app.aspx.cs" Inherits="clinic.reception_app" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content5" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Content1" runat="server">
    <li>
        <a href="reception_cards.aspx">
            <i class="pe-7s-note2"></i>
            <p>Медичні картки</p>
        </a>
    </li>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Content2" runat="server">
    <li>
        <a href="reception_schedule.aspx">
            <i class="pe-7s-clock"></i>
            <p>Розклад</p>
        </a>
    </li>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="Content3" runat="server">
    <li class="active">
        <a href="reception_registration.aspx">
            <i class="pe-7s-graph"></i>
            <p>Реєстрація пацієнта</p>
        </a>
    </li>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="mainContent" runat="server">
    <div class="col-md-16">
        <div class="card">
            <div class="header">
                <h4 class="title">ЗАПИСАТИ НА ПРИЙОМ</h4>
            </div>

            <div class="content">
                <div class="row">
                    <div class="col-md-12">
                        <div class="header">
                            <asp:Label runat="server" ID="rec_app_patname"></asp:Label>
                        </div>
                        <div class="content"></div>
                        <asp:Label runat="server" Text="Обрати лікаря"></asp:Label>
                        <asp:DropDownList runat="server" type="text" AutoPostBack="true" DataValueField="id_doctor" DataTextField="name" ID="doctors" class="form-control"></asp:DropDownList>
                        <div class="row">
                            <div class="col-md-2">
                                <div class="form-group">
                                    <label>ДАТА</label>
                                    <asp:TextBox runat="server" type="date" ID="rec_app_date" class="form-control"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-2">
                                <div class="form-group">
                                    <label>ЧАС</label>
                                    <asp:TextBox runat="server" type="time"  ID="rec_app_time" class="form-control"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <asp:Button runat="server" Text="Зберегти запис" ID="save" OnClick="save_Click" class="btn btn-info btn-fill pull-left"></asp:Button>
                    </div>
                </div>

                <div class="footer-default"></div>


            </div>
            <div class="clearfix"></div>
        </div>
    </div>
</asp:Content>
