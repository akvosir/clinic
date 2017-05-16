<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="reception_cards.aspx.cs" Inherits="clinic.reception_cards" %>

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
            <div class="content">
                <form>
                    <div class="col-md-12">
                        <div class="card card-plain">
                            <table id="table_id" class="ui celled table" cellspacing="0" width="100%">
                                <thead>
                                    <tr>
                                    <th>№</th>
                                    <th>ПІБ</th>
                                    <th>Дата народження</th>
                                    <th>Картка пацієнта</th>
                                    </tr>
                                </thead>
                                <tbody>
                                     <%=getWhileLoopData()%>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </form>
            </div>
        </div>
    </div>
</asp:Content>
