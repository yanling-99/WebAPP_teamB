<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="rateOthers.aspx.cs" Inherits="WebApplication_B.User.Rate_others" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <br /><br />
        <h style="font-size: 22px; font-weight: bold">Search ratings you've rated.&nbsp; </h>
    <p>
        <br /> 
        <h style="font-size: 16px; font-weight: bold">Please enter yourID:&nbsp; </h>

        <asp:TextBox ID="TextBoxRating0" runat="server" Font-Size="Larger" Width="200px" Height="30px"></asp:TextBox>
        &emsp;<asp:Button ID="Button_Rating0" runat="server" Text="Search"  Width="100px" Height="35px" Font-Size="Large" BorderColor="Transparent" OnClick="Button_Rating0_Click"/>
    </p>

    <asp:FormView ID="FormView2" runat="server" DataSourceID="RatingForm" DataKeyNames="Check your userID"  Font-Size="Large"  Width="800px">
        <EditItemTemplate>
            Check yourID:
            <asp:Label ID="Check_your_userIDLabel1" runat="server" Text='<%# Eval("[Check your userID]") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <EmptyDataTemplate>
            This user does not exist yet.
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
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
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" CancelText="Cancel" DeleteText="Delete" EditText="Edit" HeaderText="command" UpdateText="Update" />
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

    <br /><br />
    <hr / style="border-top-color:#B5B5B5">
    <br /><br />
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
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <EmptyDataTemplate>
            Add a rating!
            <br /><br />
            <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
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
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
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
            <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
        </ItemTemplate>
    </asp:FormView>
      

        <br />

    <asp:FormView ID="FormView4" runat="server" DataKeyNames="yourID,userID" DataSourceID="RatingForm0" Font-Size="Large" OnPageIndexChanging="FormView4_PageIndexChanging" Visible="False">
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
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <EmptyDataTemplate>
            Add a rating!
            <br /><br />
            <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
        </EmptyDataTemplate>
        <InsertItemTemplate>
            yourID:
            <asp:Label ID="Label1" runat="server" ></asp:Label>
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
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
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
            <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
        </ItemTemplate>
    </asp:FormView>
      

        <asp:SqlDataSource ID="RatingForm0" runat="server" ConnectionString="<%$ ConnectionStrings:TextbookChangedPlatformConnectionString %>" SelectCommand="SELECT raterID AS yourID, userID, rating, comment
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
