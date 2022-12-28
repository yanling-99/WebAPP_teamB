<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ShoppingList.aspx.cs" Inherits="WebApplication_B.Product.ShoppingList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br /><br />
    <asp:Label ID="titleTxt" runat="server" Font-Size="XX-Large" Font-Bold="true" Text="Shopping Cart and Purchase a book/books"></asp:Label>

    <br /><br /><br />
     <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Product/SearchBook.aspx" Width="300px" Height="35px" Font-Size="Large" Font-Bold="true"><< Go back to the Search Page</asp:HyperLink>
    <br /><br />
    <asp:Label ID="conditiontxt" runat="server" Font-Size="Medium" Text="Condition 1-5 means the preservation state of the book. Higher number means better preservation." Visible="False"></asp:Label>

    <%-- 購買清單 --%>
    <div style="text-align:center; font-size:18px">
        <asp:GridView ID="GridView2" runat="server" Width="1200px" AutoGenerateColumns="False" DataSourceID="shopping">
            <Columns>
                <asp:TemplateField  ItemStyle-Width="50px" Visible="false" HeaderStyle-BackColor="#8B5A2B">
                    <ItemTemplate>
                        <asp:CheckBox ID="CheckBox1" runat="server" />
                    </ItemTemplate>

<HeaderStyle BackColor="#8B5A2B"></HeaderStyle>

<ItemStyle Width="50px"></ItemStyle>
                </asp:TemplateField>
                <asp:BoundField DataField="BookID" HeaderText="BookID" SortExpression="BookID" HeaderStyle-BackColor="#8B5A2B" ItemStyle-Height="60px"> 
<HeaderStyle BackColor="#8B5A2B"></HeaderStyle>

<ItemStyle Height="60px"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" HeaderStyle-BackColor="#8B5A2B">
<HeaderStyle BackColor="#8B5A2B"></HeaderStyle>
                </asp:BoundField>
                <asp:BoundField DataField="Payment" HeaderText="Payment" SortExpression="Payment" HeaderStyle-BackColor="#8B5A2B">
<HeaderStyle BackColor="#8B5A2B"></HeaderStyle>
                </asp:BoundField>
                <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" HeaderStyle-BackColor="#8B5A2B">
<HeaderStyle BackColor="#8B5A2B"></HeaderStyle>
                </asp:BoundField>
                <asp:BoundField DataField="Country" HeaderText="Country" SortExpression="Country" HeaderStyle-BackColor="#8B5A2B">
<HeaderStyle BackColor="#8B5A2B"></HeaderStyle>
                </asp:BoundField>
                <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" HeaderStyle-BackColor="#8B5A2B">
<HeaderStyle BackColor="#8B5A2B"></HeaderStyle>
                </asp:BoundField>
                <asp:BoundField DataField="Condition" HeaderText="Condition" SortExpression="Condition" HeaderStyle-BackColor="#8B5A2B">
<HeaderStyle BackColor="#8B5A2B"></HeaderStyle>
                </asp:BoundField>
                <asp:BoundField DataField="sellerID" HeaderText="sellerID" SortExpression="sellerID" ItemStyle-BorderColor="Transparent" HeaderStyle-BorderColor="Transparent" HeaderStyle-BackColor="Transparent" ItemStyle-ForeColor="Transparent">
<HeaderStyle BackColor="Transparent" BorderColor="Transparent"></HeaderStyle>

<ItemStyle BorderColor="Transparent" ForeColor="Transparent"></ItemStyle>
                </asp:BoundField>
            </Columns>
            <EmptyDataTemplate>
                No Result.
            </EmptyDataTemplate>
            <HeaderStyle ForeColor="#FFEFDB" VerticalAlign="Middle" />
        </asp:GridView>
        <asp:SqlDataSource ID="shopping" runat="server" ConnectionString="<%$ ConnectionStrings:TextbookChangedPlatformConnectionString %>" 
            SelectCommand="SELECT * FROM [shopping] ORDER BY BookID"></asp:SqlDataSource>
    </div>
    <br />
    <%-- 購物車按鈕 --%>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="PriceTxt" runat="server" Text="0" Font-Size="X-Large"></asp:Label><br />
    <asp:Button ID="EditBtn" runat="server" Text="Edit List" OnClick="EditBtn_Click" BorderColor="Transparent"/>
    <asp:Button ID="SelectAllBtn" runat="server" Text="Select All" OnClick="SelectAllBtn_Click" BorderColor="Transparent" Visible="false"/>
    &nbsp;
    <asp:Button ID="NotSelectAllBtn" runat="server" Text="Not Select All" OnClick="NotSelectAllBtn_Click" BorderColor="Transparent" Visible="false"/>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="DeleteBtn" runat="server" Text="Delete Selected Product(s)" OnClick="DeleteBtn_Click"  BorderColor="Transparent" Visible="false"/>
    &nbsp;
    <asp:Button ID="CancelBtn" runat="server" Text="Cancel" OnClick="CancelBtn_Click" BorderColor="Transparent" Visible="false"/>
    <br /><br /><br />
    <%-- 新增買家、購買按鈕 --%>
    <asp:Label ID="buyertxt" runat="server" Font-Size="Larger" Text="Please press 「Purchase」 after selected a buyer."></asp:Label><br /><br />
    <asp:DropDownList ID="buyerDDL" runat="server" DataSourceID="buyer" DataTextField="email" DataValueField="id" Font-Size="Large"></asp:DropDownList>
    <asp:SqlDataSource ID="buyer" runat="server" ConnectionString="<%$ ConnectionStrings:TextbookChangedPlatformConnectionString %>" SelectCommand="SELECT [id], [email] FROM [Users] WHERE id NOT IN (SELECT sellerID FROM shopping);"></asp:SqlDataSource>
     <br /><br />

    <asp:Button ID="buyBtn" runat="server" Text="Purchase" OnClick="buyBtn_Click" BorderColor="Transparent"/>
    <br /><br />

    <%-- 交易清單 --%>
    <div style="text-align:center; font-size:18px">
        <asp:GridView ID="GridView3" runat="server" Width="1200px" AutoGenerateColumns="False" DataSourceID="trans" DataKeyNames="transID" HeaderStyle-BackColor="#8B5A2B" Visible="False">
            <Columns>
                <asp:BoundField DataField="transID" HeaderText="transID" InsertVisible="False" ReadOnly="True" SortExpression="transID" ItemStyle-Height="60px"/>
                <asp:BoundField DataField="sellerID" HeaderText="sellerID" SortExpression="sellerID" />
                <asp:BoundField DataField="Product Name" HeaderText="Product Name" SortExpression="Product Name" />
                <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
                <asp:BoundField DataField="status" HeaderText="status" SortExpression="status" />
            </Columns>
            <HeaderStyle ForeColor="#FFEFDB" VerticalAlign="Middle" />
        </asp:GridView>
        <asp:SqlDataSource ID="trans" runat="server" ConnectionString="<%$ ConnectionStrings:TextbookChangedPlatformConnectionString %>" 
            SelectCommand="SELECT [Transaction].transID,[Transaction].sellerID, Product.title as [Product Name] ,[Transaction].price, TransStatus.[description] AS status
                            FROM  [Transaction]
                            LEFT JOIN Product ON Product.id = [Transaction].productID 
                            LEFT JOIN TransStatus ON [Transaction].statusID = TransStatus.id
                            LEFT JOIN [shopping] ON [Transaction].productID = [shopping].BookID
                            WHERE [Transaction].productID = [shopping].BookID
                            ORDER BY transID;">
        </asp:SqlDataSource>
    </div>

</asp:Content>
