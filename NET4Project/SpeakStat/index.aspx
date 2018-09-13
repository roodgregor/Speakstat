<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="SpeakStat.LandingPage" %>

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
            font-size: 650%;
            text-shadow: -4px -4px black, 4px -4px black, -4px 4px black, 4px 4px black;
            position: absolute;
            top: 20px;
            left: 50px;
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
        #loginpanel
        {
            position: absolute;
            top: 21%;
            left: 3.8%;
            width: 41%;
            height: 75%;
            background-color: rgba(255,255,255,0.5);
            padding: 20px;
            border-radius: 40px;
            text-align: center;
        }
        #registerpanel
        {
            text-align:  center;
            position: absolute;
            top: 5.5%;
            left: 48%;
            width: 50%;
            height: 90.5%;
            background-color: rgba(255,255,255,0.5);
            padding: 20px;
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
            width: 7em;
            height: 7em;
        }

        .image:hover
        {
            opacity: 0.7;
        }
        #viewscreen
        {
            position: absolute;
            top: 50%;
            left: 50%;
            height: 100%;
            width: 100%;
            transform: translate(-50%,-50%);
        }
        #subtable
        {
            width: 100%;
        }
    </style>
</head>
<body>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <asp:Image ID="bgImage" runat="server"  ImageUrl="~/Images/BackgroundLanding.jpg" />
        <form id="form1" runat="server">
            <div id="viewscreen" runat="server">
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
                            <asp:TextBox CssClass="inputbox" ID="LoginUsernametxt" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Username must not be empty." ControlToValidate="LoginUsernametxt" ValidationGroup="login"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td><br />
                            <asp:Label CssClass="SubLabels" ID="Label3" runat="server" Text="Password:"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:TextBox CssClass="inputbox" ID="LoginUserpasstxt" runat="server" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Password must not be empty." ControlToValidate="LoginUserpasstxt" ValidationGroup="login"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td><br />
                            <asp:Button ID="login" runat="server" Text="Log In" ValidationGroup="login" OnClick="Login_Click" />
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
                            <asp:ImageButton ID="forStudent" ImageUrl="~/Images/STUDENT.png" runat="server" CssClass="image" CausesValidation="false" OnClick="Studentbtn_Click" />
                            <br />
                            <asp:Label CssClass="SubLabels" ID="Label5" runat="server" Text="STUDENT"></asp:Label>
                            <!-- insert imagebuttons here-->
                        </td>
                        <td>
                            <asp:ImageButton ID="forParent" ImageUrl="~/Images/PARENT.png" runat="server" CssClass="image" CausesValidation="false" OnClick="Parentbtn_Click" />
                            <br />
                            <asp:Label CssClass="SubLabels" ID="Label6" runat="server" Text="PARENT"></asp:Label>
                            <!-- insert imagebuttons here-->
                        </td>
                        <td>
                            <asp:ImageButton ID="forTeacher" ImageUrl="~/Images/TEACHER.png" runat="server" CssClass="image" CausesValidation="false" OnClick="Teacherbtn_Click" />
                            <br />
                            <asp:Label CssClass="SubLabels" ID="Label7" runat="server" Text="TEACHER"></asp:Label>
                            <!-- insert imagebuttons here-->
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <br />
                           <table id="subtable" runat="server">
                               <tr>
                                    <td colspan="2">
                                        <asp:Label CssClass="SubLabels" runat="server" ID="Label8" Text="Given Name:" />
                                        <br />
                                        <asp:TextBox runat="server" ID="givenName" CssClass="inputbox" />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please input your given name." ControlToValidate="givenName" ValidationGroup="register"></asp:RequiredFieldValidator>
                                    </td>
                                    <td colspan="2">
                                        <asp:Label CssClass="SubLabels" runat="server" ID="Label9" Text="Username:" />
                                        <br />
                                        <asp:TextBox runat="server" ID="registerUsername" CssClass="inputbox" />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Please input your a username." ControlToValidate="registerUsername" ValidationGroup="register"></asp:RequiredFieldValidator>
                                    </td>
                               </tr>
                               <tr>
                                    <td colspan="2">
                                        <asp:Label CssClass="SubLabels" runat="server" ID="Label10" Text="Last Name:" />
                                        <br />
                                        <asp:TextBox runat="server" ID="lastName" CssClass="inputbox" />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Please input your last name." ControlToValidate="lastName" ValidationGroup="register"></asp:RequiredFieldValidator>
                                    </td>
                                    <td colspan="2">
                                        <asp:Label CssClass="SubLabels" runat="server" ID="Label11" Text="Password: " />
                                        <br />
                                        <asp:TextBox runat="server" ID="Passwordtxt" CssClass="inputbox" TextMode="Password" />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Please input a password." ControlToValidate="Passwordtxt" ValidationGroup="register"></asp:RequiredFieldValidator>
                                    </td>
                               </tr>
                               <tr>
                                    <td colspan="2">
                                        <asp:Label CssClass="SubLabels" runat="server" ID="Label12" Text="Email Address: " />
                                        <br />
                                        <asp:TextBox runat="server" ID="Emailtxt" CssClass="inputbox" />
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Please input a valid e-mail." ControlToValidate="Emailtxt" ValidationGroup="register" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic"></asp:RegularExpressionValidator><br />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Please input an e-mail." ControlToValidate="Emailtxt" ValidationGroup="register"></asp:RequiredFieldValidator>
                                    </td>
                                    <td colspan="2">
                                        <asp:Label CssClass="SubLabels" runat="server" ID="Label13" Text="Confirm Password: " />
                                        <br />
                                        <asp:TextBox runat="server" ID="ConfirmPasswordtxt" CssClass="inputbox" TextMode="Password" />
                                        <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Password Don't Match" ControlToCompare="Passwordtxt" ControlToValidate="ConfirmPasswordtxt" ValidationGroup="register"></asp:CompareValidator>
                                    </td>
                               </tr>
                               <tr>
                                   <td colspan="4">
                                       <asp:Button runat="server" Text="Register" ID="registerButton" ValidationGroup="register" OnClick="Register_Click" />
                                   </td>
                               </tr>
                           </table>
                        </td>
                    </tr>
                </table>
            </div>
        </form>
    </div>
</body>
</html>
