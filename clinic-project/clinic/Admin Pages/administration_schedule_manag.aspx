<%@ Page Title="" Language="C#" MasterPageFile="~/Admin Pages/admin.Master" AutoEventWireup="true" CodeBehind="administration_schedule_manag.aspx.cs" Inherits="clinic.Admin_Pages.administration_schedule_manag" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderMenu" runat="server">
    <li>
        <a href="administration_new_user.aspx">
            <i class="pe-7s-note2"></i>
            <p>Створити нового користувача</p>
        </a>
    </li>
    <li>
        <a href="administrator_password_manag.aspx">
            <i class="pe-7s-note2"></i>
            <p>Управління паролями</p>

        </a>
    </li>
    <li>
        <a href="administration_rooms_manag.aspx">
            <i class="pe-7s-clock"></i>
            <p>Управління кабінетами лікаря</p>
        </a>
    </li>
    <li class="active">
        <a href="administration_schedule_manag.aspx">
            <i class="pe-7s-clock"></i>
            <p>Управління розкладом лікаря</p>
        </a>
    </li>
    <li>
        <a href="administrator_add.aspx">
            <i class="pe-7s-clock"></i>
            <p>Управління</p>
        </a>
    </li>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" runat="server">
    <div class="container-fluid">
            <div class="card">
                <div class="content">
                    <div class="row">
                        <div class="col-md-12">

                            <div class="header">
                            </div>
                            <div class="content">
                                <asp:DropDownList runat="server" type="text" ID="doctors" OnSelectedIndexChanged="doctors_SelectedIndexChanged" DataValueField="id_doctor" AutoPostBack="true" DataTextField="name" class="form-control">
                                </asp:DropDownList>

                            </div>
                        </div>

                        <div class="col-md-12">
                            <div class="header">
                                <asp:Label runat="server" ID="unbind" Visible="false" Font-Size="20px" Text="ДОДАЙТЕ"></asp:Label>
                            </div>
                            <div class="content">
                                <asp:GridView runat="server" ID="schedule_table" OnRowEditing="schedule_table_RowEditing" OnRowCancelingEdit="schedule_table_RowCancelingEdit" OnRowUpdating="schedule_table_RowUpdating" AutoGenereteSelectButton="true" AutoGenerateColumns="false" Width="100%" CssClass="ui celled table">
                                    <Columns>
                                        <asp:TemplateField HeaderText="День тижня">
                                            <ItemTemplate>
                                                <asp:Label ID="lbl_day" runat="server" Text='<%# Eval("day")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:Label runat="server" Text='<%#Eval("start") %>' />
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:TextBox ID="txt_start" type="time" runat="server" Text='<%#Eval("start") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:Label runat="server" Text='<%#Eval("end") %>' />
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:TextBox ID="txt_end" type="time" runat="server" Text='<%#Eval("end") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:LinkButton runat="server" Text="Змінити" CommandName="Edit" />
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:LinkButton runat="server" OnClick="Unnamed_Click" Text="Зберегти" CommandName="Update" />
                                                <asp:LinkButton runat="server" Text="Відмінити" CommandName="Cancel" />
                                            </EditItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>

                                <div class="row">
                                    <asp:TextBox runat="server" ID="day_add" Visible="false"></asp:TextBox>
                                    <asp:TextBox runat="server" ID="start_add" Visible="false"></asp:TextBox>
                                    <asp:TextBox runat="server" ID="end_add" Visible="false"></asp:TextBox>
                                    <asp:Button runat="server" ID="save_adding" Text="Зберегти" Visible="false"/>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
    </div>
</asp:Content>
