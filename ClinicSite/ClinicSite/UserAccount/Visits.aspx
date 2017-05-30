<%@ Page Title="" Language="C#" MasterPageFile="User.Master" AutoEventWireup="true" CodeBehind="Visits.aspx.cs" Inherits="ClinicSite.Visits" %>

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

<asp:Content ID="Content4" ContentPlaceHolderID="LogOut" runat="server">
    <asp:LinkButton runat="server" ID="LogOut" OnClick="LogOut_Click">            
            <p>Вийти</p>
    </asp:LinkButton>
</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="mainContentdoc" runat="server">
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
</asp:Content>
