<%@ Page Title="" Language="C#" MasterPageFile="~/AddUpdateSite.Master" AutoEventWireup="true" CodeBehind="DodajDjelatnika.aspx.cs" Inherits="Aplikacija_za_administraciju.EntityForms.DodajDjelatnika" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="dodajDjelatnika" class="container" runat="server">
        <div class="row justify-content-center mt-5">
            <div class="col-sm-6">
                <h3>Dodaj djelatnika</h3>
                <hr />
                <div class="form-group">
                    <asp:Label Text="Ime: " runat="server" />
                    <asp:RequiredFieldValidator
                        ErrorMessage="Niste unijeli ime"
                        ControlToValidate="txtIme" runat="server"
                        Text="*"
                        CssClass="error-text" />
                    <asp:TextBox runat="server" ID="txtIme" CssClass="form-control" />

                </div>
                <div class="form-group">
                    <asp:Label Text="Prezime: " runat="server" />
                    <asp:RequiredFieldValidator
                        ErrorMessage="Niste unijeli prezime"
                        ControlToValidate="txtPrezime" runat="server"
                        Text="*"
                        CssClass="error-text" />
                    <asp:TextBox runat="server" ID="txtPrezime" CssClass="form-control" />
                </div>
                <div class="form-group">
                    <asp:Label Text="E-mail: " runat="server" />
                    <asp:TextBox runat="server" TextMode="Email" ID="txtEmail" CssClass="form-control" />
                </div>
                <div class="form-group">
                    <asp:Label Text="Zaporka: " runat="server" />
                    <asp:RequiredFieldValidator
                        ErrorMessage="Niste unijeli zaorku"
                        ControlToValidate="txtZaporka" runat="server"
                        CssClass="error-text"
                        Text="*" />
                    <asp:TextBox runat="server" TextMode="Password" ID="txtZaporka" CssClass="form-control" />
                </div>
                <div class="form-group">
                    <asp:Label Text="Tip djelatnika: " runat="server" />
                    <asp:DropDownList runat="server" ID="ddlTipDjelatnika" CssClass="form-control" />
                </div>
                <div class="form-group">
                    <asp:Label Text="Tim: " runat="server" />
                    <asp:DropDownList runat="server" ID="ddlTimovi" CssClass="form-control" />
                </div>
                <div class="form-group d-flex">
                    <asp:Button Text="Spremi" CssClass="btn btn-success m-auto" runat="server" OnClick="DodajDjelatnika_Click" />
                </div>
            </div>
        </div>
    </div>
    <script>
        $(document).ready(function () {
            $('.navbar-brand').text("Dodaj djelatnika");
        })
    </script>
</asp:Content>
