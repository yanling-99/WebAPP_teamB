<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="searchRatings.aspx.cs" Inherits="WebApplication_B.User.Search_Ratings" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br /><br /><br />
        <%-- 尋找 User--%>

    <h style="font-size: 22px; font-weight: bold">Search a user and check his/her ratings.&nbsp; 
    <br />
    <br />
    </h>
    <p>
        <br />
        <h style="font-size: 16px; font-weight: bold">UserID:&nbsp; </h>
        &emsp;
        <asp:TextBox ID="TextBoxRating" runat="server" Font-Size="Larger" Width="200px" Height="30px"></asp:TextBox>
        &emsp;<asp:Button ID="Button_Rating" runat="server" Text="Search"  Width="100px" Height="35px" Font-Size="Large" BorderColor="Transparent"/>
    </p>
    <p>
        &nbsp;</p>

    <%--<asp:Label ID="SearchResult" runat="server" Text="Search Result :" Font-Size="X-Large" Font-Bold="True"></asp:Label>--%>
    
    <asp:FormView ID="FormView2" runat="server" DataSourceID="RatingForm" DataKeyNames="The userID you are currently viewing"  Font-Size="Large"  Width="800px">
        <EditItemTemplate>
            The userID you are currently viewing:
            <asp:Label ID="The_userID_you_are_currently_viewingLabel1" runat="server" Text='<%# Eval("[The userID you are currently viewing]") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="更新" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消" />
        </EditItemTemplate>
        <EmptyDataTemplate>
            This user does not exist yet.
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="插入" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消" />
        </InsertItemTemplate>
        <ItemTemplate>
            The userID you are currently viewing:
            <asp:Label ID="The_userID_you_are_currently_viewingLabel" runat="server" Text='<%# Eval("[The userID you are currently viewing]") %>' />
            <br />
        </ItemTemplate>
    </asp:FormView>
        <asp:SqlDataSource ID="RatingForm" runat="server" ConnectionString="<%$ ConnectionStrings:TextbookChangedPlatformConnectionString %>" SelectCommand="SELECT id AS 'The userID you are currently viewing'
                    FROM Users
                    WHERE id LIKE @id">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBoxRating" Name="id" PropertyName="Text" DefaultValue="0" />
            </SelectParameters>
        </asp:SqlDataSource>
      


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
</asp:Content>
