<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LandingPage.aspx.cs" Inherits="SpeakStat.LandingPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SpeakStat Landing Page</title>
    <style type="text/css">
        @font-face {
            font-family: "Walkway Black";
            src: url("Fonts/Walkway Black.ttf");

        }
        body
        {
            font-family: 'Walkway Black';
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:TextBox ID="loginUsername" runat="server" placeholder="juandelacruz" />
            <asp:TextBox ID="loginPassword" runat="server" placeholder="*****" TextMode="Password" />
            <asp:Button ID="loginButton" runat="server" Text="Login" />
        </div>
    </form>
</body>
</html>
