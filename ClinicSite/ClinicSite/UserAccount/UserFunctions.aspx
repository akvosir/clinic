<%@ Page Title="" Language="C#" MasterPageFile="User.Master" AutoEventWireup="true" CodeBehind="UserFunctions.aspx.cs" Inherits="ClinicSite.UserFunctions" %>

<asp:Content ID="Content1" ContentPlaceHolderID="UserNameHolder" runat="server">
    <div class="logo">
        <asp:Label ID="UserName" DataTextField="UserName" runat="server" />
    </div>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMenu" runat="server">
    <li>
        <asp:LinkButton runat="server" ID="docChoose" OnClick="docChoose_Click">
            
            <p>Записатися / Скасувати прийом</p>
        </asp:LinkButton>
    </li>
    <li>
        <asp:LinkButton runat="server" ID="visits" OnClick="visits_Click">
            
            <p>Мої візити</p>
        </asp:LinkButton>
    </li>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="LogOut" runat="server">
    <asp:LinkButton runat="server" ID="LogOut" OnClick="LogOut_Click">            
            <p>Вийти</p>
    </asp:LinkButton>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="mainContentdoc" runat="server">
    <div class="col-md-16">
        <div class="header" style="text-align: center">
            <h4 class="title">ДЯКУЄМО, ЩО ДОВІРИЛИСЬ НАМ!</h4>

            <p class="title">БАЖАЄМО ВАМ ГАРНОГО ДНЯ ТА МІЦНОГО ЗДОРОВ'Я</p>
        </div>
    </div>
</asp:Content>


