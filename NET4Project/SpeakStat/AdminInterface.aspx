<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminInterface.aspx.cs" Inherits="SpeakStat.AdminInterface" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="icon" href="Images/corgo.JPG"/>
    <title>SpeakStat Admin Mode</title>
    <style type="text/css">
        @font-face
        {
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
        #pageTitle
        {
            color: white;
            font-size: 55px;
            text-shadow: -4px -4px black, 4px -4px black, -4px 4px black, 4px 4px black;
            position: absolute;
            top: 0px;
            left: 20px;
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
        #logoutBtn, #viewUsers
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
        #viewUsers
        {
            left: 30%;
            width: auto;
        }
        #joinClass
        {
            left: 40%;
            width: auto;
        }
        #myClasses
        {
            width: 90%;
            height: 85%;
            text-align: center;
        }
        .classBox
        {
            width: 100%;
            text-align: center;
            table-layout: fixed;
        }
        .inputbox
        {
            font-size: 30px;
            border-radius: 20px;
            width: 50%;
            height: 95%;
            border: 2px solid black;
        }
        #ViewUsersPanel, #PromptPanel
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

        #PromptPanel
        {
            height: 30%;
            width: 35%;
        }

        #lblMyClasses, #showJoinClass
        {
            color: white;
            font-size: 50px;
            text-shadow: -3px -3px black, 3px -3px black, -3px 3px black, 3px 3px black;
        }
        #showJoinClass
        {
            left: 38%;
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
        #prompter
        {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%,-50%);
        }
        #welcomedoor
        {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%,-50%);
            height: auto;
            width: auto;
            text-align: center;
        }
        #lblWelcome
        {
            font-size: 30px;
            text-shadow: -2px -2px black, 2px -2px black, -2px 2px black, 2px 2px black;
            position: absolute;
            width: auto;
            height: auto;
            color: white;
            top: 5%;
            left: 50%;
            transform: translate(-50%, 0%);
            background-color: greenyellow;
            border-radius: 20px;
            padding: 8px;
            border: 3px solid black;
        }
        #corgi
        {
            border-radius: 200px;
            border: 4px solid black;
        }
    </style>
</head>
<body>
    <asp:Image ID="bgImage" runat="server"  ImageUrl="~/Images/BackgroundLanding.jpg" />
    <form id="form1" runat="server">
        <div>
            <div id="headerTop" runat="server">
                <asp:Label ID="pageTitle" runat="server" Text="SpeakStat (A)"></asp:Label>
                <asp:Button ID="logoutBtn" runat="server" Text="Log Out" CssClass="image" OnClick="logoutBtn_Click" />
                <asp:Button ID="viewUsers" runat="server" Text="View All Users" CssClass="image" OnClick="viewUsers_Click"/>
            </div>
        </div>

        <div id="welcomedoor">
            <asp:Image id="corgi" runat="server" ImageUrl="~/Images/corgi.gif" Height="500px" Width="600px" />
            <asp:Label ID="lblWelcome" runat="server" Text="sampletext"></asp:Label>
        </div>

        <div id="ViewUsersPanel" runat="server"><br />
            <asp:Label ID="lblMyClasses" runat="server" Text="My Classes"></asp:Label>
            <div style="overflow-y: scroll; height: 90%;">
                <asp:DataList ID="myClasses" runat="server">
                <HeaderTemplate>
                    <table class="classBox" runat="server">
                        <tr>
                            <td>
                                <asp:Label ID="Label2" CssClass="SubLabels" runat="server" Text="Account ID"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="Label1" CssClass="SubLabels" runat="server" Text="First Name"></asp:Label>&nbsp;&nbsp;
                                <asp:Label ID="Label3" CssClass="SubLabels" runat="server" Text="Last Name"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="Label4" CssClass="SubLabels" runat="server" Text="Account Type"></asp:Label>
                            </td>
                            <td colspan="2">
                                <asp:Label ID="Label5" CssClass="SubLabels" runat="server" Text="Actions"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </HeaderTemplate>
                <ItemTemplate>
                    <table class="classBox" runat="server">
                        <tr>
                            <td>
                                <asp:Label ID="Label2" CssClass="SubLabels" runat="server" Text='<%#Eval("AccID") %>'></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="Label1" CssClass="SubLabels" runat="server" Text='<%#Eval("FName") %>'></asp:Label>&nbsp;&nbsp;
                                <asp:Label ID="Label3" CssClass="SubLabels" runat="server" Text='<%#Eval("LName") %>'></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="Label4" CssClass="SubLabels" runat="server" Text='<%#Eval("AccType") %>'></asp:Label>
                            </td>
                            <td>
                                <asp:Button ID="makeAdmin" CssClass="leButton" runat="server" Text="PROMOTE" CausesValidation="false" OnClick="makeAdmin_Click" CommandArgument='<%#Eval("AccID") %>'/>
                            </td>
                            <td>
                                <asp:Button ID="deleteUser" CssClass="leButton" runat="server" Text="DELETE" CausesValidation="false" OnClick="deleteUser_Click" CommandArgument='<%#Eval("AccID") %>'/>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:DataList>
            </div>
        </div>

        <div id="PromptPanel" runat="server">
            <table id="prompter" class="classbox" runat="server">
                <tr>
                    <td colspan="2">
                        <asp:Label ID="promptText" CssClass="SubLabels" runat="server" Text="Are you sure?"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="cancelAction" CssClass="leButton" runat="server" Text="CANCEL" CausesValidation="false" OnClick="cancelAction_Click"/>
                    </td>
                    <td>
                        <asp:Button ID="progressAction" CssClass="leButton" runat="server" Text="CONFIRM" CausesValidation="false" OnClick="progressAction_Click"/>
                    </td>
                </tr>
            </table>
        </div>

    </form>
</body>
</html>
