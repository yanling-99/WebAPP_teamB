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
        <asp:SqlDataSource ID="trans_select" runat="server" ConnectionString="<%$ ConnectionStrings:TextbookChangedPlatformConnectionString %>" SelectCommand="SELECT [transID] FROM [Transaction] WHERE ([buyerID] IS NOT NULL) ORDER BY transID  DESC;"></asp:SqlDataSource>
        &nbsp<asp:Button ID="Button1" runat="server" DataSourceID="order_grid" CommandName="Insert" Text="Search" Width="100px" Height="35px" Font-Size="Large" BorderColor="Transparent"/>
    </p>
    <p>
        <asp:FormView ID="FormView1" runat="server" DataSourceID="order_grid" Width="476px"  Font-Size="Large">
            <EditItemTemplate>
                transID:
                <asp:Label ID="Label1" runat="server" Text='<%# Bind("transID") %>'></asp:Label>
                <br />
                sellerID:
                <asp:Label ID="Label2" runat="server" Text='<%# Bind("sellerID") %>'></asp:Label>
                <br />
                buyerID:
                <asp:Label ID="Label3" runat="server" Text='<%# Bind("buyerID") %>'></asp:Label>
                <br />
                productID:
                <asp:Label ID="Label4" runat="server" Text='<%# Bind("productID") %>'></asp:Label>
                <br />
                price:
                <asp:Label ID="Label5" runat="server" Text='<%# Bind("price") %>'></asp:Label>
                <br />
                date:
                <asp:TextBox ID="dateTextBox" runat="server" Text='<%# Bind("date") %>' />
                &nbsp;(ex: 2022/11/30)<br />logID:
                <asp:DropDownList ID="DropDownList2" runat="server" SelectedValue='<%# Bind("logID") %>'>
                    <asp:ListItem Value="">(Please select)</asp:ListItem>
                    <asp:ListItem Value="1">FedEx</asp:ListItem>
                    <asp:ListItem Value="2">UPS</asp:ListItem>
                    <asp:ListItem Value="3">DHL</asp:ListItem>
                    <asp:ListItem Value="4">USPS</asp:ListItem>
                    <asp:ListItem Value="5">C. H. Robinson</asp:ListItem>
                </asp:DropDownList>
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <EmptyDataTemplate>
                This order does not exist yet.
                <br />
                <br />
                Already have an order?<br /> Try press this 
                &quot;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Refresh" />&quot; button.
            </EmptyDataTemplate>
            <InsertItemTemplate>
                &nbsp;Order is ready to refresh<br />&nbsp;Please press &quot;OK&quot; to refresh<br /> <br />
                &nbsp;<asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="OK" />
                &nbsp;&nbsp;&nbsp;&nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                Current transID:
                <asp:Label ID="transIDLabel" runat="server" Text='<%# Bind("transID") %>' />
                <br />
                sellerID:
                <asp:Label ID="sellerIDLabel" runat="server" Text='<%# Bind("sellerID") %>' />
                <br />
                buyerID:
                <asp:Label ID="buyerIDLabel" runat="server" Text='<%# Bind("buyerID") %>' />
                <br />
                productID:
                <asp:Label ID="productIDLabel" runat="server" Text='<%# Bind("productID") %>' />
                <br />
                price:
                <asp:Label ID="priceLabel" runat="server" Text='<%# Bind("price") %>' />
                <br />
                date:
                <asp:Label ID="dateLabel" runat="server" Text='<%# Bind("date") %>' />
                <br />
                logID:
                <asp:Label ID="logIDLabel" runat="server" Text='<%# Bind("logID") %>' />
                <br />
                <br />
                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text=" Edit Date & Logistics " Height="35px" Width="220px" style="text-align:center" BorderStyle="Outset" BorderWidth="2px" />
            </ItemTemplate>
        </asp:FormView>
    </p>
      <p>
          &nbsp;</p>
    <div style="text-align:center; font-size:18px">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="order_grid" Width="1200px">
            <Columns>
                <asp:BoundField DataField="transID" HeaderText="transID" SortExpression="transID" />
                <asp:BoundField DataField="sellerID" HeaderText="sellerID" SortExpression="sellerID" />
                <asp:BoundField DataField="buyerID" HeaderText="buyerID" SortExpression="buyerID" />
                <asp:BoundField DataField="productID" HeaderText="productID" SortExpression="productID" />
                <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
                <asp:BoundField DataField="date" HeaderText="date" SortExpression="date" />
                <asp:BoundField DataField="logID" HeaderText="logID" SortExpression="logID" />
            </Columns>
            <HeaderStyle BackColor="#8B5A2B" ForeColor="#FFFAFA" VerticalAlign="Middle" />
        </asp:GridView>
        <asp:SqlDataSource ID="order_grid" runat="server" ConnectionString="<%$ ConnectionStrings:TextbookChangedPlatformConnectionString %>" 
            SelectCommand="SELECT [transID], [sellerID], [buyerID], [productID], [price], [date], [logID] FROM [order] WHERE ([transID] = @transID)" 
            InsertCommand="INSERT INTO [order] ([transID], [sellerID], [buyerID], [productID], [price]) 
            SELECT [transID], [sellerID], [buyerID], [productID], [price] 
            FROM [Transaction] 
            WHERE [buyerID] IS NOT NULL AND [buyerID] !=0 AND [transID] NOT IN (SELECT transID FROM [order]);" 
            UpdateCommand="UPDATE [order] SET [date] = @date, [logID] = @logID WHERE [transID] = @transID">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="transID" PropertyName="SelectedValue" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="date" />
                <asp:Parameter Name="logID" />
                <asp:Parameter Name="transID" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
    <p>
        &nbsp;</p>
</asp:Content>
