<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="userEdit.aspx.cs" Inherits="WebApplication_B.User.userEdit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br /><br /><br />
        <%-- 尋找 User--%>

    <h style="font-size: 18px; font-weight: bold">Enter your email</h><br />
    <asp:TextBox ID="FirstnameTB" runat="server" Font-Size="Larger" Width="250px" Height="30px"></asp:TextBox>
    <asp:Button ID="FirstnameBtn" runat="server"  Text="Search" Width="100px" Height="35px" Font-Size="Large"/>

    <br /><br /><br />
    
    <div style=" font-size:18px">
        <asp:FormView ID="userFrom" runat="server" DataKeyNames="id" DataSourceID="user" Width="642px" >
            <EditItemTemplate>
                id:
                <asp:Label ID="idLabel1" runat="server" Text='<%# Eval("id") %>' />
                <br />
                firstName:
                <asp:TextBox ID="firstNameTextBox" runat="server" Text='<%# Bind("firstName") %>' />
                <br />
                lastName:
                <asp:TextBox ID="lastNameTextBox" runat="server" Text='<%# Bind("lastName") %>' />
                <br />
                membership:
                <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="member" DataTextField="description" DataValueField="id" SelectedValue='<%# Bind("membership") %>'>
                </asp:DropDownList>
                <asp:SqlDataSource ID="member" runat="server" ConnectionString="<%$ ConnectionStrings:TextbookChangedPlatformConnectionString %>" SelectCommand="SELECT [id], [description] FROM [isMembership]"></asp:SqlDataSource>
                <br />
                email:
                <asp:TextBox ID="emailTextBox" runat="server" Text='<%# Bind("email") %>' />
                <br /><br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                &nbsp;&nbsp;
                <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <InsertItemTemplate>
                firstName:
                <asp:TextBox ID="firstNameTextBox" runat="server" Text='<%# Bind("firstName") %>' />
                <br />
                lastName:
                <asp:TextBox ID="lastNameTextBox" runat="server" Text='<%# Bind("lastName") %>' />
                <br />
                membership:
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="member" DataTextField="description" DataValueField="id" SelectedValue='<%# Bind("membership") %>'>
                </asp:DropDownList>
                <asp:SqlDataSource ID="member" runat="server" ConnectionString="<%$ ConnectionStrings:TextbookChangedPlatformConnectionString %>" SelectCommand="SELECT [id], [description] FROM [isMembership]"></asp:SqlDataSource>
                <br />
                email:
                <asp:TextBox ID="emailTextBox" runat="server" Text='<%# Bind("email") %>' />
                <br /><br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                &nbsp;&nbsp;
                <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                id:
                <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                <br />
                firstName:
                <asp:Label ID="firstNameLabel" runat="server" Text='<%# Bind("firstName") %>' />
                <br />
                lastName:
                <asp:Label ID="lastNameLabel" runat="server" Text='<%# Bind("lastName") %>' />
                <br />
                membership:
                <asp:Label ID="membershipLabel" runat="server" Text='<%# Bind("membership") %>' />
                <br />
                email:
                <asp:Label ID="emailLabel" runat="server" Text='<%# Bind("email") %>' />
                <br /><br />
                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                &nbsp;&nbsp;
                <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                &emsp;&emsp;&emsp;&emsp;&emsp;
                <%--<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />--%>
            </ItemTemplate>
        </asp:FormView>
    </div>


    <br /><br /><br />

    <div style="text-align:center; font-size:18px">
        <asp:GridView ID="GridView1" runat="server" Width="1200px" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="user">
            <Columns>
                <asp:CommandField DeleteText="Delete" HeaderText="command" ShowDeleteButton="True" />
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="firstName" HeaderText="firstName" SortExpression="firstName" />
                <asp:BoundField DataField="lastName" HeaderText="lastName" SortExpression="lastName" />
                <asp:BoundField DataField="membership" HeaderText="membership" SortExpression="membership" />
                <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
            </Columns>
            <EmptyDataTemplate>
                Please
                <h style="font-size: 18px; font-weight: bold">
                    enter&nbsp; your email</h>
            </EmptyDataTemplate>
            <HeaderStyle BackColor="#8B5A2B" ForeColor="#FFFAFA" VerticalAlign="Middle" />
        </asp:GridView>

        <asp:SqlDataSource ID="user" runat="server" ConnectionString="<%$ ConnectionStrings:TextbookChangedPlatformConnectionString %>" DeleteCommand="DELETE FROM [Users] WHERE [id] = @id" InsertCommand="INSERT INTO [Users] ([firstName], [lastName], [membership], [email]) VALUES (@firstName, @lastName, @membership, @email)" SelectCommand="SELECT [id], [firstName], [lastName], [membership], [email] FROM [Users] WHERE (email LIKE '%' + @email + '%')" UpdateCommand="UPDATE [Users] SET [firstName] = @firstName, [lastName] = @lastName, [membership] = @membership, [email] = @email WHERE [id] = @id">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="firstName" Type="String" />
                <asp:Parameter Name="lastName" Type="String" />
                <asp:Parameter Name="membership" Type="Int32" />
                <asp:Parameter Name="email" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="FirstnameTB" Name="email" PropertyName="Text" DefaultValue="example@gmail.com" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="firstName" Type="String" />
                <asp:Parameter Name="lastName" Type="String" />
                <asp:Parameter Name="membership" Type="Int32" />
                <asp:Parameter Name="email" Type="String" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
        
</asp:Content>
