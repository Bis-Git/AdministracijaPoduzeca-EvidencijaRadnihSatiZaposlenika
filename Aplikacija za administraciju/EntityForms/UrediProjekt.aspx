<%@ Page Title="" Language="C#" MasterPageFile="~/AddUpdateSite.Master" AutoEventWireup="true" CodeBehind="UrediProjekt.aspx.cs" Inherits="Aplikacija_za_administraciju.EntityForms.UrediProjekt" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row justify-content-center mt-5">
            <div class="col-sm-6">
                <h3>Uredi klijenta</h3>
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
                <div class="form-group">
                    <asp:Label Text="Klijent: " runat="server" />
                    <asp:DropDownList runat="server" ID="ddlKlijent" CssClass="form-control" />
                </div>
                <div class="form-group">
                    <asp:Label Text="Voditelj projekta: " runat="server" />
                    <asp:DropDownList runat="server" ID="ddlVoditelj" CssClass="form-control" />
                </div>
                <div class="form-group d-flex">
                    <asp:Button Text="Spremi" CssClass="btn btn-success m-auto" runat="server" OnClick="UrediProjekt_Click" />
                    <asp:HiddenField ID="idField" runat="server" ClientIDMode="Static" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
