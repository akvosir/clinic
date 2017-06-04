<%@ Page Title="" Language="C#" MasterPageFile="doctor.Master" AutoEventWireup="true" CodeBehind="doctor_analysis.aspx.cs" Inherits="clinic.Doctor_Pages.doctor_analysis" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMenu" runat="server">
    <li>
         <asp:LinkButton runat="server" ID="sc" CausesValidation="false" OnClick="sc_Click">
            <i class="pe-7s-note2"></i>
            <p>Розклад</p>
        </asp:LinkButton>
    </li>
    <li>
        <asp:LinkButton runat="server" ID="sp" CausesValidation="false" OnClick="sp_Click">
            <i class="pe-7s-note2"></i>
            <p>Записати до спеціаліста</p>
        </asp:LinkButton>
    </li>
    <li class="active">
         <asp:LinkButton runat="server" id="an" CausesValidation="false" OnClick="an_Click">
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
                <h4 class="title">АНАЛІЗИ</h4>
            </div>

            <div class="content">
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label>ОБРАТИ ТИП АНАЛІЗУ</label>
                            <asp:DropDownList runat="server" ID="app_an" AutoPostBack="true" CausesValidation="true" OnSelectedIndexChanged="app_an_SelectedIndexChanged" DataValueField="id_analysis" DataTextField="analysis_name" class="form-control"></asp:DropDownList>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-2">
                        <div class="form-group">
                            <label>ДАТА</label>
                            <asp:TextBox runat="server" ID="app_an_date" type="date" CausesValidation="true" AutoPostBack="true" OnTextChanged="app_an_date_TextChanged" class="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" Display="Dynamic" ControlToValidate="app_an_date" ErrorMessage="*"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-2">
                        <div class="form-group">
                            <label>ЧАС</label>
                            <telerik:RadTimePicker ID="RadTimePicker1" runat="server"></telerik:RadTimePicker>
                            <asp:RequiredFieldValidator runat="server" Display="Dynamic" ControlToValidate="RadTimePicker1" ErrorMessage="*"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>

                <asp:Button runat="server" Text="Зберегти запис" CausesValidation="true" ID="an_save" OnClick="an_save_Click" type="submit" class="btn btn-info btn-fill pull-right"></asp:Button>
                <div class="clearfix"></div>
            </div>

        </div>
    </div>

</asp:Content>
