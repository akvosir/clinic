<%@ Page Title="" Language="C#" MasterPageFile="doctor.Master" AutoEventWireup="true" CodeBehind="doctor_saved_results.aspx.cs" Inherits="clinic.Doctor_Pages.doctor_card_ind" %>

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
                <asp:Label runat="server" Font-Size="24px" ID="dsr_name"></asp:Label>
                <p>
                    <asp:Label runat="server" Font-Size="18px" ID="dsr_visit_date"></asp:Label>
                </p>
            </div>
            <div class="content">
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label>Причина відвідування</label>
                            <asp:TextBox runat="server" ID="dsr_reason" type="text" class="form-control" ReadOnly="true"></asp:TextBox>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label>Симптоми</label>
                            <asp:TextBox runat="server" ID="dsr_symptoms" type="text" class="form-control" ReadOnly="true"></asp:TextBox>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label>Діагноз</label>
                            <asp:TextBox runat="server" ID="dsr_diagnosis" type="text" class="form-control" ReadOnly="true"></asp:TextBox>
                        </div>
                    </div>
                </div>

                <label>Препарати</label>
                <asp:GridView runat="server" ID="dsr_med_table" AutoGenereteSelectButton="true" AutoGenerateColumns="false" Width="100%" CssClass="ui celled table" AllowPaging="true">
                    <Columns>
                        <asp:BoundField DataField="medicine_name" HeaderText="Назва препарату" />
                        <asp:BoundField DataField="howtotake" HeaderText="Спосіб прийому" />
                        <asp:BoundField DataField="start_med" DataFormatString="{0:dd-MM-yyyy}" HeaderText="Початок прийому" />
                        <asp:BoundField DataField="end_med" DataFormatString="{0:dd-MM-yyyy}" HeaderText="Кінець прийому" />
                    </Columns>
                </asp:GridView>
            </div>

            <div class="header">
                <h4>РЕКОМЕНДОВАНІ</h4>
            </div>
            <div class="content">
                <div class="col-md-12">
                    <div class="form-group">
                        <label>Консультація лікаря-спеціаліста</label>
                        <asp:TextBox runat="server" ID="dsr_consult" type="text" class="form-control" ReadOnly="true"></asp:TextBox>
                    </div>
                </div>


                <div class="col-md-12">
                    <div class="form-group">
                        <label>Аналіз</label>
                        <asp:TextBox runat="server" ID="dsr_analysis" type="text" class="form-control" ReadOnly="true"></asp:TextBox>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="form-group">
                        <label>Наступний прийом</label>
                        <asp:TextBox runat="server" ID="dsr_next_date" type="text" class="form-control" ReadOnly="true"></asp:TextBox>
                    </div>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
</asp:Content>
