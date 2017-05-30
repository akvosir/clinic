<%@ Page  validateRequest="false" Title="" Language="C#" MasterPageFile="Site.Master" AutoEventWireup="true" CodeBehind="reception_cards.aspx.cs" Inherits="clinic.reception_cards" %>

<asp:Content ID="Con" ContentPlaceHolderID="Content5" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $('#GridView1').DataTable();
        });
    </script>
</asp:Content>

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
                <div class="col-md-12">
                    <div class="card card-plain">

                        <div class="input-group">
                            <asp:TextBox runat="server" ID="search_txt" type="text" class="form-control" placeholder="Пошук по пацієнтам"></asp:TextBox>
                            <div class="input-group-btn">
                                <asp:Button runat="server" ID="search_btn" OnClick="search_btn_Click" class="btn btn-default" type="submit" Text="O\"></asp:Button>
                            </div>
                        </div>

                        <asp:GridView runat="server" ID="GridView1" PageSize="15 " AutoGenereteSelectButton="true" AutoGenerateColumns="false" OnPageIndexChanging="GridView1_PageIndexChanging" Width="100%" CssClass="ui celled table" AllowPaging="true">
                            <Columns>
                                <asp:BoundField DataField="idpatient_card" HeaderText="ID" />
                                <asp:TemplateField HeaderText="ПІБ">
                                    <ItemTemplate>
                                        <%# Eval("surname") + " " + Eval("name") + " " + Eval("fathers_name")%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="birthday" DataFormatString="{0:dd-MM-yyyy}" HeaderText="Дата народження" />
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="card_Click" runat="server" OnClick="card_Click" ItemStyle-Width="150">Картка</asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
</asp:Content>
