<%@ Page Title="" Language="C#" MasterPageFile="doctor.Master" AutoEventWireup="true" CodeBehind="doctor_card_ind.aspx.cs" Inherits="clinic.Doctor_Pages.doctor_card_ind1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="mainContentdoc" runat="server">
    <div class="col-md-16">
        <div class="card">
            <div class="header">
               <asp:Label runat="server" Font-Size="24px" ID="dci_name"></asp:Label>
            </div>

            <div class="content">

                <div class="tab-content">
                    <div id="general_info" >
                        <div class="row">
                            <div class="col-md-2">
                                <div class="form-group">
                                    <label>Номер картки</label>
                                    <asp:TextBox runat="server" type="text" ID="dci_id" class="form-control" ReadOnly="true" />
                                </div>
                            </div>
                        </div>

                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>Дата народження</label>
                                        <asp:TextBox runat="server" id="dci_birthday" type="text" class="form-control" ReadOnly="true"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-2">
                                    <div class="form-group">
                                        <label>Стать</label>
                                        <asp:TextBox runat="server" ReadOnly="true" ID="dci_gender" type="text" class="form-control" ></asp:TextBox>
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Електронна пошта</label>
                                        <asp:TextBox runat="server" ReadOnly="true" ID="dci_email" type="email" class="form-control"></asp:TextBox>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label>Адреса</label>
                                        <asp:TextBox runat="server" ReadOnly="true" ID="dci_address" type="text" class="form-control"></asp:TextBox>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>Місто</label>
                                        <asp:TextBox runat="server" ReadOnly="true" ID="dci_city" type="text" class="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>Поштовий індекс</label>
                                        <asp:TextBox runat="server" ReadOnly="true" ID="dci_zip" type="number" class="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <!--ISPRAVIT'-->
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>Номер телефону</label>
                                        <asp:TextBox runat="server" ReadOnly="true" ID="dci_phone" class="form-control"></asp:TextBox>
                                    </div>
                                </div>

                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label>Хронічні хвороби</label>
                                        <textarea rows="5" class="form-control" >Журба за Вкраїну</textarea>
                                    </div>
                                </div>
                            </div>

                    </div>
                    <div id="visits">
                            <div class="content table-responsive table-full-width">
                                <div class="card card-plain">
                            <asp:GridView runat="server" ID="visit_table_doc" AutoGenereteSelectButton="true" AutoGenerateColumns="false" Width="100%" CssClass="ui celled table" AllowPaging="true">
                                <Columns>
                                    <asp:BoundField DataField="visit_date" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Дата візиту" />
                                    <asp:TemplateField HeaderText="Лікар">
                                        <ItemTemplate>
                                            <%# Eval("doctor_surname") + " " + Eval("doctor_name") + " " + Eval("doctor_fathersname")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:LinkButton ID="visitClick_doc" OnClick="visitClick_doc_Click" runat="server" ItemStyle-Width="150">Результати</asp:LinkButton>
                                        </ItemTemplate>
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
