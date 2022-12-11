<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="WebApplication_B.Product.Search" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ClearContent" runat="server">
    <br /><br /><br />
    <form action="SearchResult.aspx" method="get">
        <h style="font-size: 20px; font-weight: bold">Keyword:</h>
        <input id="TextKeyword" type="text" name="keyword" style="font-size: 18px">
        <input id="SubmitKeyword" type="submit" value="Submit" style="width: 100px; font-weight: bold">
    </form>
    
</asp:Content>
