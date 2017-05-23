<%@ Page Title="" UICulture="uk" Culture="uk-UA" Language="C#" MasterPageFile="doctor.Master" AutoEventWireup="true" CodeBehind="doctor_specialist.aspx.cs" Inherits="clinic.Doctor_Pages.doctor_specialist" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMenu" runat="server">
    <li>
         <asp:LinkButton runat="server" ID="sc" OnClick="sc_Click" >
            <i class="pe-7s-note2"></i>
            <p>Розклад</p>
        </asp:LinkButton>
    </li>
    <li class="active">
        <asp:LinkButton runat="server" ID="sp" OnClick="sp_Click" >
            <i class="pe-7s-note2"></i>
            <p>Записати до спеціаліста</p>
        </asp:LinkButton>
    </li>
    <li>
         <asp:LinkButton runat="server" id="an" OnClick="an_Click">
            <i class="pe-7s-note2"></i>
            <p>Записати на аналізи</p>
         </asp:LinkButton>
    </li>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="mainContentdoc" runat="server">
    <div class="col-md-16">
        <div class="card">
            <div class="header">
                <h4 class="title">ОБРАТИ СПЕЦІАЛІСТА</h4>
            </div>
            <div class="content">
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label>ОБРАТИ СПЕЦІАЛІСТА</label>
                            <asp:DropDownList runat="server" ID="app_spec" DataValueField="id_specialty" AutoPostBack="True"  OnSelectedIndexChanged="app_spec_SelectedIndexChanged" DataTextField="name_specialty" class="form-control"></asp:DropDownList>

                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label>ОБРАТИ ЛІКАРЯ</label>
                            <asp:DropDownList runat="server" ID="app_spec_name" DataValueField="id_doctor" DataTextField="name" type="text" class="form-control"></asp:DropDownList>

                        </div>
                    </div>
                </div>

                <!--datetime picker-->
                <div class="row">
                    <div class="col-md-2">
                        <div class="form-group">
                            <label>ДАТА</label>
                            <asp:TextBox runat="server" ID="app_spec_date" type="date" class="form-control"></asp:TextBox>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-2">
                        <div class="form-group">
                            <label>ЧАС</label>
                            <asp:TextBox runat="server" ID="app_spec_time" type="time" class="form-control"></asp:TextBox>                           
                        </div>                       
                    </div>
                </div>
                <asp:Button runat="server" Text="Зберегти запис" ID="make_app" OnClick="make_app_Click" class="btn btn-info btn-fill pull-right"></asp:Button>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>

</asp:Content>
