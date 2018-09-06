<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ParentInterface.aspx.cs" Inherits="SpeakStat.ParentInterface" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SpeakStat Parent</title>
    <style type="text/css">
        @font-face {
            font-family: "Walkway Black";
            src: url("Fonts/Walkway Black.ttf") format('truetype')
        }
        body
        {
            font-family: 'Walkway Black';
            margin: 0px;
        }
        #bgImage
        {
            position: absolute;
            top: 0px;
            left: 0px;
            height: 100%;
            width: 100%;
            z-index: -1;
        }
        .HeadLabels
        {
            font-size: 2.5em;
            color: white;
            text-shadow: -2px -2px black, 2px -2px black, -2px 2px black, 2px 2px black;
            
        }
        .SubLabels
        {
            font-size: 1.75em;
            color: white;
            text-shadow: -2px -2px black, 2px -2px black, -2px 2px black, 2px 2px black;
        }
        .inputbox
        {
            font-size: 30px;
            border-radius: 20px;
            width: 95%;
            height: 95%;
            border: 2px solid black;
        }
        .image
        {            
            border-radius: 100px;
            border: 3px solid black;
        }

        .image:hover
        {
            opacity: 0.7;
        }

        #headerTop
        {
            position: absolute;
            top: 0px;
            left: 0px;
            width: 100%;
            height: 10%;
            background-color: purple;
        }
        #pageTitle
        {
            color: white;
            font-size: 55px;
            text-shadow: -4px -4px black, 4px -4px black, -4px 4px black, 4px 4px black;
            position: absolute;
            top: 0px;
            left: 20px;
        }
        #logoutBtn, #viewClass
        {
            font-family: "Walkway Black";
            background-color: darkviolet;
            font-size: 15px;
            border-radius: 20px;
            padding: 16px;
            border: 3px solid rgba(255,255,255,0.5);
            width: 10%;
            color: rgba(255,255,255,0.8);
            cursor: pointer;
            position: absolute;
            top: 7px;
            left: 89.5%;
        }
        #viewClass
        {
            left: 26%;
            width: auto;
        }
        #ViewMyChild, #ProgressPanel
        {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%,-50%);
            background-color: white;
            border-radius: 40px;
            height: 60%;
            width: 70%;
            border: 4px solid black;
            text-align: center;
        }
        #lblMyClasses, #showCreateClass, #viewProgress
        {
            color: white;
            font-size: 50px;
            text-shadow: -3px -3px black, 3px -3px black, -3px 3px black, 3px 3px black;
        }
        #showCreateClass
        {
            left: 38%;
        }
        .SubLabels
        {
            font-size: 30px;
            color: white;
            text-shadow: -2px -2px black, 2px -2px black, -2px 2px black, 2px 2px black;
        }
        #createTable
        {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%,-50%);
        }
        .leButton
        {
            font-family: "Walkway Black";
            background-color: limegreen;
            font-size: 20px;
            border-radius: 20px;
            padding: 5px;
            border: 3px solid black;
            width: auto;
            cursor: pointer;
        }
        #myClasses
        {
            width: 90%;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%,-50%);
            text-align: center;
        }
        .classBox
        {
            width: 100%;
            text-align: center;
            table-layout: fixed;

        }
        .abot
        {
            min-width: 30%;
            max-width: 95%;
        }
        #ProgressPanel
        {
            height: 70%;
            width: 60%;
        }
    </style>
</head>
<body>
    <asp:Image ID="bgImage" runat="server"  ImageUrl="~/Images/BackgroundLanding.jpg" />
    <form id="form1" runat="server">
        <div>
            <div id="headerTop" runat="server">
                <asp:Label ID="pageTitle" runat="server" Text="SpeakStat Parent"></asp:Label>
                <asp:Button ID="logoutBtn" runat="server" Text="Log Out" CssClass="image" OnClick="logoutBtn_Click"/>
            </div>
        </div>

        <div id="ViewMyChild" runat="server"><br />
            <asp:Label ID="lblMyClasses" runat="server" Text="Enter Child Details"></asp:Label>
            <table>
                <tr>
                    <td>
                        <asp:Label ID="Label3" CssClass="SubLabels" runat="server" Text="User Name:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox CssClass="inputbox" ID="ChildUsername" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="asdf" CssClass="SubLabels" runat="server" Text="First Name:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox CssClass="inputbox" ID="ChildFName" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label1" CssClass="SubLabels" runat="server" Text="Last Name:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox CssClass="inputbox" ID="ChildLName" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Button ID="submitDetails" CssClass="leButton" runat="server" Text="CONFIRM" CausesValidation="true" OnClick="submitDetails_Click"/>
                    </td>
                </tr>
            </table>
        </div>

        <div id="ProgressPanel" runat="server"><br />
            <asp:Label ID="viewProgress" runat="server" Text="Displaying Child Progress"></asp:Label><br /><br />
            <asp:Label ID="ChildName" CssClass="SubLabels" runat="server" Text=""></asp:Label><br /><br />
            <asp:DataList ID="myProgress" runat="server">
                <HeaderTemplate>
                    <table class="classBox" runat="server">
                        <tr>
                            <td class="abot">
                                <asp:Label ID="Label2" CssClass="SubLabels" runat="server" Text="Class Name"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="Label4" CssClass="SubLabels" runat="server" Text="Progress Level"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </HeaderTemplate>
                <ItemTemplate>
                    <table class="classBox" runat="server">
                        <tr>
                            <td class="abot">
                                <asp:Label ID="Label2" CssClass="SubLabels" runat="server" Text=<%#Eval("ClassName") %>></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="Label4" CssClass="SubLabels" runat="server" Text=<%#Eval("LevelNumber") %>></asp:Label>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:DataList>
        </div>
    </form>
</body>
</html>
