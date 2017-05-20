<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebApplication1.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
<link type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.6/semantic.min.css" rel="stylesheet" />
<link type="text/css" href="https://cdn.datatables.net/1.10.15/css/dataTables.semanticui.min.css" rel="stylesheet" />
    
<script  type="text/javascript" language="javascript" src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript" language="javascript" src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>

<script type="text/javascript" language="javascript" src="https://cdn.datatables.net/1.10.15/js/dataTables.semanticui.min.js"></script>
<script type="text/javascript" language="javascript" src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.6/semantic.min.js"></script>

     <script type="text/javascript">
         $(document).ready(function () {
             $('#GridView1').dataTable();
         });
</script>

</head>

<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView runat="server" ID="GridView1" AutoGenerateColumns="false" Width ="100%" CssClass="ui celled table" AllowPaging="true">
                <Columns>
                    <asp:BoundField DataField="idpatient_card" HeaderText="ID" />
                    <asp:BoundField DataField="name" HeaderText="name" />
                    <asp:BoundField DataField="birthday" HeaderText="birthday" />
                </Columns>
            </asp:GridView>

            
        </div>
    </form>
</body>
   

</html>
