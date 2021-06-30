<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Aplikacija_za_administraciju.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <script src="Scripts/jquery-3.0.0.js"></script>
    <script src="Scripts/bootstrap.js"></script>
    <link href="Content/LoginCustom.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="content">
            <div class="row justify-content-center">
                <div class="col-sm-6">
                        <div class="form-group d-flex form-size m-auto">
                            <asp:Label Text="E-mail: " CssClass="mr-3 w-25 align-self-center font-weight-bold text-light" runat="server" />
                            <asp:TextBox runat="server" ID="txtEmail" CssClass="form-control" />
                        </div>
                        <div class="form-group d-flex form-size pt-3 m-auto">
                            <asp:Label Text="Zaporka: " CssClass="mr-3 w-25 align-self-center font-weight-bold text-light" runat="server" />
                            <asp:TextBox runat="server" TextMode="Password" ID="txtPassword" CssClass="form-control" />
                        </div>
                        <div class="form-group d-flex form-size pt-3 m-auto">
                            <asp:Button Text="Prijava" CssClass="btn btn-primary btn-lg m-auto" runat="server" OnClick="btnLogin_Click" />
                        </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
