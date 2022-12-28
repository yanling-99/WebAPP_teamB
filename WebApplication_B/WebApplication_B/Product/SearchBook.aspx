<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SearchBook.aspx.cs" Inherits="WebApplication_B.Product.Search" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br /><br />
    
    <asp:Label ID="titleTxt" runat="server" Font-Size="XX-Large" Font-Bold="true" Text="Search and Add a book/books to Cart"></asp:Label>
    <br /><br /><br />
 
    <p>
        <h style="font-size: 18px; font-weight: bold">Search by</h>
        &emsp;
        <asp:DropDownList ID="DropDownList1" runat="server" width="200px" Height="30px" Font-Size="18px" >
            <asp:ListItem>please select</asp:ListItem>
            <asp:ListItem>bookID</asp:ListItem>
            <asp:ListItem>title</asp:ListItem>
            <asp:ListItem>location</asp:ListItem>
            <asp:ListItem>condition</asp:ListItem>
        </asp:DropDownList>
        <br /> <br />

        <h style="font-size: 18px; font-weight: bold">keyword</h>
        &emsp;
        <asp:TextBox ID="TextBox1" runat="server" Font-Size="Larger" Width="200px" Height="30px"></asp:TextBox>
        &nbsp;
        <asp:Button ID="Button1" runat="server" Text="Search" Width="100px" Height="35px" Font-Size="Large" OnClick="Button1_Click" BorderColor="Transparent"/>
        <br /><br />
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Product/ShoppingList.aspx" Width="200px" Height="35px" Font-Size="Large" Font-Bold="true" >Review Shopping cart >></asp:HyperLink>
    </p>
    <asp:Label ID="conditiontxt" runat="server" Font-Size="Medium" Text="Condition 1-5 means the preservation state of the book. Higher number means better preservation." Visible="False"></asp:Label>
    <br />

    <div style="text-align:center; font-size:18px">
        <asp:GridView ID="GridView1" runat="server" Width="1200px" OnRowDataBound="GridView1_RowDataBound" AutoGenerateColumns="False" >
            <Columns>
                <asp:TemplateField ShowHeader="False" HeaderStyle-BackColor="#8B5A2B">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="false" CommandName="" Text="add to cart" OnClick="buyBtn_Click"></asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle Width="100px" />
                </asp:TemplateField>
                <asp:BoundField DataField="BookID" HeaderText="BookID" SortExpression="BookID" HeaderStyle-BackColor="#8B5A2B"/>
                <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" HeaderStyle-BackColor="#8B5A2B"/>
                <asp:BoundField DataField="Payment" HeaderText="Payment" SortExpression="Payment" HeaderStyle-BackColor="#8B5A2B"/>
                <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" HeaderStyle-BackColor="#8B5A2B"/>
                <asp:BoundField DataField="Country" HeaderText="Country" SortExpression="Country" HeaderStyle-BackColor="#8B5A2B"/>
                <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" HeaderStyle-BackColor="#8B5A2B"/>
                <asp:BoundField DataField="Condition" HeaderText="Condition" SortExpression="Condition" HeaderStyle-BackColor="#8B5A2B"/>
                <asp:BoundField DataField="sellerID" HeaderText="sellerID" SortExpression="sellerID" ItemStyle-BorderColor="Transparent" HeaderStyle-BorderColor="Transparent" HeaderStyle-BackColor="Transparent" ItemStyle-ForeColor="Transparent" ItemStyle-Width="10px"/>
            </Columns>
            <EmptyDataTemplate>
                No Result.
            </EmptyDataTemplate>
            <HeaderStyle ForeColor="#FFEFDB" VerticalAlign="Middle" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:TextbookChangedPlatformConnectionString %>" 
            SelectCommand="SELECT [BookID], [Title], [Payment], [City], [Country], [Price], [Condition], sellerID] FROM [shopping] WHERE ([Price] = @Price)">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox1" Name="Price" PropertyName="Text" Type="Double" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>

    
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TextbookChangedPlatformConnectionString %>" 
        SelectCommand="SELECT Product.id AS bookID, Product.title, PaymentType.typename AS payment, Region.location AS city, Region.country, Product.price, Product.condition, [Transaction].sellerID
                        FROM Product 
                        LEFT JOIN [Transaction] ON Product.id = [Transaction].productID 
                        LEFT JOIN PaymentType ON PaymentType.id = Product.paymentID 
                        LEFT JOIN Region ON Region.id = Product.countryID 
                        WHERE ([Transaction].statusID = 1) 
                        AND (Product.title LIKE '%' + @title + '%')
                        AND Product.id NOT IN (SELECT BookID FROM [shopping])
                        ORDER BY bookID" >
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBox1" PropertyName="Text" Name="title" Type="String"></asp:ControlParameter>
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:TextbookChangedPlatformConnectionString %>" 
        SelectCommand="SELECT Product.id AS bookID, Product.title, PaymentType.typename AS payment, Region.location AS city, Region.country, Product.price, Product.condition , [Transaction].sellerID
                        FROM Product
                        LEFT JOIN [Transaction] ON Product.id = [Transaction].productID
                        LEFT JOIN PaymentType ON PaymentType.id = Product.paymentID
                        LEFT JOIN Region ON Region.id = Product.countryID
                        WHERE Product.id = @id 
                        AND [Transaction].statusID = 1
                        AND Product.id NOT IN (SELECT BookID FROM [shopping])
                        ORDER BY bookID" >
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBox1" PropertyName="Text" Name="id" Type="Int64"></asp:ControlParameter>
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:TextbookChangedPlatformConnectionString %>" 
        SelectCommand="SELECT Product.id AS bookID, Product.title, PaymentType.typename AS payment, Region.location AS city, Region.country, Product.price, Product.condition , [Transaction].sellerID
                        FROM Product
                        LEFT JOIN [Transaction] ON Product.id = [Transaction].productID
                        LEFT JOIN PaymentType ON PaymentType.id = Product.paymentID
                        LEFT JOIN Region ON Region.id = Product.countryID
                        WHERE Region.[location] LIKE '%' + @location + '%' 
                        AND [Transaction].statusID = 1 
                        AND Product.id NOT IN (SELECT BookID FROM [shopping])
                        ORDER BY bookID" >
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBox1" PropertyName="Text" Name="location" Type="String"></asp:ControlParameter>
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:TextbookChangedPlatformConnectionString %>"
        SelectCommand="SELECT Product.id AS bookID, Product.title, PaymentType.typename AS payment, Region.location AS city, Region.country, Product.price, Product.condition , [Transaction].sellerID
                        FROM Product
                        LEFT JOIN [Transaction] ON Product.id = [Transaction].productID
                        LEFT JOIN PaymentType ON PaymentType.id = Product.paymentID
                        LEFT JOIN Region ON Region.id = Product.countryID
                        WHERE Product.condition = @condition 
                        AND [Transaction].statusID = 1 
                        AND Product.id NOT IN (SELECT BookID FROM [shopping])
                        ORDER BY bookID" >
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBox1" PropertyName="Text" Name="condition" Type="Int32"></asp:ControlParameter>
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
