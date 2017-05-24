<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="UserFunctions.aspx.cs" Inherits="ClinicSite.UserFunctions" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderMenu" runat="server">
    <li>
        <asp:LinkButton runat="server" ID="docChoose" OnClick="docChoose_Click">
            <i class="pe-7s-note2"></i>
            <p>Записатися на прийом</p>
        </asp:LinkButton>
    </li>
    <li>
        <asp:LinkButton runat="server" ID="visits" OnClick="visits_Click">
            <i class="pe-7s-note2"></i>
            <p>Мої візити</p>
        </asp:LinkButton>
    </li>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContentdoc" runat="server">
    <div class="col-md-16">
        <div class="header" style ="text-align:center ">
            <h4 class="title">ДЯКУЄМО, ЩО ДОВІРИЛИСЬ НАМ!</h4>
            <br>
            <p class="title">БАЖАЄМО ВАМ ГАРНОГО ДНЯ ТА МІЦНОГО ЗДОРОВ'Я</p>
        </div>
    </div>
</asp:Content>
