<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LandingPage.aspx.cs" Inherits="SpeakStat.LandingPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SpeakStat Landing Page</title>
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
        #pageTitle
        {
            color: white;
            font-size: 125px;
            text-shadow: -4px -4px black, 4px -4px black, -4px 4px black, 4px 4px black;
            position: absolute;
            top: 30px;
            left: 100px;
        }
        #bgImage
        {
            position: absolute;
            top: 0px;
            left: 0px;
            height: 910px;
            z-index: -1;
        }
        .HeadLabels
        {
            font-size: 50px;
            color: white;
            text-shadow: -2px -2px black, 2px -2px black, -2px 2px black, 2px 2px black;
            
        }
        .SubLabels
        {
            font-size: 30px;
            color: white;
            text-shadow: -2px -2px black, 2px -2px black, -2px 2px black, 2px 2px black;
        }
        #loginpanel
        {
            position: absolute;
            top: 180px;
            left: 50px;
            width: 700px;
            height: 672px;
            background-color: rgba(255,255,255,0.5);
            padding: 50px;
            border-radius: 40px;
            text-align: center;
        }
        #registerpanel
        {
            text-align:  center;
            position: absolute;
            top: 50px;
            left: 850px;
            width: 700px;
            height: 400px;
            background-color: rgba(255,255,255,0.5);
            padding: 50px;
            border-radius: 40px;
        }
        .inputbox
        {
            font-size: 30px;
            border-radius: 20px;
            width: 95%;
            height: 95%;
            border: 2px solid black;
        }
        #login, #registerButton
        {
            font-family: "Walkway Black";
            background-color: limegreen;
            font-size: 30px;
            border-radius: 20px;
            padding: 30px;
            border: 3px solid black;
            width: 100%;
            cursor: pointer;
        }

        #registerButton
        {
            background-color: aqua;
        }
        
        #login:hover
        {
            background-color: green;
        }

        #registerButton:hover
        {
            background-color: cornflowerblue;
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

    </style>
</head>
<body>
    <asp:Image ID="bgImage" runat="server"  ImageUrl="~/Images/BackgroundLanding.jpg" />
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="pageTitle" runat="server" Text="SpeakStat"></asp:Label>
            <table id="loginpanel">
                <tr>
                    <td>
                        <asp:Label CssClass="HeadLabels" ID="Label1" runat="server" Text="Log In To Existing Account"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td><br />
                        <asp:Label CssClass="SubLabels" ID="Label2" runat="server" Text="Username/Email:"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox CssClass="inputbox" ID="TextBox1" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td><br />
                        <asp:Label CssClass="SubLabels" ID="Label3" runat="server" Text="Password:"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox CssClass="inputbox" ID="TextBox2" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td><br />
                        <asp:Button ID="login" runat="server" Text="Log In" />
                    </td>
                </tr>
            </table>

            <table id="registerpanel">
                <tr>
                    <td colspan="3">
                        <asp:Label CssClass="HeadLabels" ID="Label4" runat="server" Text="Register an Account"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <br /><br />
                        <asp:ImageButton ID="ImageButton1" ImageUrl="~/Images/STUDENT.png" Height="120px" Width="120px" runat="server" CssClass="image" />
                        <br />
                        <asp:Label CssClass="SubLabels" ID="Label5" runat="server" Text="STUDENT"></asp:Label>
                        <!-- insert imagebuttons here-->
                    </td>
                    <td>
                        <br /><br />
                        <asp:ImageButton ID="ImageButton2" ImageUrl="~/Images/PARENT.png" Height="120px" Width="120px" runat="server" CssClass="image" />
                        <br />
                        <asp:Label CssClass="SubLabels" ID="Label6" runat="server" Text="PARENT"></asp:Label>
                        <!-- insert imagebuttons here-->
                    </td>
                    <td>
                        <br /><br />
                        <asp:ImageButton ID="ImageButton3" ImageUrl="~/Images/TEACHER.png" Height="120px" Width="120px" runat="server" CssClass="image" />
                        <br />
                        <asp:Label CssClass="SubLabels" ID="Label7" runat="server" Text="TEACHER"></asp:Label>
                        <!-- insert imagebuttons here-->
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <br /><br />
                       <table>
                           <tr>
                                <td colspan="2">
                                    <asp:Label CssClass="SubLabels" runat="server" ID="Label8" Text="Given Name:" />
                                    <br />
                                    <asp:TextBox runat="server" ID="givenName" CssClass="inputbox" />
                                </td>
                                <td colspan="2">
                                    <asp:Label CssClass="SubLabels" runat="server" ID="Label9" Text="Username:" />
                                    <br />
                                    <asp:TextBox runat="server" ID="registerUsername" CssClass="inputbox" />
                                </td>
                           </tr>
                           <tr>
                                <td colspan="2">
                                    <br /><br />
                                    <asp:Label CssClass="SubLabels" runat="server" ID="Label10" Text="Last Name:" />
                                    <br />
                                    <asp:TextBox runat="server" ID="lastName" CssClass="inputbox" />
                                </td>
                                <td colspan="2">
                                    <br /><br />
                                    <asp:Label CssClass="SubLabels" runat="server" ID="Label11" Text="Password: " />
                                    <br />
                                    <asp:TextBox runat="server" ID="registerPassword" CssClass="inputbox" TextMode="Password" />
                                </td>
                           </tr>
                           <tr>
                                <td colspan="2">
                                    <br /><br />
                                    <asp:Label CssClass="SubLabels" runat="server" ID="Label12" Text="Email Address: " />
                                    <br />
                                    <asp:TextBox runat="server" ID="TextBox3" CssClass="inputbox" />
                                </td>
                                <td colspan="2">
                                    <br /><br />
                                    <asp:Label CssClass="SubLabels" runat="server" ID="Label13" Text="Confirm Password: " />
                                    <br />
                                    <asp:TextBox runat="server" ID="TextBox4" CssClass="inputbox" TextMode="Password" />
                                </td>
                           </tr>
                           <tr>
                               <td colspan="4">
                                   <br /><br />
                                   <asp:Button runat="server" Text="Register" ID="registerButton" />
                               </td>
                           </tr>
                       </table>
                    </td>
                </tr>
            </table>
        </div>
    </form>
    <div id="forLogin" runat="server">

    </div>
</body>
</html>
