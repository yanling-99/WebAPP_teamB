<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Rating.aspx.cs" Inherits="WebApplication_B.Order.Rating" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <br /><br /><br />
        <%-- 尋找 User--%>

    <h style="font-size: 22px; font-weight: bold">Search a user and check his/her ratings.&nbsp; </h>
    <p>
        <br /> UserID:
        &emsp;
        <asp:TextBox ID="TextBoxRating" runat="server" Font-Size="Larger" Width="200px" Height="30px"></asp:TextBox>
        <asp:Button ID="Button_Rating" runat="server" Text="Search" Width="100px" Height="35px" Font-Size="Large" OnClick="Button_Rating_Click"  />
    </p>

    <%--<asp:Label ID="SearchResult" runat="server" Text="Search Result :" Font-Size="X-Large" Font-Bold="True"></asp:Label>--%>
    
    <br />
    <div style="text-align:center; font-size:18px">
        <asp:GridView ID="GridView1" runat="server" Width="1200px" DataSourceID="SqlDataSource_Rat_UserID" AutoGenerateColumns="False" DataKeyNames="raterID,userID">
            <Columns>
                <asp:BoundField DataField="raterID" HeaderText="raterID" ReadOnly="True" SortExpression="raterID" />
                <asp:BoundField DataField="userID" HeaderText="userID" ReadOnly="True" SortExpression="userID" />
                <asp:BoundField DataField="rating" HeaderText="rating" SortExpression="rating" />
                <asp:BoundField DataField="comment" HeaderText="comment" SortExpression="comment" />
            </Columns>
            <EmptyDataTemplate>
                No Result.
            </EmptyDataTemplate>
            <HeaderStyle BackColor="#8B5A2B" ForeColor="#FFFAFA" VerticalAlign="Middle" />
        </asp:GridView>
    </div>


<asp:SqlDataSource ID="SqlDataSource_Rat_UserID" runat="server" ConnectionString="<%$ ConnectionStrings:TextbookChangedPlatformConnectionString %>" 
    SelectCommand="SELECT raterID, userID, rating, comment FROM Ratings WHERE userID LIKE @userID"
    DeleteCommand="DELETE FROM [Ratings] WHERE [userID] = @userID AND [raterID] = @raterID" 
    UpdateCommand="UPDATE [Ratings] SET [rating] = @rating,  [comment] = @comment WHERE [userID] = @userID AND [raterID] = @raterID">
    <DeleteParameters>
        <asp:Parameter Name="UserID" />
        <asp:Parameter Name="raterID" />
    </DeleteParameters>
    <SelectParameters>
        <asp:ControlParameter ControlID="TextBoxRating" Name="userID" PropertyName="Text" />
    </SelectParameters>
    <UpdateParameters>
        <asp:Parameter Name="rating" />
        <asp:Parameter Name="comment" />
        <asp:Parameter Name="userID" />
        <asp:Parameter Name="raterID" />
    </UpdateParameters>
