<%@ Page Title="" Language="C#" MasterPageFile="User.Master" AutoEventWireup="true" CodeBehind="reception_saved_results.aspx.cs" Inherits="ClinicSite.reception_saved_results" %>

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
    <div class="col-md-16">
        <div class="card">
            <div class="header">
                <asp:Label runat="server" Font-Size="24px" ID="rsr_name"></asp:Label>
                <p>
                    <asp:Label runat="server" Font-Size="18px" ID="rsr_visit_date"></asp:Label></p>
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
                            <asp:TextBox runat="server" ID="rsr_diagnosis" type="text" class="form-control" ReadOnly="true"></asp:TextBox>
                        </div>
                    </div>
                </div>

                <div id="medicine_t">
                    <label>Препарати</label>
                    <asp:GridView runat="server" ID="rsr_med_table" AutoGenereteSelectButton="true" AutoGenerateColumns="false" Width="100%" CssClass="ui celled table" AllowPaging="true">
                        <Columns>
                            <asp:BoundField DataField="medicine_name" HeaderText="Назва препарату" />
                            <asp:BoundField DataField="howtotake" HeaderText="Спосіб прийому" />
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
