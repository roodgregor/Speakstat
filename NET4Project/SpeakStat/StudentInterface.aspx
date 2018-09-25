<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentInterface.aspx.cs" Inherits="SpeakStat.StudentInterface" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="icon" href="Images/corgi.gif" type="image/gif" />
    <title>SpeakStat Student</title>
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
        #logoutBtn, #viewClass, #joinClass
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
            left: 25%;
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
        .inputbox
        {
            font-size: 30px;
            border-radius: 20px;
            width: 50%;
            height: 95%;
            border: 2px solid black;
        }
        #ViewClassPanel, #JoinClassPanel, #WelcomePanel
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
        div
        {
            overflow-y: auto;
        }
        #WelcomePanel
        {
            width: 85%;
            height: 80%;
            background-color: transparent;
            border: none;
            overflow-y: initial;
        }

        #lblMyClasses, #showJoinClass, #lblWelcome
        {
            color: white;
            font-size: 50px;
            text-shadow: -3px -3px black, 3px -3px black, -3px 3px black, 3px 3px black;
        }
        #lblWelcome
        {
            font-size: 30px;
            text-shadow: -2px -2px black, 2px -2px black, -2px 2px black, 2px 2px black;
            position: absolute;
            width: auto;
            height: auto;
            top: 5%;
            left: 50%;
            transform: translate(-50%, 0%);
            background-color: greenyellow;
            border-radius: 20px;
            padding: 8px;
            border: 3px solid black;
        }
        #classesTable
        {
            text-align: center;
            width: 100%;
            height: 80%;
            background-color: white;
            border: 4px solid black;
            border-radius: 20px;
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
            width: 20%;
            cursor: pointer;
        }
        #joinTable
        {
            position: absolute;
            width: 100%;
            top: 50%;
            left: 50%;
            transform: translate(-50%,-50%);
            text-align: center;
        }
        #pushrow
        {
            width: 95%;
        }
        #GamePanel
        {
            height: 78%;
            width: 38%;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%,-50%);
            border: 4px solid black;
            border-radius: 10px;
            background-image: url('Images/Map.jpg');
            background-size: contain;
        }
        #map
        {
            width: 90%;            
            z-index: -1;
        }
        #classname
        {
            color: white;
            font-size: 30px;
        }
        #CloseMap
        {
            color: white;
            text-decoration: none;
            position: absolute;
            font-size: 30px;
            top: 1%;
            left: 95%;
        }
        .levelButton
        {
            height: 40px;
            width: 40px;
            position: absolute;
        }
        #btn1
        {
            top: 70%;
            left: 50%;
        }
        #btn2
        {
            top: 85%;
            left: 7%;
        }
        #btn3
        {
            top: 55%;
            left: 8%;
        }
        #btn4
        {
            top: 50%;
            left: 50%;
        }
        #btn5
        {
            top: 35%;
            left: 76%;
        }
        #btn6
        {
            top: 25%;
            left: 50%;
        }
        #btn7
        {
            top: 3%;
            left: 33%;
        }
        #btn8
        {
            top: 3%;
            left: 82%;
        }
        #selectButton
        {
            width: 130%;
        }
        #corgi
        {
            border-radius: 150px 150px 0px 0px;
            border: 4px solid black;
            border-bottom: 0px;
        }
        .ExitButton
        {
            position: absolute;
            left: 97%;
            font-size: 20px;
            text-decoration: none;
            color: black;
        }        
    </style>
