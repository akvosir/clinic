<%@ Page Title="" Language="C#" MasterPageFile="doctor.Master" AutoEventWireup="true" CodeBehind="doctor_analysis.aspx.cs" Inherits="clinic.Doctor_Pages.doctor_analysis" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMenu" runat="server">
    <li>
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
    <li class="active">
         <asp:LinkButton runat="server" id="an" OnClick="an_Click">
            <i class="pe-7s-note2"></i>
            <p>Записати на аналізи</p>
         </asp:LinkButton>
    </li>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderMain" runat="server">
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
                            <asp:DropDownList runat="server" ID="app_an" DataValueField="id_analysis" DataTextField="analysis_name" class="form-control"></asp:DropDownList>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-2">
                        <div class="form-group">
                            <label>ДАТА</label>
                            <asp:TextBox runat="server" ID="app_an_date" type="date" class="form-control"></asp:TextBox>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-2">
                        <div class="form-group">
                            <label>ЧАС</label>
                            <asp:TextBox runat="server" ID="app_an_time" type="time" class="form-control"></asp:TextBox>
                        </div>
                    </div>
                </div>

                <asp:Button runat="server" Text="Зберегти запис" ID="an_save" OnClick="an_save_Click" type="submit" class="btn btn-info btn-fill pull-right"></asp:Button>
                <div class="clearfix"></div>
            </div>

        </div>
    </div>

</asp:Content>
