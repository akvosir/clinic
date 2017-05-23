﻿<%@ Page Title="" Language="C#" MasterPageFile="doctor.Master" AutoEventWireup="true" CodeBehind="doctor_schedule.aspx.cs" Inherits="clinic.Doctor_Pages.doctor_schedule" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMenu" runat="server">
    <li class="active">
        <a href="doctor_schedule.aspx">
            <i class="pe-7s-note2"></i>
            <p>Розклад</p>
        </a>
    </li>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="mainContentdoc" runat="server">
    <div class="col-md-16">
        <div class="card">
            <div class="header">
                <h4 class="title">РОЗКЛАД НА ДЕНЬ</h4>
                <asp:TextBox runat="server" type="text" ID="ff" class="form-control" placeholder="Оберіть дату"></asp:TextBox>
            </div>
            <div class="content">

                <div class="col-md-12">
                    <div class="card card-plain">
                        <div class="content table-responsive table-full-width">
                            <asp:GridView runat="server" ID="doc_schedule" AutoGenereteSelectButton="true" AutoGenerateColumns="false" Width="100%" CssClass="ui celled table" AllowPaging="true">
                                <Columns>
                                    <asp:BoundField DataField="start_app" DataFormatString="{0:t}" HeaderText="Час прийому" />
                                    <asp:TemplateField HeaderText="ПІБ">
                                        <ItemTemplate>
                                            <%# Eval("surname") + " " + Eval("name") + " " + Eval("fathers_name")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:LinkButton ID="start" OnClick="start_app_Click" runat="server" ItemStyle-Width="150">Розпочати прийом</asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:LinkButton ID="card" OnClick="patient_card_Click" runat="server" ItemStyle-Width="150">Картка</asp:LinkButton>
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
