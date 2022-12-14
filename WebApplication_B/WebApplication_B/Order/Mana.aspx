<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Mana.aspx.cs" Inherits="WebApplication_B.Order.Mana" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        &nbsp;</p>
    <p>
<h style="font-size: 22px; font-weight: bold">Please select a Transaction first.&nbsp; </h>
    </p>
    <p>
        <h style="font-size: 20px; font-weight: bold"> </h>
        <br />
        <h style="font-size: 20px">Select a transID:&nbsp; </h>
        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="trans_select" DataTextField="transID" DataValueField="transID" Font-Size="Large" Height="25px" Width="300px">
        </asp:DropDownList>
        <asp:SqlDataSource ID="trans_select" runat="server" ConnectionString="<%$ ConnectionStrings:TextbookChangedPlatformConnectionString %>" SelectCommand="SELECT [transID] FROM [Transaction]"></asp:SqlDataSource>
    </p>
    <p>
        &nbsp;</p>
    <p>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="order_grid" ForeColor="Black" GridLines="Vertical" Width="1200px">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="transID" HeaderText="transID" SortExpression="transID" />
                <asp:BoundField DataField="sellerID" HeaderText="sellerID" SortExpression="sellerID" />
                <asp:BoundField DataField="buyerID" HeaderText="buyerID" SortExpression="buyerID" />
                <asp:BoundField DataField="productID" HeaderText="productID" SortExpression="productID" />
                <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
                <asp:BoundField DataField="date" HeaderText="date" SortExpression="date" />
                <asp:BoundField DataField="logID" HeaderText="logID" SortExpression="logID" />
            </Columns>
            <FooterStyle BackColor="#CCCC99" />
            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
            <RowStyle BackColor="#F7F7DE" />
            <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#FBFBF2" />
            <SortedAscendingHeaderStyle BackColor="#848384" />
            <SortedDescendingCellStyle BackColor="#EAEAD3" />
            <SortedDescendingHeaderStyle BackColor="#575357" />
        </asp:GridView>
        <asp:SqlDataSource ID="order_grid" runat="server" ConnectionString="<%$ ConnectionStrings:TextbookChangedPlatformConnectionString %>" SelectCommand="SELECT [transID], [sellerID], [buyerID], [productID], [price], [date], [logID] FROM [order] WHERE ([transID] = @transID)">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="transID" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
    <p>
        &nbsp;</p>
</asp:Content>
