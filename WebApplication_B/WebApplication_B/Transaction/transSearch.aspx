<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="transSearch.aspx.cs" Inherits="WebApplication_B.Trans.Search" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br /><br /><br />
    <%-- 下拉式選單 columns --%>
    <p>
        <h style="font-size: 18px; font-weight: bold">Search by</h>
        &emsp;
        <asp:DropDownList ID="cols" runat="server" width="200px" Height="30px" Font-Size="18px" >
            <asp:ListItem>please select</asp:ListItem>
            <asp:ListItem>transID</asp:ListItem>
            <asp:ListItem>sellerID</asp:ListItem>
            <asp:ListItem>productID</asp:ListItem>
            <asp:ListItem>status</asp:ListItem>
            <asp:ListItem>buyerID</asp:ListItem>
        </asp:DropDownList>

        <br /> <br />

        <%-- 關鍵字搜尋 --%>
        <h style="font-size: 18px; font-weight: bold">keyword</h>
        &emsp;
        <asp:TextBox ID="keyTB" runat="server" Font-Size="Larger" Width="200px" Height="30px"></asp:TextBox>
        &emsp;<asp:Button ID="searchBtn" runat="server" Text="Search" Width="100px" Height="35px" Font-Size="Large" OnClick="searchBtn_Click" BorderColor="Transparent"/>
    </p>

    <%-- Search Result 文字--%>
    <br /><br />
    <asp:Label ID="SearchResult" runat="server" Text="Search Result :" Font-Size="X-Large" Font-Bold="True" Visible="False"></asp:Label>
    <br />
    <%-- table --%>
    <div style="text-align:center; font-size:18px">
        <asp:GridView ID="GridView1" runat="server"  Width="1200px">
            <EmptyDataTemplate>
                No Result.
            </EmptyDataTemplate>
            <HeaderStyle BackColor="#8B5A2B" ForeColor="#FFFAFA" VerticalAlign="Middle" />
        </asp:GridView>
    </div>
    <%-- 以下是 gridview 的 data source --%>
    <%-- search by trans---------------------------------- --%>
    <asp:SqlDataSource ID="trans" runat="server" ConnectionString="<%$ ConnectionStrings:TextbookChangedPlatformConnectionString %>" 
        SelectCommand="SELECT [Transaction].transID, [Transaction].sellerID, [Transaction].productID, [Transaction].price, TransStatus.description AS status, [Transaction].buyerID 
                        FROM [TransStatus] , [Transaction]
                        WHERE [Transaction].transID = @transID AND [Transaction].statusID = TransStatus.id">
        <SelectParameters>
            <asp:ControlParameter ControlID="keyTB" Name="transID" PropertyName="Text" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <%-- search by seller---------------------------------- --%>
    <asp:SqlDataSource ID="seller" runat="server" ConnectionString="<%$ ConnectionStrings:TextbookChangedPlatformConnectionString %>" 
        SelectCommand="SELECT [Transaction].transID, [Transaction].sellerID, [Transaction].productID, [Transaction].price, TransStatus.description AS status, [Transaction].buyerID 
                        FROM [TransStatus] , [Transaction]
                        WHERE  ([Transaction].[sellerID] = @sellerID) AND [Transaction].statusID = TransStatus.id">
        <SelectParameters>
            <asp:ControlParameter ControlID="keyTB" Name="sellerID" PropertyName="Text" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <%-- search by product----------------------------------- --%>
    <asp:SqlDataSource ID="product" runat="server" ConnectionString="<%$ ConnectionStrings:TextbookChangedPlatformConnectionString %>" 
        SelectCommand="SELECT [Transaction].transID, [Transaction].sellerID, [Transaction].productID, [Transaction].price, TransStatus.description AS status, [Transaction].buyerID 
                        FROM [TransStatus] , [Transaction]
                        WHERE ([Transaction].[productID] = @productID) AND [Transaction].statusID = TransStatus.id">
        <SelectParameters>
            <asp:ControlParameter ControlID="keyTB" Name="productID" PropertyName="Text" Type="Int64" />
        </SelectParameters>
    </asp:SqlDataSource>
    <%-- search by status------------------------------------ --%>
    <asp:SqlDataSource ID="status" runat="server" ConnectionString="<%$ ConnectionStrings:TextbookChangedPlatformConnectionString %>" 
        SelectCommand="SELECT [Transaction].transID, [Transaction].sellerID, [Transaction].productID, [Transaction].price, TransStatus.description AS status, [Transaction].buyerID 
                        FROM [TransStatus] , [Transaction]
                        WHERE ([TransStatus].description LIKE '%' + @description + '%') AND [Transaction].statusID = TransStatus.id">
        <SelectParameters>
            <asp:ControlParameter ControlID="keyTB" Name="description" PropertyName="Text" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <%-- search by buyer------------------------------------- --%>
    <asp:SqlDataSource ID="buyer" runat="server" ConnectionString="<%$ ConnectionStrings:TextbookChangedPlatformConnectionString %>" 
        SelectCommand="SELECT [Transaction].transID, [Transaction].sellerID, [Transaction].productID, [Transaction].price, TransStatus.description AS status, [Transaction].buyerID 
                        FROM [TransStatus] , [Transaction]
                        WHERE ([Transaction].[buyerID] = @buyerID) AND [Transaction].statusID = TransStatus.id">
        <SelectParameters>
            <asp:ControlParameter ControlID="keyTB" Name="buyerID" PropertyName="Text" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

</asp:Content>
