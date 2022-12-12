<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Edit.aspx.cs" Inherits="WebApplication_B.Product.Edit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
        <%-- 下拉選單 product title--%>
        &nbsp;<asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="title" DataValueField="id"  Height="30px" Font-Size="18px"></asp:DropDownList>
              <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:TextbookChangedPlatformConnectionString %>" SelectCommand="SELECT [id], [title] FROM [Product]"></asp:SqlDataSource>

        <br /><br />
        <%-- product表格 --%>
    <div style=" font-size:18px">
        <asp:FormView ID="FormView2" runat="server" DataKeyNames="id" DataSourceID="productDetail" Width="858px">
            <EditItemTemplate>
                id:
                <asp:Label ID="idLabel1" runat="server" Text='<%# Eval("id") %>' />
                <br />
                title:
                <asp:TextBox ID="titleTextBox" runat="server" Text='<%# Bind("title") %>' />
                <br />
                paymentID:
                <asp:DropDownList ID="DropDownList5" runat="server" DataSourceID="payment" DataTextField="typename" DataValueField="id" SelectedValue='<%# Bind("paymentID") %>'>
                </asp:DropDownList>
                <asp:SqlDataSource ID="payment" runat="server" ConnectionString="<%$ ConnectionStrings:TextbookChangedPlatformConnectionString %>" SelectCommand="SELECT [id], [typename] FROM [PaymentType]"></asp:SqlDataSource>
                <br />
                countryID:
                <asp:DropDownList ID="DropDownList6" runat="server" DataSourceID="location" DataTextField="location" DataValueField="id" SelectedValue='<%# Bind("countryID") %>'>
                </asp:DropDownList>
                <asp:SqlDataSource ID="location" runat="server" ConnectionString="<%$ ConnectionStrings:TextbookChangedPlatformConnectionString %>" SelectCommand="SELECT [id], [location] FROM [Region]"></asp:SqlDataSource>
                <br />
                condition:
                <asp:DropDownList ID="DropDownList7" runat="server" DataSourceID="condi" DataTextField="condi" DataValueField="id" SelectedValue='<%# Bind("condition") %>'>
                </asp:DropDownList>
                <asp:SqlDataSource ID="condi" runat="server" ConnectionString="<%$ ConnectionStrings:TextbookChangedPlatformConnectionString %>" SelectCommand="SELECT [id], [condi] FROM [Condi]"></asp:SqlDataSource>
                <br />
                price:
                <asp:TextBox ID="priceTextBox" runat="server" Text='<%# Bind("price") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="更新" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消" />
            </EditItemTemplate>
            <EmptyDataTemplate>
                This product has been deleted !!
            </EmptyDataTemplate>
            <InsertItemTemplate>
                title:
                <asp:TextBox ID="titleTextBox" runat="server" Text='<%# Bind("title") %>' />
                <br />
                paymentID:
                <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="payment" DataTextField="typename" DataValueField="id" SelectedValue='<%# Bind("paymentID") %>'>
                </asp:DropDownList>
                <asp:SqlDataSource ID="payment" runat="server" ConnectionString="<%$ ConnectionStrings:TextbookChangedPlatformConnectionString %>" SelectCommand="SELECT [id], [typename] FROM [PaymentType]"></asp:SqlDataSource>
                <br />
                countryID:
                <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="location" DataTextField="location" DataValueField="id" SelectedValue='<%# Bind("countryID") %>'>
                </asp:DropDownList>
                <asp:SqlDataSource ID="location" runat="server" ConnectionString="<%$ ConnectionStrings:TextbookChangedPlatformConnectionString %>" SelectCommand="SELECT [id], [location] FROM [Region]"></asp:SqlDataSource>
                <br />
                condition:
                <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="condi" DataTextField="condi" DataValueField="id" SelectedValue='<%# Bind("condition") %>'>
                </asp:DropDownList>
                <asp:SqlDataSource ID="condi" runat="server" ConnectionString="<%$ ConnectionStrings:TextbookChangedPlatformConnectionString %>" SelectCommand="SELECT [id], [condi] FROM [Condi]"></asp:SqlDataSource>
                <br />
                price:
                <asp:TextBox ID="priceTextBox" runat="server" Text='<%# Bind("price") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="插入" />
&nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消" />
            </InsertItemTemplate>
            <ItemTemplate>
                id:
                <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                <br />
                title:
                <asp:Label ID="titleLabel" runat="server" Text='<%# Bind("title") %>' />
                <br />
                paymentID:
                <asp:Label ID="paymentIDLabel" runat="server" Text='<%# Bind("paymentID") %>' />
                <br />
                countryID:
                <asp:Label ID="countryIDLabel" runat="server" Text='<%# Bind("countryID") %>' />
                <br />
                condition:
                <asp:Label ID="conditionLabel" runat="server" Text='<%# Bind("condition") %>' />
                <br />
                price:
                <asp:Label ID="priceLabel" runat="server" Text='<%# Bind("price") %>' />
                <br />
                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="編輯" />
                &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="刪除" />
                &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="新增" />
            </ItemTemplate>
        </asp:FormView>
        <br />
        <asp:SqlDataSource ID="productDetail" runat="server" ConnectionString="<%$ ConnectionStrings:TextbookChangedPlatformConnectionString %>" DeleteCommand="DELETE FROM [Product] WHERE [id] = @id" InsertCommand="INSERT INTO [Product] ([title], [paymentID], [countryID], [condition], [price]) VALUES (@title, @paymentID, @countryID, @condition, @price)" SelectCommand="SELECT [id], [title], [paymentID], [countryID], [condition], [price] FROM [Product] WHERE ([id] = @id)" UpdateCommand="UPDATE [Product] SET [title] = @title, [paymentID] = @paymentID, [countryID] = @countryID, [condition] = @condition, [price] = @price WHERE [id] = @id">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int64" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="title" Type="String" />
                <asp:Parameter Name="paymentID" Type="Int32" />
                <asp:Parameter Name="countryID" Type="Int32" />
                <asp:Parameter Name="condition" Type="Int32" />
                <asp:Parameter Name="price" Type="Double" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="id" PropertyName="SelectedValue" Type="Int64" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="title" Type="String" />
                <asp:Parameter Name="paymentID" Type="Int32" />
                <asp:Parameter Name="countryID" Type="Int32" />
                <asp:Parameter Name="condition" Type="Int32" />
                <asp:Parameter Name="price" Type="Double" />
                <asp:Parameter Name="id" Type="Int64" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
        <br />
    </div>

    </asp:Content>
