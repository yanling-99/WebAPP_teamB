<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="WebApplication_B._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server"> <br />
    
    
    <%-- 標題 --%>
    <div class="jumbotron" style="background-color:#FFFAFA">
        <font size="72" face="Times New Roman" color="#8B5A2B"><b>Used Textbook Trading Platform</b></font>
        <br />
        <br />
        <font size="5" face="Times New Roman" color="#8B5A2B">Promote Taiwanese Engineers in Civil Construction to connect with the world.</font>
    </div>

    <%-- 照片 --%>
    <div class="section" style="text-align:center">
        <img src="Image/communication.jpg" style="width:1170px">
    </div>

    <br />
    
    <div class="row">
        <%-- 最新消息 --%>
        <div class="col-md-6">
            <h2><b><font face="Times New Roman" color="#8B5A2B">Latest News</font></b></h2>
            <p style="font-size:17px">
                ASP.NET Web Forms lets you build dynamic websites using a familiar drag-and-drop, event-driven model.
                A design surface and hundreds of controls and components let you rapidly build sophisticated, powerful UI-driven sites with data access.
            </p>
            <p>
                <a class="btn btn-default" href="http://localhost:61218/About">New Event on 18 October 2022 >></a>
            </p>
        </div>

         <%-- 活動 --%>
        <div class="col-md-6">
            <h2><b><font face="Times New Roman" color="#8B5A2B">Event</font></b></h2>
            <p style="font-size:17px">
                ASP.NET Web Forms lets you build dynamic websites using a familiar drag-and-drop, event-driven model.
                 A design surface and hundreds of controls and components let you rapidly build sophisticated, powerful UI-driven sites with data access.
            </p>
            <p>
                <a class="btn btn-default" href="http://localhost:61218/Contact">New Event on 18 October 2022 >></a>
            </p>
        </div>
    </div>
        

    

</asp:Content>