</head>
<body>
    <asp:Image ID="bgImage" runat="server"  ImageUrl="~/Images/BackgroundLanding.jpg" />
    <form id="form1" runat="server">
        <div>
            <div id="headerTop" runat="server">
                <asp:Label ID="pageTitle" runat="server" Text="SpeakStat"></asp:Label>
                <asp:Button ID="logoutBtn" runat="server" Text="Log Out" CssClass="image" OnClick="logoutBtn_Click" />
                <asp:Button ID="viewClass" runat="server" Text="View My Classes" CssClass="image" OnClick="viewClass_Click" />
                <asp:Button ID="joinClass" runat="server" Text="Join A Class" CssClass="image" OnClick="joinClass_Click" />
            </div>
        </div>

        <div id="WelcomePanel" runat="server"><br />
            <asp:Image id="corgi" runat="server" ImageUrl="~/Images/corgi.gif" Height="120px" Width="170px" />
            <table id="classesTable" runat="server">
                <tr>
                    <td style="text-align: center;">
                        <asp:Label ID="lblWelcome" runat="server" Text="sampletext"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:DataList ID="allClasses" runat="server">
                            <HeaderTemplate>
                                <table class="classBox" runat="server">
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label2" CssClass="SubLabels" runat="server" Text="Class ID"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="Label1" CssClass="SubLabels" runat="server" Text="Class Name"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="Label3" CssClass="SubLabels" runat="server" Text="Teacher"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="Label4" CssClass="SubLabels" runat="server" Text="Action"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <table class="classBox" runat="server">
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label2" CssClass="SubLabels" runat="server" Text=<%#Eval("ClassID") %>></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="Label1" CssClass="SubLabels" runat="server" Text=<%#Eval("ClassName") %>></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="Label5" CssClass="SubLabels" runat="server" Text=<%#Eval("FName") + " " + Eval("LName")%>></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Button ID="joinFromList" runat="server" Text="Join" CssClass="leButton" ValidationGroup="JoinClass" OnClick="joinFromList_Click" CommandArgument=<%#Eval("ClassID") %> />
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:DataList>
                    </td>
                </tr>
            </table>
        </div>

        <div id="ViewClassPanel" runat="server"><br />
            <asp:Label ID="lblMyClasses" runat="server" Text="My Classes"></asp:Label>
            <asp:LinkButton ID="CloseClassPanel" runat="server" Text="X" CssClass="ExitButton" OnClick="CloseClassPanel_Click" />
            <asp:DataList ID="myClasses" runat="server">
                <HeaderTemplate>
                    <table class="classBox" runat="server">
                        <tr>
                            <td>
                                <asp:Label ID="Label2" CssClass="SubLabels" runat="server" Text="Class ID"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="Label1" CssClass="SubLabels" runat="server" Text="Class Name"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="Label3" CssClass="SubLabels" runat="server" Text="Action"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </HeaderTemplate>
                <ItemTemplate>
                    <table class="classBox" runat="server">
                        <tr>
                            <td>
                                <asp:Label ID="Label2" CssClass="SubLabels" runat="server" Text=<%#Eval("ClassID") %>></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="Label1" CssClass="SubLabels" runat="server" Text=<%#Eval("ClassName") %>></asp:Label>
                            </td>
                            <td>
                                <asp:Button ID="selectClass" CssClass="leButton selectButton" runat="server" Text="SELECT" CausesValidation="false" Width="80%" OnClick="selectClass_Click" CommandArgument='<%# Eval("ClassName") %>'/>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:DataList>
        </div>

        <div id="JoinClassPanel" runat="server"><br />
            <asp:Label ID="showJoinClass" runat="server" Text="Join A Class"></asp:Label>
            <asp:LinkButton ID="CloseJoinPanel" runat="server" Text="X" CssClass="ExitButton" OnClick="CloseJoinPanel_Click" />
            <table id="joinTable" runat="server">
                <tr id="pushrow">
                    <td>
                        <asp:Label CssClass="SubLabels" runat="server" ID="Label9" Text="Enter Class Code: " />   
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="classCodeBox" CssClass="inputbox" />&nbsp;&nbsp;<asp:Button ID="joinClassButton" runat="server" Text="Join" CssClass="leButton" ValidationGroup="JoinClass" OnClick="joinClassButton_Click" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:RequiredFieldValidator ID="rq1" runat="server" ErrorMessage="Please input a class code" ControlToValidate="classCodeBox" ValidationGroup="JoinClass"></asp:RequiredFieldValidator>
                    </td>
                </tr>
            </table>
        </div>

        <div id="GamePanel" runat="server"><br />
            &nbsp; <asp:Label ID="classname" runat="server" Text="Label"></asp:Label>
            <asp:LinkButton ID="CloseMap" runat="server" Text="X" OnClick="CloseMap_Click" />
            <asp:ImageButton ID="btn1" CssClass="levelButton" runat="server" ImageUrl="~/Images/btn1.png" OnClick="level_Clicked" />
            <asp:ImageButton ID="btn2" CssClass="levelButton" runat="server" ImageUrl="~/Images/btn2.png" OnClick="level_Clicked" />
            <asp:ImageButton ID="btn3" CssClass="levelButton" runat="server" ImageUrl="~/Images/btn3.png" OnClick="level_Clicked" />
            <asp:ImageButton ID="btn4" CssClass="levelButton" runat="server" ImageUrl="~/Images/btn4.png" OnClick="level_Clicked" />
            <asp:ImageButton ID="btn5" CssClass="levelButton" runat="server" ImageUrl="~/Images/btn5.png" OnClick="level_Clicked" />
            <asp:ImageButton ID="btn6" CssClass="levelButton" runat="server" ImageUrl="~/Images/btn6.png" OnClick="level_Clicked" />
            <asp:ImageButton ID="btn7" CssClass="levelButton" runat="server" ImageUrl="~/Images/btn7.png" OnClick="level_Clicked" />
            <asp:ImageButton ID="btn8" CssClass="levelButton" runat="server" ImageUrl="~/Images/btn8.png" OnClick="level_Clicked" />
        </div>

    </form>
</body>
</html>
