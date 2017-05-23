<%@ Page Title="" Language="C#" MasterPageFile="Site.Master" AutoEventWireup="true" CodeBehind="reception_saved_results.aspx.cs" Inherits="clinic.WebForm5" %>

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
                    <asp:Label runat="server" Font-Size="24px" ID="rsr_name"></asp:Label>
                    <p><asp:Label runat="server" Font-Size="18px" ID="rsr_visit_date"></asp:Label></p>
                </div>
                <div class="content">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label>Причина відвідування</label>
                                <asp:TextBox runat="server" ID="rsr_reason" type="text" class="form-control" ReadOnly="true"></asp:TextBox>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label>Симптоми</label>
                                <asp:TextBox runat="server" ID="rsr_symptoms" type="text" class="form-control" ReadOnly="true"></asp:TextBox>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label>Діагноз</label>
                                <asp:TextBox runat="server" id="rsr_diagnosis" type="text" class="form-control" ReadOnly="true"></asp:TextBox>
                            </div>
                        </div>
                    </div>

                    <div id="medicine_t">
                            <label>Препарати</label>
                            <asp:GridView runat="server" ID="rsr_med_table" AutoGenereteSelectButton="true" AutoGenerateColumns="false" Width="100%" CssClass="ui celled table" AllowPaging="true">
                                <Columns>
                                    <asp:BoundField DataField="medicine_name"  HeaderText="Назва препарату" />
                                    <asp:BoundField DataField="start_med" DataFormatString="{0:dd-MM-yyyy}" HeaderText="Початок прийому" />
                                    <asp:BoundField DataField="end_med" DataFormatString="{0:dd-MM-yyyy}" HeaderText="Кінець прийому" />
                                </Columns>
                            </asp:GridView>
                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <h4>РЕКОМЕНДОВАНІ</h4>
                                <label>Консультація лікаря-спеціаліста</label>
                                <asp:TextBox runat="server" ID="rsr_consult" type="text" class="form-control" ReadOnly="true"></asp:TextBox>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label>Аналіз</label>
                                <asp:TextBox runat="server" ID="rsr_analysis" type="text" class="form-control" placeholder="Аналізи" ReadOnly="true"></asp:TextBox>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-4">
                            <div class="form-group">
                                <label>Наступний прийом</label>
                                <asp:TextBox runat="server" ID="rsr_next_date" type="text" class="form-control" ReadOnly="true"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>

            </div>
    </div>
</asp:Content>
