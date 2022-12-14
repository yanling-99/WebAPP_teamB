<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="transEdit.aspx.cs" Inherits="WebApplication_B.Trans.Edit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <br /><br /><br />

    <br /><br />
    <%-- 搜尋transID --%>
    <h style="font-size: 20px; font-weight: bold">Enter transID to edit the Transaction</h><br />
    <asp:TextBox ID="TextBox1" runat="server" Font-Size="Larger" Width="200px" Height="30px"></asp:TextBox>
    &emsp;<asp:Button ID="Button2" runat="server" Text="Search" Width="100px" Height="35px" Font-Size="Large" BorderColor="Transparent"/>
    <br /><br />

    <%-- 可編輯、新增FormView1 --%>
    <div style="font-size:18px">
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="transID" DataSourceID="add_edit" Width="489px">
            <EditItemTemplate>
                transID:
                <asp:Label ID="transIDLabel1" runat="server" Text='<%# Eval("transID") %>' />
                <br />
                sellerID:
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="user" DataTextField="id" DataValueField="id" SelectedValue='<%# Bind("sellerID") %>' Width="200px">
                </asp:DropDownList>
                <asp:SqlDataSource ID="user" runat="server" ConnectionString="<%$ ConnectionStrings:TextbookChangedPlatformConnectionString %>" 
                    SelectCommand="SELECT [id] FROM [Users]"></asp:SqlDataSource>
                <br />
                productID:
                <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="product" DataTextField="id" DataValueField="id" SelectedValue='<%# Bind("productID") %>' Width="200px">
                </asp:DropDownList>
                <asp:SqlDataSource ID="product" runat="server" ConnectionString="<%$ ConnectionStrings:TextbookChangedPlatformConnectionString %>" 
                    SelectCommand="SELECT id FROM [Product]"></asp:SqlDataSource>
                <br />
                price:
                <asp:TextBox ID="priceTextBox" runat="server" Text='<%# Bind("price") %>' />
                <br />
                statusID:
                <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="status" DataTextField="description" DataValueField="id" SelectedValue='<%# Bind("statusID") %>' Width="200px">
                </asp:DropDownList>
                <asp:SqlDataSource ID="status" runat="server" ConnectionString="<%$ ConnectionStrings:TextbookChangedPlatformConnectionString %>" 
                    SelectCommand="SELECT [id], [description] FROM [TransStatus]"></asp:SqlDataSource>
                <br />
                buyerID:
                <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="user2" DataTextField="id" DataValueField="id" SelectedValue='<%# Bind("buyerID") %>' Width="200px">
                </asp:DropDownList>
                <asp:SqlDataSource ID="user2" runat="server" ConnectionString="<%$ ConnectionStrings:TextbookChangedPlatformConnectionString %>" 
                    SelectCommand="SELECT [id] FROM [Users]"></asp:SqlDataSource>
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update"  />
                &nbsp;&nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <EmptyDataTemplate>
                No result.<br />
                <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New Trans" />
            </EmptyDataTemplate>
            <InsertItemTemplate>
                sellerID:
                <asp:DropDownList ID="DropDownList5" runat="server" DataSourceID="user" DataTextField="id" DataValueField="id" SelectedValue='<%# Bind("sellerID") %>' Width="200px">
                </asp:DropDownList>
                <asp:SqlDataSource ID="user" runat="server" ConnectionString="<%$ ConnectionStrings:TextbookChangedPlatformConnectionString %>" 
                    SelectCommand="SELECT [id] FROM [Users]"></asp:SqlDataSource>
                <br />
                productID:
                <asp:DropDownList ID="DropDownList6" runat="server" DataSourceID="product" DataTextField="id" DataValueField="id" SelectedValue='<%# Bind("productID") %>' Width="200px">
                </asp:DropDownList>
                <asp:SqlDataSource ID="product" runat="server" ConnectionString="<%$ ConnectionStrings:TextbookChangedPlatformConnectionString %>" 
                    SelectCommand="SELECT [id] FROM [Product] "></asp:SqlDataSource>
                <br />
                price:
                <asp:TextBox ID="priceTextBox" runat="server" Text='<%# Bind("price") %>' />
                <br />
                statusID:
                <asp:DropDownList ID="DropDownList7" runat="server" DataSourceID="status" DataTextField="description" DataValueField="id" SelectedValue='<%# Bind("statusID") %>' Width="200px">
                </asp:DropDownList>
                <asp:SqlDataSource ID="status" runat="server" ConnectionString="<%$ ConnectionStrings:TextbookChangedPlatformConnectionString %>" 
                    SelectCommand="SELECT [id], [description] FROM [TransStatus]"></asp:SqlDataSource>
                <br />
                buyerID:
                <asp:DropDownList ID="DropDownList8" runat="server" DataSourceID="user2" DataTextField="id" DataValueField="id" SelectedValue='<%# Bind("buyerID") %>' Width="200px">
                </asp:DropDownList>
                <asp:SqlDataSource ID="user2" runat="server" ConnectionString="<%$ ConnectionStrings:TextbookChangedPlatformConnectionString %>" 
                    SelectCommand="SELECT [id] FROM [Users]"></asp:SqlDataSource>
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                &nbsp;&nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                transID:
                <asp:Label ID="transIDLabel" runat="server" Text='<%# Eval("transID") %>' />
                <br />
                sellerID:
                <asp:Label ID="sellerIDLabel" runat="server" Text='<%# Bind("sellerID") %>' />
                <br />
                productID:
                <asp:Label ID="productIDLabel" runat="server" Text='<%# Bind("productID") %>' />
                <br />
                price:
                <asp:Label ID="priceLabel" runat="server" Text='<%# Bind("price") %>' />
                <br />
                statusID:
                <asp:Label ID="statusIDLabel" runat="server" Text='<%# Bind("statusID") %>' />
                <br />
                buyerID:
                <asp:Label ID="buyerIDLabel" runat="server" Text='<%# Bind("buyerID") %>' />
                &emsp;&emsp;<asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                &nbsp;&nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
               &emsp;&emsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
            </ItemTemplate>
        </asp:FormView>
    </div>
    <asp:SqlDataSource ID="add_edit" runat="server" ConnectionString="<%$ ConnectionStrings:TextbookChangedPlatformConnectionString %>" 
        SelectCommand="SELECT [transID], [sellerID], [productID], [price], [statusID], [buyerID] FROM [Transaction] WHERE ([transID] = @transID)" 
        DeleteCommand="DELETE FROM [Transaction] WHERE [transID] = @transID" 
        InsertCommand="INSERT INTO [Transaction] ([sellerID], [productID], [price], [statusID], [buyerID]) VALUES (@sellerID, @productID, @price, @statusID, @buyerID)"
        UpdateCommand="UPDATE [Transaction] SET [sellerID] = @sellerID, [productID] = @productID, [price] = @price, [statusID] = @statusID, [buyerID] = @buyerID WHERE [transID] = @transID">
        <DeleteParameters>
            <asp:Parameter Name="transID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="sellerID" Type="Int32" />
            <asp:Parameter Name="productID" Type="Int64" />
            <asp:Parameter Name="price" Type="Double" />
            <asp:Parameter Name="statusID" Type="Int32" />
            <asp:Parameter Name="buyerID" Type="Int32" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBox1" Name="transID" PropertyName="Text" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="sellerID" Type="Int32" />
            <asp:Parameter Name="productID" Type="Int64" />
            <asp:Parameter Name="price" Type="Double" />
            <asp:Parameter Name="statusID" Type="Int32" />
            <asp:Parameter Name="buyerID" Type="Int32" />
            <asp:Parameter Name="transID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <hr / style="border-top-color:#B5B5B5">
    <%-- 表格標題 --%>
    <h style="font-size: 20px; font-weight: bold">Choose a option and 
        press "refresh" to check if you have added or updated datas.</h><br />
    <%-- RadioButtonList --%>
    <asp:RadioButtonList ID="RadioButtonList1" runat="server" Font-Size="Large"  Width="209px">
        <asp:ListItem Value="0">&nbsp;&nbsp;close</asp:ListItem>
        <asp:ListItem Value="1">&nbsp;&nbsp;open</asp:ListItem>
    </asp:RadioButtonList>
    <%-- 按鈕 --%>
    <br />
    <asp:Button ID="Button1" runat="server" Text="refresh" BorderColor="Transparent" Width="100px" Height="35px" Font-Size="Large" OnClick="Button1_Click"/>
    &emsp; <asp:Button ID="Button3" runat="server" Text="Close" BorderColor="Transparent" Width="100px" Height="35px" Font-Size="Large" OnClick="Button3_Click"/>
    <br /><br />
    <%-- 表格 --%>
    <div style="text-align:center; font-size:18px">
        <asp:GridView ID="GridView1" runat="server" DataSourceID="selled" Width="900px" AutoGenerateColumns="False" DataKeyNames="transID">
            <Columns>
                <asp:BoundField DataField="transID" HeaderText="transID" InsertVisible="False" ReadOnly="True" SortExpression="transID" />
                <asp:BoundField DataField="sellerID" HeaderText="sellerID" SortExpression="sellerID" />
                <asp:BoundField DataField="productID" HeaderText="productID" SortExpression="productID" />
                <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
                <asp:BoundField DataField="buyerID" HeaderText="buyerID" SortExpression="buyerID" />
            </Columns>
            <EmptyDataTemplate>
                No Result.
            </EmptyDataTemplate>
            <HeaderStyle BackColor="#8B5A2B" ForeColor="#FFFAFA" VerticalAlign="Middle" />
        </asp:GridView>
    </div>

    <asp:SqlDataSource ID="selled" runat="server" ConnectionString="<%$ ConnectionStrings:TextbookChangedPlatformConnectionString %>" SelectCommand="SELECT [transID], [sellerID], [productID], [price], [buyerID] FROM [Transaction] WHERE ([statusID] = @statusID)" DeleteCommand="DELETE FROM [Transaction] WHERE [transID] = @transID" InsertCommand="INSERT INTO [Transaction] ([sellerID], [productID], [price], [buyerID]) VALUES (@sellerID, @productID, @price, @buyerID)" UpdateCommand="UPDATE [Transaction] SET [sellerID] = @sellerID, [productID] = @productID, [price] = @price, [buyerID] = @buyerID WHERE [transID] = @transID">
        <DeleteParameters>
            <asp:Parameter Name="transID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="sellerID" Type="Int32" />
            <asp:Parameter Name="productID" Type="Int64" />
            <asp:Parameter Name="price" Type="Double" />
            <asp:Parameter Name="buyerID" Type="Int32" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="RadioButtonList1" Name="statusID" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="sellerID" Type="Int32" />
            <asp:Parameter Name="productID" Type="Int64" />
            <asp:Parameter Name="price" Type="Double" />
            <asp:Parameter Name="buyerID" Type="Int32" />
            <asp:Parameter Name="transID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    </asp:Content>
