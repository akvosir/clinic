<%@ Page Title="" Language="C#" MasterPageFile="~/Admin Pages/admin.Master" AutoEventWireup="true" CodeBehind="administration_rooms_manag.aspx.cs" Inherits="clinic.administration_rooms_manag" %>

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
    <li class="active">
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
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" runat="server">
    <div class="container-fluid">
        <div class="col-md-16">
            <div class="card">
                <div class="content">
                    <div class="col">

                        <div class="col-md-16">
                            <asp:GridView runat="server" ID="rooms_table" OnRowEditing="rooms_table_RowEditing" OnRowCancelingEdit="rooms_table_RowCancelingEdit" OnRowUpdating="rooms_table_RowUpdating" OnPageIndexChanging="rooms_table_PageIndexChanging" PageSize="20" AutoGenereteSelectButton="true" AutoGenerateColumns="false" Width="100%" AllowPaging="true" CssClass="ui celled table">
                                <Columns>
                                    <asp:TemplateField HeaderText="Номер лікаря">
                                        <ItemTemplate>
                                            <asp:Label ID="lbl_id" runat="server" Text='<%# Eval("id_doctor")%>' ></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="ПІБ">
                                        <ItemTemplate>
                                            <%# Eval("doctor_surname") + " " + Eval("doctor_name") + " " + Eval("doctor_fathersname")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Кімната">
                                         <ItemTemplate>
                                             <asp:Label runat="server" Text='<%# Eval("doctor_room")%>' />
                                         </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txt_Room" runat="server" Text='<%#Eval("doctor_room") %>'></asp:TextBox>
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txt_Room" ErrorMessage="*" ForeColor="#dd4242" Font-Size="11px"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator runat="server" ValidationExpression="[0-9]+$" ControlToValidate="txt_Room" ErrorMessage="Тільки цифри!" ForeColor="#dd4242" Font-Size="11px"></asp:RegularExpressionValidator>
                                            
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:LinkButton runat="server" Text="Змінити" CommandName="Edit" />
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:LinkButton runat="server" Text="Зберегти" CommandName="Update" />
                                            <asp:LinkButton runat="server" Text="Відмінити" CausesValidation="false" CommandName="Cancel" />
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                        
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
