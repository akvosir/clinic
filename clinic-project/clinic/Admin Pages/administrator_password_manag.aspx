<%@ Page Title="" Language="C#" MasterPageFile="~/Admin Pages/admin.Master" AutoEventWireup="true" CodeBehind="administrator_password_manag.aspx.cs" Inherits="clinic.Admin_Pages.administrator_password_manag" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderMenu" runat="server">
    <li>
        <a href="administration_new_user.aspx">
            <i class="pe-7s-note2"></i>
            <p>Створити нового користувача</p>
        </a>
    </li>
    <li class="active">
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
    <li>
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
            <div class=" content">
                <div class="col-md-16">
                    <div class="input-group">
                        <asp:TextBox runat="server" type="text" class="form-control" placeholder="Search"></asp:TextBox>
                        <div class="input-group-btn">
                            <button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i></button>
                        </div>
                    </div>
                </div>

                <div class="col-md-16">
                    <asp:GridView runat="server" ID="user_table" PageSize="20" OnRowCancelingEdit="user_table_RowCancelingEdit" OnRowEditing="user_table_RowEditing" OnRowUpdating="user_table_RowUpdating" OnRowDeleting="user_table_RowDeleting" OnPageIndexChanging="user_table_PageIndexChanging" AutoGenereteSelectButton="true" AutoGenerateColumns="false" Width="100%" AllowPaging="true" CssClass="ui celled table">
                        <Columns>
                            <asp:TemplateField HeaderText="Номер працівника">
                                <ItemTemplate>
                                    <asp:Label ID="lbl_id" runat="server" Text='<%# Eval("id")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Ім'я">
                                <ItemTemplate>
                                    <asp:Label runat="server" Text='<%# Eval("name")%>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <div class=" form-group-sm">
                                        <asp:TextBox runat="server" ID="admch_surname" class="form-control input-sm" Text='<%#Eval("name")%>'></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="admch_surname" ErrorMessage="Заповніть поле" ForeColor="#dd4242" Font-Size="11px"></asp:RequiredFieldValidator>
                                    </div>
                                </EditItemTemplate>

                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Прізвище">
                                <ItemTemplate>
                                    <asp:Label runat="server" Text='<%# Eval("surname")%>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <div class=" form-group-sm">
                                        <asp:TextBox runat="server" ID="admch_name" class="form-control input-sm" Text='<%# Eval("surname")%>'></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="admch_name" ErrorMessage="Заповніть поле" ForeColor="#dd4242" Font-Size="11px"></asp:RequiredFieldValidator>
                                    </div>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="По батькові">
                                <ItemTemplate>
                                    <asp:Label runat="server" Text='<%# Eval("fathers_name")%>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <div class=" form-group-sm">
                                        <asp:TextBox runat="server" ID="admch_fname" class="form-control input-sm" Text='<%# Eval("fathers_name")%>'></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="admch_surname" ErrorMessage="Заповніть поле" ForeColor="#dd4242" Font-Size="11px"></asp:RequiredFieldValidator>
                                    </div>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Логін">
                                <ItemTemplate>
                                    <asp:Label runat="server" Text='<%# Eval("login")%>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <div class=" form-group-sm">
                                        <asp:TextBox runat="server" ID="admch_login" class="form-control input-sm" Text='<%# Eval("login")%>'></asp:TextBox>
                                        <asp:TextBox runat="server" ID="admch_password" class="form-control input-sm" TextMode="Password" Text='<%# Eval("password")%>'></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="admch_login" ErrorMessage="Заповніть поле" ForeColor="#dd4242" Font-Size="11px"></asp:RequiredFieldValidator>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="admch_password" ErrorMessage="Заповніть поле" ForeColor="#dd4242" Font-Size="11px"></asp:RequiredFieldValidator>
                                    </div>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Тип працівника">
                                <ItemTemplate>
                                    <asp:Label runat="server" Text='<%# Eval("type")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:LinkButton runat="server" Text="Змінити" CommandName="Edit" />
                                    <asp:LinkButton runat="server" Text="Видалити" CommandName="Delete" />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:LinkButton runat="server" Text="Зберегти" CommandName="Update" />
                                    <asp:LinkButton runat="server" Text="Відмінити" CommandName="Cancel" />
                                </EditItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
