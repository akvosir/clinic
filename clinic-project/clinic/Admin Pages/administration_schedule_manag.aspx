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
                                    <asp:TemplateField HeaderText="День: парний/непарний">
                                        <ItemTemplate>
                                            <asp:Label ID="lbl_day" runat="server" Text='<%# Eval("even_odd")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Зміна">
                                        <ItemTemplate>
                                            <asp:Label ID="lbl_shift" runat="server" Text='<%# Eval("shift")%>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:DropDownList runat="server" ID="dd_shift" DataValueField="shifts">
                                                <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                                <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                            </asp:DropDownList>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Початок роботи">
                                        <ItemTemplate>
                                            <asp:Label runat="server" Text='<%#Eval("start") %>' />
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txt_start" type="time" runat="server" Text='<%#Eval("start") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Кінець роботи">
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
                                            <asp:LinkButton runat="server" Text="Зберегти" CommandName="Update" />
                                            <asp:LinkButton runat="server" Text="Відмінити" CommandName="Cancel" />
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>

                            <div class="row">
                                <div class="col-md-2">
                                    <div class=" form-group">
                                        <asp:Label runat="server" ID="lbl1" Text="Номер зміни" Visible="false"></asp:Label>
                                        <asp:DropDownList runat="server" type="text" ID="ddsh_1" Visible="false" class="form-control">
                                            <asp:ListItem Value="1" Text="Перша зміна"></asp:ListItem>
                                            <asp:ListItem Text="Друга зміна" Value="2"></asp:ListItem>
                                        </asp:DropDownList>

                                    </div>
                                </div>
                                <div class="col-md-2">
                                    <div class=" form-group">
                                        <asp:Label runat="server" ID="lbl4" Text="Номер зміни" Visible="false"></asp:Label>
                                        <asp:DropDownList runat="server" type="text" ID="ddeo_1" Visible="false" class="form-control">
                                            <asp:ListItem Value="0" Text="Парний"></asp:ListItem>
                                            <asp:ListItem Text="Непарний" Value="1"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="col-md-2">
                                    <div class=" form-group">
                                        <asp:Label runat="server" ID="lbl2" Text="Початок роботи" Visible="false"></asp:Label>
                                        <asp:TextBox runat="server" type="time" ID="start_add1" Visible="false" class="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-2">
                                    <div class=" form-group">
                                        <asp:Label runat="server" ID="lbl3" Text="Кінець роботи" Visible="false"></asp:Label>
                                        <asp:TextBox runat="server" type="time" ID="end_add1" Visible="false" class="form-control"></asp:TextBox>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-2">
                                    <asp:DropDownList runat="server" type="text" ID="ddsh_2" Visible="false" class="form-control">
                                        <asp:ListItem Value="1" Text="Перша зміна"></asp:ListItem>
                                        <asp:ListItem Text="Друга зміна" Value="2"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div class="col-md-2">
                                    <asp:DropDownList runat="server" type="text" ID="ddeo_2" Visible="false" class="form-control">
                                        <asp:ListItem Value="0" Text="Парний"></asp:ListItem>
                                        <asp:ListItem Text="Непарний" Value="1"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div class="col-md-2">
                                    <asp:TextBox runat="server" type="time" ID="start_add2" Visible="false" class="form-control"></asp:TextBox>
                                </div>
                                <div class="col-md-2">
                                    <asp:TextBox runat="server" type="time" ID="end_add2" Visible="false" class="form-control"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <asp:Button runat="server" ID="save_adding" OnClick="save_adding_Click" Text="Зберегти" Visible="false" class="btn btn-info btn-fill center-block" />
                        <div class="clearfix"></div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</asp:Content>
