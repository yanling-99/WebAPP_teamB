<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="WebApplication_B.Product.Search" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <%--<select id="Options" runat="server" name="cols" style="font-size:18px; font-family:'Times New Roman'">
        <option value="">請選擇搜尋方式</option>
        <option value="id">ID</option>
        <option value="title">title</option>
        <option value="countryID">countryID</option>
        <option value="condition">condition</option>
    </select>--%>

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
        <asp:Button ID="Button1" runat="server" Text="Search" Width="100px" Height="35px" Font-Size="Large" OnClick="Button1_Click" />
    </p>
    
    <br /><br />
    <asp:Label ID="SearchResult" runat="server" Text="Search Result :" Font-Size="X-Large" Font-Bold="True" Visible="False"></asp:Label>
    <br />

    <div style="text-align:center; font-size:18px">
        <asp:GridView ID="GridView1" runat="server" Width="1200px">
            <EmptyDataTemplate>
                No Result.
            </EmptyDataTemplate>
            <HeaderStyle BackColor="#8B5A2B" ForeColor="#FFFAFA" VerticalAlign="Middle" />
        </asp:GridView>
    </div>
    
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TextbookChangedPlatformConnectionString %>" 
        SelectCommand="SELECT Product.id AS bookID, Product.title, PaymentType.typename AS payment, Product.condition, Region.location AS city, Product.price 
                       FROM Product, PaymentType, Region 
                       WHERE Product.title LIKE '%' + @title + '%'  AND Product.paymentID = PaymentType.id AND Region.id=Product.countryID">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBox1" PropertyName="Text" Name="title" Type="String"></asp:ControlParameter>
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:TextbookChangedPlatformConnectionString %>" 
        SelectCommand="SELECT Product.id AS bookID, Product.title, PaymentType.typename AS payment, Product.condition, Region.location AS city, Product.price 
                       FROM Product, PaymentType, Region
                       WHERE Product.id = @id AND Product.paymentID = PaymentType.id AND Region.id=Product.countryID">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBox1" PropertyName="Text" Name="id" Type="Int64"></asp:ControlParameter>
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:TextbookChangedPlatformConnectionString %>" 
        SelectCommand="SELECT Product.id AS bookID, Product.title, PaymentType.typename AS payment, Product.condition, Region.location AS city, Product.price 
                       FROM Product, PaymentType, Region
                       WHERE Region.[location] LIKE '%' + @location + '%' AND Product.paymentID = PaymentType.id AND Region.id=Product.countryID">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBox1" PropertyName="Text" Name="location" Type="String"></asp:ControlParameter>
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:TextbookChangedPlatformConnectionString %>"
        SelectCommand="SELECT Product.id AS bookID, Product.title, PaymentType.typename AS payment, Product.condition, Region.location AS city, Product.price 
                       FROM Product, PaymentType, Region
                       WHERE Product.condition = @condition AND Product.paymentID = PaymentType.id AND Region.id=Product.countryID">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBox1" PropertyName="Text" Name="condition" Type="Int32"></asp:ControlParameter>
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
