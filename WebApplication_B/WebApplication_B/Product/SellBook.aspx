<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SellBook.aspx.cs" Inherits="WebApplication_B.Product.Edit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br /><br />
    <asp:Label ID="titleTxt" runat="server" Font-Size="XX-Large" Font-Bold="true" Text="Sell a book/books"></asp:Label><br /><br />

    <br /><br />
    <%-- 選擇user --%>
    <asp:Label ID="sellertxt" runat="server" Font-Size="X-Large" Text="Please select a seller to sell a book/books."></asp:Label><br /><br />
    <asp:DropDownList ID="sellerDDL" runat="server"  AutoPostBack="True" Height="30px" Font-Size="18px" DataSourceID="seller" DataTextField="email" DataValueField="id"></asp:DropDownList>
    <asp:SqlDataSource ID="seller" runat="server" ConnectionString="<%$ ConnectionStrings:TextbookChangedPlatformConnectionString %>" SelectCommand="SELECT [id], [email] FROM [Users]"></asp:SqlDataSource>
    

    <br /><br />

    <%-- 可新增書(表單) --%>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <div style=" font-size:18px">
        <asp:Panel ID="Panel1" runat="server" BorderStyle="Double" Width="1000px" Visible="false">
            <br />
            &nbsp;&nbsp;<asp:Label ID="transIdTxt" runat="server" Text="TransID : "></asp:Label>
            &nbsp;&nbsp;<asp:Label ID="transIdTxt2" runat="server" Text="transIDTXT"></asp:Label><br /><br />
            &nbsp;&nbsp;<asp:Label ID="bookIdTxt" runat="server" Text="BookID : "></asp:Label>
            &nbsp;&nbsp;<asp:Label ID="bookIdTxt2" runat="server" Text="bookIDTXT"></asp:Label><br /><br />
            &nbsp;&nbsp;<asp:Label ID="bookTitleTxt" runat="server" Text="Book Title : "></asp:Label>
            &nbsp;&nbsp;<asp:TextBox ID="bookTitleTB" runat="server" Height="30px" Width="800px"></asp:TextBox><br /><br />
            &nbsp;&nbsp;<asp:Label ID="paymentTxt" runat="server" Text="Payment : "></asp:Label>
            &nbsp;&nbsp;<asp:DropDownList ID="paymentDDL" runat="server">
                <asp:ListItem Value="0">Select ONE...</asp:ListItem>
                <asp:ListItem Value="1">MOCC</asp:ListItem>
                <asp:ListItem Value="2">CashOnPickup</asp:ListItem>
                <asp:ListItem Value="3">PayPal</asp:ListItem>
            </asp:DropDownList><br /><br />
            &nbsp;&nbsp;<asp:Label ID="locationTxt" runat="server" Text="Location : "></asp:Label>
            &nbsp;&nbsp;<asp:DropDownList ID="locationDDL" runat="server" DataSourceID="location" DataTextField="location" DataValueField="id">
                <asp:ListItem Value="0">Select ONE...</asp:ListItem>
            </asp:DropDownList>
            <asp:SqlDataSource ID="location" runat="server" ConnectionString="<%$ ConnectionStrings:TextbookChangedPlatformConnectionString %>" SelectCommand="SELECT [id], [location] FROM [Region]"></asp:SqlDataSource>
            <br /><br />
            &nbsp;&nbsp;<asp:Label ID="priceTxt" runat="server" Text="Price : "></asp:Label>
            &nbsp;&nbsp;<asp:TextBox ID="priceTB" runat="server" Height="30px" Width="100px"></asp:TextBox><br /><br />
            &nbsp;&nbsp;<asp:Label ID="conditionTxt" runat="server" Text="Condition : "></asp:Label>
            &nbsp;&nbsp;<asp:DropDownList ID="conditionDDL" runat="server">
                <asp:ListItem Value="0">Select ONE...</asp:ListItem>
                <asp:ListItem Value="1">10% new</asp:ListItem>
                <asp:ListItem Value="2">30% new</asp:ListItem>
                <asp:ListItem Value="3">50% new</asp:ListItem>
                <asp:ListItem Value="4">70% new</asp:ListItem>
                <asp:ListItem Value="5">90% new</asp:ListItem>
            </asp:DropDownList><br />
            <br />
        </asp:Panel>
    </div>
    <br />

    <%-- 確認、取消 按鈕 --%>
    <asp:Button ID="ConfirmBtn" runat="server" Text="Confirm" OnClick="ConfirmBtn_Click" BorderColor="Transparent" Visible="false"/>
    &nbsp;&nbsp;&nbsp;
    <asp:Button ID="CancelBtn1" runat="server" Text="Cancel" OnClick="CancelBtn1_Click" BorderColor="Transparent" Visible="false"/>
    <br /><br />

    <%-- 可編輯、刪除seller賣的書(清單) --%>
    <div style="text-align:center; font-size:18px">
        <asp:GridView ID="GV_trans_product" runat="server" AutoGenerateColumns="False" DataSourceID="selledBook" Width="1280px">
            <Columns>
                <asp:TemplateField ShowHeader="False" ItemStyle-Width="70px" Visible="false"><%--0--%>
                    <ItemTemplate>
                        <asp:LinkButton ID="deleteLB" runat="server" CausesValidation="false" CommandName="" Text="Delete" OnClick="deleteLB_Click"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField ShowHeader="False" ItemStyle-Width="50px" Visible="false"><%--1--%>
                    <ItemTemplate>
                        <asp:LinkButton ID="editLB" runat="server" CausesValidation="false" CommandName="" Text="Edit" OnClick="editLB_Click"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="transID" HeaderText="transID" InsertVisible="False" ReadOnly="True" SortExpression="transID" ItemStyle-Height="60px">
