<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="WebApplication_B.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server" >
    <br />

    <%-- 標題 Contact us --%>
    <br/><h2><b style="color:#8B5A2B">Contact us</b></h2><br />

    <%-- 表單 --%>
    <div class="jumbotron" style="background-color:#FFDAB9;width:750px; height:450px;  padding-top:30px">
        <div style="text-align:center">
            <font size="6" face="Times New Roman" color="#8B5A2B"><b>Drop us a line!</b></font>
        </div>
        <br /><br />

        <div class="row">
            <div class="col-md-6">
                <p>
                    <label for="name" style="font-size:20px">Your Name</label><br />
                    <input type="text" name="name" placeholder="Enter your name.">
                    <br /><br />

                    <label for="email" style="font-size:20px" >E-mail</label><br />
                    <input type="text" name="email" placeholder="Enter your email.">
                    <br /><br />

                    <label for="file" style="font-size:20px">Upload File</label><br />
                    <input type="file" name="file" style="font-size:16px">
                </p>
            </div>

            <div class="col-md-6">
                <label for="Message" style="font-size:20px">Message</label><br />
                <textarea name="message" rows="5" cols="30"></textarea>
                <br /><br /><br />

                <button type="submit" name="submit">Submit</button>
            </div>
        </div>
        <%--<div class="row">
            <div class="col-md-6">
                <b style="font-size:20px">Your Name</b><br />
                <asp:TextBox runat="server" Width="1000px" BorderStyle="None" BackColor="#F2F0EA" AutoCompleteType="FirstName" ForeColor="#666666" Font-Size="Large"></asp:TextBox>
                <br /><br />
                <b style="font-size:20px">E-mail</b><br />
                <asp:TextBox runat="server" Width="1000px" BorderStyle="None" BackColor="#F2F0EA" AutoCompleteType="Email" ForeColor="#666666" Font-Size="Large"></asp:TextBox>
                <br /><br /><br /><br />
                <asp:Button runat="server" Text="Submit" Width="300px" Height="30px" BackColor="#F2F0EA" BorderColor="#C2BA9E" Enabled="False" ></asp:Button>

            </div>

            <div class="col-md-6" >
                <b style="font-size:20px">Message</b><br />
                <asp:TextBox runat="server" Width="300px" Height="200px" BorderStyle="None" TextMode="MultiLine" BackColor="#F2F0EA" ForeColor="#666666" MaxLength="200" ToolTip="The nuber of words must less than 200!" AutoCompleteType="Notes" Font-Size="Large"></asp:TextBox>
            </div>
        </div>--%>
        
    </div>


    <br /><br />
    <%-- About --%>

    <p style="font-size:18px; font-family:'Times New Roman'; color:#4F4F4F">
        <strong>Ask Questions About OTEA+ Using Textbook Trading.</strong><br />
        Please contact us by info.textbook@otea+.network if you cannot find an answer to your question.
    </p>
    <br />
    <p style="font-size:18px; font-family:'Times New Roman'; color:#4F4F4F">
        <strong>Ask Questions About OTEA+.</strong><br />
        Please contact us by <a  href="http://localhost:61218/Home">info@otea+.network</a> if you cannot find an answer to your question.
    </p>
    <br /><br /><br /><br /><br /><br /><br />

    <%-- 地址、聯絡資訊 --%>
    <address  style="font-size:18px; font-family:'Times New Roman'; color:#4F4F4F">
        No.43, Keelung Rd., Sec.4, Da'an Dist.,<br />
        Taipei City 106335, Taiwan (R.O.C.)
    </address>

    <address>
        <strong>Phone:</strong>0900-123-456<br />
        <strong>Support:</strong>   <a href="mailto:M11005510@email.ntust.edu.tw">M11005510@email.ntust.edu.tw</a><br />
        <strong>Marketing:</strong> <a href="mailto:M11105101@email.ntust.edu.tw">M11105101@email.ntust.edu.tw</a>
    </address>
</asp:Content>
