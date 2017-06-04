<%@ Page Title="" Language="C#" MasterPageFile="Site.Master" AutoEventWireup="true" CodeBehind="reception_schedule.aspx.cs" Inherits="clinic.WebForm3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content1" runat="server">
    <li>
        <a href="reception_cards.aspx">
            <i class="pe-7s-note2"></i>
            <p>Медичні картки</p>
        </a>
    </li>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Content2" runat="server">
    <li class="active">
        <a href="reception_schedule.aspx">
            <i class="pe-7s-clock"></i>
            <p>Розклад</p>
        </a>
    </li>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Content3" runat="server">
    <li>
        <a href="reception_registration.aspx">
            <i class="pe-7s-graph"></i>
            <p>Реєстрація пацієнта</p>
        </a>
    </li>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolderMain" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" />
    <div class="container-fluid">
        <div class="card">
            <div class="content">
                <div class="row">

                    <div class="col-md-12">
                        <div class="form-group">
                            <label></label>
                            <asp:DropDownList runat="server" ID="rec_pd" class="form-control" AutoPostBack="true" OnSelectedIndexChanged="rec_pd_SelectedIndexChanged">
                                <asp:ListItem Text="Пацієнт" Value="1"></asp:ListItem>
                                <asp:ListItem Text="Лікар" Value="2"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="form-group">
                            <asp:TextBox Visible="false" runat="server" type="date" ID="dateTB" class="form-control" contentEditable="false"  placeholder="Дата"></asp:TextBox>
                            <asp:RequiredFieldValidator Display="Dynamic" runat="server" ControlToValidate="dateTB" ErrorMessage="Оберіть дату!" Font-Size="11px" ForeColor="#dd4242"></asp:RequiredFieldValidator>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="form-group">
                            <asp:DropDownList Visible="false" runat="server" ID="pat" size="5" DataValueField="idpatient_card" DataTextField="name" class="form-control"></asp:DropDownList>
                            <ajaxToolkit:ListSearchExtender ID="ListSearchExtender1" runat="server" TargetControlID="pat" PromptText="Почніть друкувати для пошуку" PromptCssClass="form-control">
                            </ajaxToolkit:ListSearchExtender>
                            <asp:RequiredFieldValidator Display="Dynamic" runat="server" ControlToValidate="pat" ErrorMessage="Оберіть пацієнта!" Font-Size="11px" ForeColor="#dd4242"></asp:RequiredFieldValidator>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="form-group">
                            <asp:DropDownList Visible="false" runat="server" ID="doc" size="5" DataValueField="id_doctor" DataTextField="name" class="form-control"></asp:DropDownList>
                            <ajaxToolkit:ListSearchExtender ID="doc_ListSearchExtender" runat="server" TargetControlID="doc" PromptText="Почніть друкувати для пошуку" PromptCssClass="form-control">
                            </ajaxToolkit:ListSearchExtender>
                            <asp:RequiredFieldValidator runat="server" Display="None" id="doc_rfv" ControlToValidate="doc" ErrorMessage="Оберіть лікаря!" Font-Size="11px" ForeColor="#dd4242"></asp:RequiredFieldValidator>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="form-group">
                            <asp:Button Visible="false" runat="server" ID="submit" OnClick="submit_Click" Text="Переглянути дописи" class="btn btn-info btn-fill center-block" />
                            <asp:Button Visible="false" runat="server" ID="submit_pat" OnClick="submit_pat_Click" Text="Переглянути дописи" class="btn btn-info btn-fill center-block" />

                        </div>
                    </div>
                    <div class="col-md-12">
                        <asp:Button Visible="false" runat="server" ID="make_anapp" OnClick="make_anapp_Click" Text="Записати на прийом" class="btn btn-info btn-fill center-block" />
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
        </div>

        <div class="card">
            <div class="content">
                <asp:GridView runat="server" ID="GridView1" DataKeyNames="id_app" AutoGenereteSelectButton="true" AutoGenerateColumns="false" Width="100%" CssClass="ui celled table" AllowPaging="true">
                    <Columns>
                        <asp:BoundField DataField="start_app" DataFormatString="{0:t}" HeaderText="Час" />
                        <asp:TemplateField HeaderText="Пацієнт">
                            <ItemTemplate>
                                <%# Eval("surname") + " " + Eval("name") + " " + Eval("fathers_name")%>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="cancel_doc" OnClick="cancel_doc_Click" runat="server" ItemStyle-Width="150">Відмінити прийом</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>

            <div class="content">
                <asp:GridView runat="server" ID="GridView2" DataKeyNames="id_app" AutoGenereteSelectButton="true" AutoGenerateColumns="false" Width="100%" CssClass="ui celled table" AllowPaging="true">
                    <Columns>
                        <asp:BoundField DataField="start_app" DataFormatString="{0:t}" HeaderText="Час" />
                        <asp:TemplateField HeaderText="Лікар">
                            <ItemTemplate>
                                <%# Eval("doctor_surname") + " " + Eval("doctor_name") + " " + Eval("doctor_fathersname")%>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="cancel_pat" OnClick="cancel_pat_Click" runat="server" ItemStyle-Width="150">Відмінити прийом</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
