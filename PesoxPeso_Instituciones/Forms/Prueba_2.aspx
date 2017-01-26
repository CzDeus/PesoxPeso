<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Prueba_2.aspx.cs" Inherits="Forms_Prueba_2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="Server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="row col-lg-12">
        <asp:FileUpload ID="Prueba_FileUpload" runat="server" />
    </div>

    <div class="row col-lg-12">
        <asp:Button ID="Subir_Button" runat="server" Text="Subir" OnClick="Subir_Button_Click"/>
    </div>
    
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="cphScript" runat="Server">
</asp:Content>

