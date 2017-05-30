<%@ Page Title="" Language="C#" MasterPageFile="User.Master" AutoEventWireup="true" CodeBehind="chooseDoctor.aspx.cs" Inherits="ClinicSite.chooseDoctor" %>


<asp:Content ID="Content1" ContentPlaceHolderID="UserNameHolder" runat="server">
    <div class="logo">
        <asp:Label ID="UserName" DataTextField="UserName" runat="server" />
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMenu" runat="server">
    <li>
        <asp:LinkButton runat="server" ID="docChoose" OnClick="docChoose_Click">
            <i class="pe-7s-note2"></i>
            <p>Записатися на прийом</p>
        </asp:LinkButton>
    </li>
    <li>
        <asp:LinkButton runat="server" ID="visits" OnClick="visits_Click">
            <i class="pe-7s-note2"></i>
            <p>Мої візити</p>
        </asp:LinkButton>
    </li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="mainContentdoc" runat="server">
    <div class="container">
        <div class="card">
            <div class="content">
                <h4 class="title">ЗАПИСАТИСЯ НА ПРИЙОМ ДО ТЕРАПЕВТА</h4>
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label>ОБРАТИ ЛІКАРЯ</label>
                            <asp:DropDownList runat="server" ID="therapeutist" DataValueField="id_doctor" DataTextField="name" class="form-control"></asp:DropDownList>
                        </div>
                    </div>
                </div>
                <!--datetime picker-->
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>ДАТА</label>
                            <asp:TextBox runat="server" ID="app_spec_date" type="date" class="form-control"></asp:TextBox>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label>ЧАС</label>
                            <asp:TextBox runat="server" ID="app_spec_time" type="time" class="form-control"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <asp:Button runat="server" Text="Зберегти запис" ID="make_app" OnClick="make_app_Click" class="btn btn-info btn-fill pull-left"></asp:Button>
                <div class="clearfix"></div>

                <%--<div class="row">
                    <div class="col-md-10">
                        <div class="form-group">
                            <label>СКАСУВАТИ ПРИЙОМ</label>
                            <asp:DropDownList runat="server" ID="deleteVisit" DataValueField="id_app" DataTextField="name" class="form-control"></asp:DropDownList>
                        </div>
                    </div>
                </div>
                <asp:Button runat="server" Text="Видалити" ID="VisitDel" OnClick="VisitDel_Click" class="btn btn-info btn-fill pull-left"></asp:Button>
                <div class="clearfix"></div>--%>
            </div>
        </div>
    </div>

</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="DeleteVisit" runat="server">
    <div class="container">
        <div class="card">
            <div class="content">
                <h4 class="title">СКАСУВАТИ ПРИЙОМ</h4>
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label>СКАСУВАТИ ПРИЙОМ</label>
                            <asp:DropDownList runat="server" ID="deleteVisit" DataValueField="id_app" DataTextField="name" class="form-control"></asp:DropDownList>
                        </div>
                    </div>
                </div>
                <asp:Button runat="server" Text="Видалити" ID="VisitDel" OnClick="VisitDel_Click" class="btn btn-info btn-fill pull-left"></asp:Button>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
</asp:Content>