<ItemStyle Height="60px"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="sellerID" HeaderText="sellerID" SortExpression="sellerID" Visible="false"/>
                <asp:BoundField DataField="id" HeaderText="bookID" SortExpression="id" InsertVisible="False" ReadOnly="True" />
                <asp:BoundField DataField="product Name" HeaderText="book title" SortExpression="product Name" />
                <asp:BoundField DataField="payment" HeaderText="payment" SortExpression="payment" />
                <asp:BoundField DataField="location" HeaderText="location" SortExpression="location" />
                <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
                <asp:BoundField DataField="condition" HeaderText="condition" SortExpression="condition" />
            </Columns>
            <EmptyDataTemplate>
                You haven&#39;t sold any book.
            </EmptyDataTemplate>
            <HeaderStyle ForeColor="#FFEFDB" BackColor="#8B5A2B" VerticalAlign="Middle" />
        </asp:GridView>

        <asp:SqlDataSource ID="selledBook" runat="server" ConnectionString="<%$ ConnectionStrings:TextbookChangedPlatformConnectionString %>" 
            SelectCommand="SELECT [transID], [sellerID], Product.id, Product.title AS [product Name], PaymentType.typename AS payment
                            ,Region.location , Product.price, Product.condition FROM [Transaction]
                            LEFT JOIN Product ON Product.id = [Transaction].productID 
                            LEFT JOIN PaymentType ON PaymentType.id = Product.paymentID
                            LEFT JOIN Region ON Region.id = Product.countryID
                            WHERE ([sellerID] = @sellerID)
                            AND [Transaction].statusID = 1;">
            <SelectParameters>
                <asp:ControlParameter ControlID="sellerDDL" Name="sellerID" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    <br />

    <%-- 編輯、刪除、取消 按鈕 --%>
    <asp:Button ID="EditBtn" runat="server" Text="Edit List" OnClick="EditBtn_Click" BorderColor="Transparent"/>
<%--    <asp:Button ID="DeleteBtn" runat="server" Text="Delete Selected Product(s)" OnClick="DeleteBtn_Click"  BorderColor="Transparent" Visible="false"/>--%>
    <%--&nbsp;--%>
        <%-- 新增書按鈕 --%>
    &nbsp;&nbsp;
    <asp:Button ID="AddBookBtn" runat="server" Text="Add a book for sell" OnClick="AddBookBtn_Click" BorderColor="Transparent"/>
    <asp:Button ID="confirm2Btn" runat="server" Text="Confirm" OnClick="ConfirmBtn2_Click" BorderColor="Transparent" Visible="false"/>
    &nbsp;&nbsp;<asp:Button ID="CancelBtn2" runat="server" Text="Cancel" OnClick="CancelBtn2_Click" BorderColor="Transparent" Visible="false"/>
    <br /><br />

</asp:Content>
