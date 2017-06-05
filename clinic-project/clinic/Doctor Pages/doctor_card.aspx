<%@ Page Title="" Language="C#" MasterPageFile="doctor.Master" AutoEventWireup="true" CodeBehind="doctor_card.aspx.cs" Inherits="clinic.Doctor_Pages.doctor_card" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMenu" runat="server">
    <li class="active">
        <asp:LinkButton runat="server" ID="sc" OnClick="sc_Click">
            <i class="pe-7s-note2"></i>
            <p>Розклад</p>
        </asp:LinkButton>
    </li>
    <li>
        <asp:LinkButton runat="server" ID="sp" OnClick="sp_Click">
            <i class="pe-7s-note2"></i>
            <p>Записати до спеціаліста</p>
        </asp:LinkButton>
    </li>
    <li>
        <asp:LinkButton runat="server" ID="an" OnClick="an_Click">
            <i class="pe-7s-note2"></i>
            <p>Записати на аналізи</p>
        </asp:LinkButton>
    </li>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderMain" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="col-md-16">
        <div class="card">
            <div class="header">
                <asp:Label runat="server" Font-Size="20px " ID="pat_name"></asp:Label>
                <p>
                    <asp:Label runat="server" Font-Size="20px" ID="pat_age"></asp:Label>
                </p>
                <p>
                    <asp:Label runat="server" Font-Size="16px" ID="vis_date"></asp:Label>
                </p>
            </div>
            <div class="content">
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label>Причина відвідування</label>
                            <asp:TextBox runat="server" type="text" class="form-control" ID="dc_reason" placeholder="Причина відвідування"></asp:TextBox>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label>Симптоми</label>
                            <asp:TextBox runat="server" type="text" class="form-control" ID="dc_symptoms" placeholder="Симптоми"></asp:TextBox>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label>Діагноз</label>
                            <asp:TextBox runat="server" type="text" class="form-control" ID="dc_diagnosis" placeholder="Діагноз"></asp:TextBox>
                        </div>
                    </div>
                </div>

                <div class="col-md-16">
                    <div class="card card-plain">
                        <div class="header">
                            <p class="category">Препарати</p>
                        </div>

                            <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <asp:DropDownList runat="server" ID="medicine" DataValueField="medicine_name" class="form-control"></asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <asp:TextBox runat="server" type="text" ID="med_take" class="form-control" placeholder="Спосіб прийому"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="form-group">
                                    <asp:TextBox runat="server" type="date" ID="med_st" class="form-control" placeholder="Початок прийому"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="form-group">
                                    <asp:TextBox runat="server" type="date" ID="med_en" class="form-control" placeholder="Кінець прийому"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <h4>РЕКОМЕНДОВАНІ</h4>
                            <label>Консультація лікаря-спеціаліста</label>
                            <asp:DropDownList runat="server" ID="specialists" DataValueField="id_specialty" DataTextField="name_specialty" class="form-control">
                            </asp:DropDownList>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label>Аналіз</label>
                            <telerik:RadComboBox ID="RadComboBox1" class="form-control" runat="server" CheckBoxes="true" DataValueField="analysis_name" DataTextField="analysis_name"></telerik:RadComboBox>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-4">
                        <div class="form-group">
                            <label>Наступний прийом</label>
                            <asp:TextBox runat="server" type="date" ID="dc_next" class="form-control" placeholder="Дата"></asp:TextBox>
                        </div>
                    </div>
                </div>

                <asp:Button runat="server" type="submit" Text="Зберегти" ID="add_visit" OnClick="add_visit_Click" class="btn btn-info btn-fill pull-right"></asp:Button>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
</asp:Content>
