<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="clinic.LoginPage" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title>НАЗВА ПРОГРАМИ</title>
    <link rel="stylesheet" href="style.css"/>
</head>
<body>
    <hgroup>
        <h1>Вхід</h1>
    </hgroup>
    <form runat="server">
    <div class="group">
        <asp:TextBox id="loginTextBox" runat="server" type="text"/>
        <span class="highlight"></span><span class="bar"></span>
        <label>Логін</label>
     </div>

    <div class="group">
        <asp:TextBox type="password" id = "passwordTextBox" runat="server"/><span class="highlight"></span><span class="bar"></span>
        <label>Пароль</label>
    </div>


     <asp:LinkButton runat="server" id="okButton" class="button buttonBlue" OnClick="OkButton_Click">Вхід
        <div class="ripples buttonRipples"><span class="ripplesCircle"></span></div>
     </asp:LinkButton>
   
</form>
</body>

    <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
    <script src="index.js"></script>

</html>
