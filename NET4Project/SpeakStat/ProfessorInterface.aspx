<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProfessorInterface.aspx.cs" Inherits="SpeakStat.ProfessorInterface" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="icon" href="Images/corgo.JPG"/>
    <title>SpeakStat Professor</title>
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
        #logoutBtn, #viewClass, #createClass
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
        #createClass
        {
            left: 40%;
            width: auto;
        }
        #ViewClassPanel, #CreateClassPanel, #ProgressPanel, #EditClassLevels
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
            overflow-y: scroll;
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
                <asp:Button ID="logoutBtn" runat="server" Text="Log Out" CssClass="image" OnClick="logoutBtn_Click"/>
                <asp:Button ID="viewClass" runat="server" Text="View My Classes" CssClass="image" OnClick="viewClass_Click"/>
                <asp:Button ID="createClass" runat="server" Text="Create A Class" CssClass="image" OnClick="createClass_Click"/>
            </div>
        </div>

        <div id="ViewClassPanel" runat="server"><br />
            <asp:Label ID="lblMyClasses" runat="server" Text="My Classes"></asp:Label>
            <asp:LinkButton ID="CloseClassPanel" runat="server" Text="X" CssClass="ExitButton" OnClick="CloseClassPanel_Click" />
            <asp:DataList ID="myClasses" runat="server">
                <HeaderTemplate>
                    <table class="classBox" runat="server">
                        <tr>
                            <td class="abot">
                                <asp:Label ID="Label2" CssClass="SubLabels" runat="server" Text="ClassID - ClassName"></asp:Label>
                            </td>
                            <td colspan="2">
                                <asp:Label CssClass="SubLabels" runat="server" ID="Label9" Text="ACTIONS" />
                            </td>
                        </tr>
                    </table>
                </HeaderTemplate>
                <ItemTemplate>
                    <table class="classBox" runat="server">
                        <tr>
                            <td class="abot">
                                <asp:Label ID="Label2" CssClass="SubLabels" runat="server" Text='<%#Eval("ClassID") %>'></asp:Label>
                                <asp:Label ID="Label3" CssClass="SubLabels" runat="server" Text=" - "></asp:Label>
                                <asp:Label ID="Label1" CssClass="SubLabels" runat="server" Text='<%#Eval("ClassName") %>'></asp:Label>
                            </td>
                            <td>
                                <asp:Button ID="viewProgress" CssClass="leButton" runat="server" Text="PROGRESS" CausesValidation="false" OnClick="viewProgress_Click" CommandArgument='<%#Eval("ClassID") %>'/>
                            </td>
                            <td>
                                <asp:Button ID="editLevels" CssClass="leButton" runat="server" Text="EDIT LEVELS" CausesValidation="false" OnClick="editLevels_Click" CommandArgument='<%#Eval("ClassID") + " - " + Eval("ClassName") %>'/>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:DataList>
        </div>

        <div id="CreateClassPanel" runat="server"><br />
            <asp:LinkButton ID="CloseCreatePanel" runat="server" Text="X" CssClass="ExitButton" OnClick="CloseCreatePanel_Click" />
            <asp:Label ID="showCreateClass" runat="server" Text="Create A Class"></asp:Label>
            <table id="createTable" runat="server">
                <tr>
                    <td>
                        <asp:Label CssClass="SubLabels" runat="server" ID="Label9" Text="New Class: " />   
                    </td>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:TextBox runat="server" ID="classNameBox" CssClass="inputbox" />
                        <asp:RequiredFieldValidator ID="rq1" runat="server" ErrorMessage="Please input a class name" ControlToValidate="classNameBox" ValidationGroup="CreateClass"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td colspan="2"><br />
                        <asp:Button ID="createNewClass" CssClass="leButton" runat="server" Text="CREATE" ValidationGroup="CreateClass" OnClick="createNewClass_Click"/>
                    </td>
                </tr>
            </table>
        </div>

        <div id="ProgressPanel" runat="server">
            <asp:Label ID="viewProgress" runat="server" Text="Create A Class"></asp:Label>
            <asp:LinkButton ID="CloseProgressPanel" runat="server" Text="X" CssClass="ExitButton" OnClick="CloseProgressPanel_Click" />
            <asp:DataList ID="myProgress" runat="server">
                <HeaderTemplate>
                    <table class="classBox" runat="server">
                        <tr>
                            <td class="abot">
                                <asp:Label ID="Label2" CssClass="SubLabels" runat="server" Text="Last Name"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="Label4" CssClass="SubLabels" runat="server" Text="Level Number"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </HeaderTemplate>
                <ItemTemplate>
                    <table class="classBox" runat="server">
                        <tr>
                            <td class="abot">
                                <asp:Label ID="Label2" CssClass="SubLabels" runat="server" Text=<%#Eval("LName") %>></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="Label4" CssClass="SubLabels" runat="server" Text=<%#Eval("LevelNumber") %>></asp:Label>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:DataList>
        </div>

        <div id="EditClassLevels" runat="server"><br />
            <asp:Label ID="showClassID" runat="server" Text="" /><br />
            <asp:LinkButton ID="CloseClassLevels" runat="server" Text="X" CssClass="ExitButton" OnClick="CloseClassLevels_Click" />
            
            <div style="overflow:scroll; height:80%;">
                <asp:DataList ID="EditDataList" runat="server">
                <HeaderTemplate>
                    <table class="classBox" runat="server">
                        <tr>
                            <td class="abot">
                                <asp:Label ID="Label2" CssClass="SubLabels" runat="server" Text="Level Number"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="Label4" CssClass="SubLabels" runat="server" Text="Video Link"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="Label124" CssClass="SubLabels" runat="server" Text="Actions"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </HeaderTemplate>
                <ItemTemplate>
                    <table class="classBox" runat="server">
                        <tr>
                            <td class="abot">
                                <asp:Label ID="Label2" CssClass="SubLabels" runat="server" Text='<%#Eval("LevelNumber") %>'></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="tbo" CssClass="inputbox" runat="server" Text='<%#Eval("VideoLink") %>'></asp:TextBox>
                            </td>
                            <td>
                                <asp:Button ID="EditLevel" CssClass="leButton" runat="server" Text="Edit" CommandArgument='<%#Eval("LevelNumber")%>' OnClick="EditLevel_Click" />
                                <asp:Button ID="DeleteLevel" CssClass="leButton" runat="server" Text="Remove" CommandArgument='<%#Eval("LevelNumber")%>' OnClick="DeleteLevel_Click" />
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
                <FooterTemplate>
                    <table class="classBox" runat="server">
                        <tr>
                            <td colspan="3">
                                <asp:Button ID="AddLevel" CssClass="leButton" runat="server" Text="ADD LEVEL" OnClick="AddLevel_Click" />
                            </td>
                        </tr>
                    </table>
                </FooterTemplate>
            </asp:DataList>
            </div>

        </div>


    </form>
</body>
</html>
