<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProfessorClassPage.aspx.cs" Inherits="SpeakStat.ProfessorClassPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="ClassName" runat="server" Text="ClassName"></asp:Label>
            <br />
            <asp:Label ID="lblNumber" runat="server" Text="Number of Students: "></asp:Label>
            <asp:Label ID="NumberofStdnt" runat="server" Text="0"></asp:Label>
            <br />
            Add Link:
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <asp:Button ID="AddLevel" runat="server" Text="Add Level" OnClick="AddLevel_Click" />
        </div>
    </form>
</body>
</html>