</asp:SqlDataSource>
  

    <br /> <br /> <br /><br /><br />
        <h style="font-size: 22px; font-weight: bold">Search ratings you've rated.&nbsp; </h>
    <p>
        <br /> Please enter yourID:
        &emsp;
        <asp:TextBox ID="TextBoxRating0" runat="server" Font-Size="Larger" Width="200px" Height="30px"></asp:TextBox>
        <asp:Button ID="Button_Rating0" runat="server" Text="Search" Width="100px" Height="35px" Font-Size="Large" OnClick="Button_Rating_Click"  />
    </p>

    <asp:FormView ID="FormView2" runat="server" DataSourceID="RatingForm" DataKeyNames="Check your userID">
        <EditItemTemplate>
            Check yourID:
            <asp:Label ID="Check_your_userIDLabel1" runat="server" Text='<%# Eval("[Check your userID]") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="更新" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消" />
        </EditItemTemplate>
        <EmptyDataTemplate>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="插入" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消" />
        </InsertItemTemplate>
        <ItemTemplate>
            Check your userID:
            <asp:Label ID="Check_your_userIDLabel" runat="server" Text='<%# Eval("[Check your userID]") %>' />
            <br />
        </ItemTemplate>
    </asp:FormView>
        <asp:SqlDataSource ID="RatingForm" runat="server" ConnectionString="<%$ ConnectionStrings:TextbookChangedPlatformConnectionString %>" SelectCommand="SELECT id AS 'Check your userID'
                    FROM Users
                    WHERE id LIKE @id">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBoxRating0" Name="id" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
      


    <br />
    <div style="text-align:center; font-size:18px">
        <asp:GridView ID="GridView2" runat="server" Width="1200px" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" DataKeyNames="raterID,userID">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="raterID" HeaderText="raterID" ReadOnly="True" SortExpression="raterID" />
                <asp:BoundField DataField="userID" HeaderText="userID" ReadOnly="True" SortExpression="userID" />
                <asp:BoundField DataField="rating" HeaderText="rating" SortExpression="rating" />
                <asp:BoundField DataField="comment" HeaderText="comment" SortExpression="comment" />
            </Columns>
            <EmptyDataTemplate>
                No Result.
            </EmptyDataTemplate>
            <HeaderStyle BackColor="#8B5A2B" ForeColor="#FFFAFA" VerticalAlign="Middle" />
        </asp:GridView>
    </div>
    <br />
      

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TextbookChangedPlatformConnectionString %>" DeleteCommand="
DELETE FROM [Ratings] WHERE [userID] = @userID AND [raterID] = @raterID" SelectCommand="SELECT raterID, userID, rating, comment FROM Ratings WHERE raterID LIKE @raterID" UpdateCommand="
UPDATE [Ratings] SET [rating] = @rating,  [comment] = @comment WHERE [userID] = @userID AND [raterID] = @raterID" InsertCommand="INSERT INTO [Ratings] ([userID], [raterID], [rating], [comment]) VALUES (@userID, @raterID, @rating,  @comment );">
        <DeleteParameters>
            <asp:Parameter Name="userID" />
            <asp:Parameter Name="raterID" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="userID" />
            <asp:Parameter Name="raterID" />
            <asp:Parameter Name="rating" />
            <asp:Parameter Name="comment" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBoxRating0" Name="raterID" PropertyName="Text" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="rating" />
            <asp:Parameter Name="comment" />
            <asp:Parameter Name="userID" />
            <asp:Parameter Name="raterID" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <br /><br /><br /><br /><br />
    <h style="font-size: 22px; font-weight: bold">Rate other users.&nbsp; </h>
    <br /><br />

    <asp:FormView ID="FormView3" runat="server" DataKeyNames="yourID,userID" DataSourceID="RatingForm0" Font-Size="Large">
        <EditItemTemplate>
            yourID:
            <asp:Label ID="yourIDLabel1" runat="server" Text='<%# Eval("yourID") %>' />
            <br />
            userID:
            <asp:Label ID="userIDLabel1" runat="server" Text='<%# Eval("userID") %>' />
            <br />
            rating:
            <asp:TextBox ID="ratingTextBox" runat="server" Text='<%# Bind("rating") %>' />
            <br />
            comment:
            <asp:TextBox ID="commentTextBox" runat="server" Text='<%# Bind("comment") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="更新" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消" />
        </EditItemTemplate>
        <EmptyDataTemplate>
            Add a rating!
            <br /><br />
            <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="新增" />
        </EmptyDataTemplate>
        <InsertItemTemplate>
            yourID:
            <asp:TextBox ID="yourIDTextBox" runat="server" Text='<%# Bind("yourID") %>' />
            <br />
            userID:
            <asp:TextBox ID="userIDTextBox" runat="server" Text='<%# Bind("userID") %>' />
            <br />
            rating:
            <asp:TextBox ID="ratingTextBox" runat="server" Text='<%# Bind("rating") %>' />
            <br />
            comment:
            <asp:TextBox ID="commentTextBox" runat="server" Text='<%# Bind("comment") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="插入" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消" />
        </InsertItemTemplate>
        <ItemTemplate>
            yourID:
            <asp:Label ID="yourIDLabel" runat="server" Text='<%# Eval("yourID") %>' />
            <br />
            userID:
            <asp:Label ID="userIDLabel" runat="server" Text='<%# Eval("userID") %>' />
            <br />
            rating:
            <asp:Label ID="ratingLabel" runat="server" Text='<%# Bind("rating") %>' />
            <br />
            comment:
            <asp:Label ID="commentLabel" runat="server" Text='<%# Bind("comment") %>' />
            <br />
            <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="新增" />
        </ItemTemplate>
    </asp:FormView>
      

        <asp:SqlDataSource ID="RatingForm0" runat="server" ConnectionString="<%$ ConnectionStrings:TextbookChangedPlatformConnectionString %>" SelectCommand="SELECT raterID AS 'yourID', userID, rating, comment
                    FROM Ratings
                    WHERE raterID LIKE @raterID" InsertCommand="INSERT INTO [Ratings] ([raterID], [userID],  [rating], [comment]) VALUES (@yourID, @userID,  @rating,  @comment );
">
            <InsertParameters>
                <asp:Parameter Name="yourID" />
                <asp:Parameter Name="userID" />
                <asp:Parameter Name="rating" />
                <asp:Parameter Name="comment" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBoxRating0" Name="raterID" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
      

    <br />
      

</asp:Content>
