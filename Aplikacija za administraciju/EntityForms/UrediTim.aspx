<%@ Page Title="" Language="C#" MasterPageFile="~/AddUpdateSite.Master" AutoEventWireup="true" CodeBehind="UrediTim.aspx.cs" Inherits="Aplikacija_za_administraciju.EntityForms.UrediTim" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content">
        <div class="row justify-content-center mt-5">
            <div class="col-sm-6">
                <h3>Uredi tim</h3>
                <hr />
                <div class="form-group">
                    <asp:Label Text="Naziv: " runat="server" />
                    <asp:RequiredFieldValidator
                        ErrorMessage="Niste unijeli naziv"
                        ControlToValidate="txtNaziv" runat="server"
                        Text="*"
                        CssClass="error-text" />
                    <asp:TextBox runat="server" ID="txtNaziv" CssClass="form-control" />
                </div>
                <div class="form-group d-flex">
                    <asp:Button Text="Spremi" CssClass="btn btn-success m-auto" runat="server" OnClick="UrediTim_Click" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
