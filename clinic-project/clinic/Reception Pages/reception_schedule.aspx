<%@ Page Title="" Language="C#" MasterPageFile="Site.Master" AutoEventWireup="true" CodeBehind="reception_schedule.aspx.cs" Inherits="clinic.WebForm3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content1" runat="server">
    <li>
        <a href="reception_cards.aspx">
            <i class="pe-7s-note2"></i>
            <p>Медичні картки</p>
        </a>
    </li>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Content2" runat="server">
    <li class="active">
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
    <div class="container-fluid">
        <div class="card">
            <div class="content">
                <div class="row">

                    <div class="col-md-12">
                        <div class="form-group">
                            <label>ВИБЕРІТЬ ДАТУ</label>
                            <asp:TextBox runat="server" ID="dateTB" class="form-control" type="date"></asp:TextBox>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="form-group">
                            <label>ВИБЕРІТЬ ЛІКАРЯ</label>
                            <asp:DropDownList runat="server" ID="doc" DataValueField="id_doctor" DataTextField="name" class="form-control"></asp:DropDownList>
                        </div>
                    </div>

                    <div class="content">
                        <asp:Button runat="server" ID="submit" OnClick="submit_Click" Text="Переглянути дописи" class="btn btn-info btn-fill pull-left" />
                        <div class="clearfix"></div>
                    </div>

                    <div class="content">
                        <asp:GridView runat="server" ID="GridView1" AutoGenereteSelectButton="true" AutoGenerateColumns="false" Width="100%" CssClass="ui celled table" AllowPaging="true">
                            <Columns>
                                <asp:BoundField DataField="start_app" DataFormatString="{0:t}" HeaderText="Час" />
                                <asp:TemplateField HeaderText="Пацієнт">
                                    <ItemTemplate>
                                        <%# Eval("surname") + " " + Eval("name") + " " + Eval("fathers_name")%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="card_Click" OnClick="card_Click_Click" runat="server" ItemStyle-Width="150">Відмінити прийом</asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
