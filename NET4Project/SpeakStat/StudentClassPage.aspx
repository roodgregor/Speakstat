<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentClassPage.aspx.cs" Inherits="SpeakStat.StudentClassPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="ShowClassContent" runat="server" Text="Class Content: "></asp:Label>
            <br />
            <asp:Label ID="ShowLevel" runat="server" Text="Level:"></asp:Label>
            <asp:Label ID="LblLevel" runat="server" Text="0"></asp:Label>
            <br />
            
            <asp:DataList ID="myVid" runat="server">
                <ItemTemplate>
                    <iframe height="262" width="466" src="//www.youtube.com/embed/<%#Eval("VideoLink")%>?rel=0&wmode=transparent" 
                    frameborder="0" allowfullscreen></iframe>
                </ItemTemplate>
            </asp:DataList>

            <br />
            <asp:Button ID="LevelUp" runat="server" Text="Next" OnClick="LevelUp_Click" />
        </div>
    </form>
</body>
</html>
