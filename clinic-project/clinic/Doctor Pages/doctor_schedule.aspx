<%@ Page Title="" Language="C#" MasterPageFile="doctor.Master" AutoEventWireup="true" CodeBehind="doctor_schedule.aspx.cs" Inherits="clinic.Doctor_Pages.doctor_schedule" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMenu" runat="server">
    <li class="active">
        <a href="doctor_schedule.aspx">
            <i class="pe-7s-note2"></i>
            <p>Розклад</p>
        </a>
    </li>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderMain" runat="server">
    <div class="col-md-16">
        <div class="card">
            <div class="header">
                <h2 class="title">РОЗКЛАД НА ДЕНЬ</h2>
            </div>
            <div class="content">

                <div class="col-md-12">
                    <div class="card card-plain">

                        <asp:TextBox runat="server" type="date" ID="date_bar" OnTextChanged="date_bar_TextChanged" AutoPostBack="true" class="form-control" placeholder="Оберіть дату"></asp:TextBox>


                        <div class="content table-responsive table-full-width">
                            <asp:GridView runat="server" ID="doc_schedule" AutoGenereteSelectButton="true" AutoGenerateColumns="false" Width="100%" CssClass="ui celled table" AllowPaging="true">
                                <Columns>
                                    <asp:BoundField DataField="idpatient_card" HeaderText="Номер картки" />
                                    <asp:BoundField DataField="start_app" DataFormatString="{0:t}" HeaderText="Час прийому" />
                                    <asp:TemplateField HeaderText="ПІБ">
                                        <ItemTemplate>
                                            <%# Eval("surname") + " " + Eval("name") + " " + Eval("fathers_name")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:LinkButton runat="server" ID="start" OnClick="start_app_Click" ItemStyle-Width="150">Розпочати прийом</asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:LinkButton ID="card" CommandName="card_clicked" OnClick="patient_card_Click" runat="server" ItemStyle-Width="150">Картка</asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>

                <div class="clearfix"></div>
            </div>
        </div>
    </div>
</asp:Content>
