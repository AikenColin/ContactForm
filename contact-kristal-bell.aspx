<%@ Page Title="Ready to help with all your Handbell needs - Kristal Bell Method" MetaDescription="With 25 years in the Handbell Business we know what you need, and we provide it with pleasure." MetaKeywords="Bells,Music,Songs" MaintainScrollPositionOnPostback="true" Language="C#" MasterPageFile="~/K-Bell.Master" AutoEventWireup="true" CodeBehind="contact-kristal-bell.aspx.cs" Inherits="WebApplication1.contact_kristal_bell" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <header>
        <meta name="description" content="With 25 years in the Handbell Business we know what you need, and we provide it with pleasure." />
        <meta name="keywords" content="Bells,Music,Songs" />
        <meta name="image" content="style/images/art/Handbell-Music.jpg" title="Hand Bells Kits - Kristal Bell Method"/>
    </header>
    <div class="scanlines"></div>
    <div class="wrapper">
        <div class="blog-wrap">
            <div class="blog-grid">
                <div class="post format-image box" id="startC">
                    <ol style="list-style-type: none" id="MessageEntry" runat="server">
                        <li id="liName" runat="server" class="contact-li" style="padding-bottom: 3px">Name of Church, School, Organization<asp:TextBox CssClass="contact-tb" runat="server" ID="txtName" Style="background-color: #86aca3; text-transform:capitalize; text-indent:3px; display:block"></asp:TextBox>
                        </li>
                        <li id="liContact" runat="server" class="contact-li" style="padding-bottom: 3px">Your Name or Contact Person<asp:TextBox CssClass="contact-tb" runat="server" ID="txtContact" Style="background-color: #86aca3; text-transform:capitalize; text-indent:3px; display:block"></asp:TextBox>
                        </li>
                        <li id="liEmail" runat="server" class="contact-li" style="padding-bottom: 3px">Email Address  (ex: YourEmail@gmail.com)<asp:TextBox CssClass="contact-tb" runat="server" ID="txtEmail" Style="background-color: #86aca3; text-transform:capitalize; text-indent:3px; display:block"></asp:TextBox>
                        </li>
                        <li id="liPhone" runat="server" class="contact-li" style="padding-bottom: 3px">Phone Number  (ex: 111-111-1111)<asp:TextBox CssClass="contact-tb" runat="server" ID="txtPhn" Style="background-color: #86aca3; text-transform:capitalize; text-indent:3px; display:block"></asp:TextBox>
                        </li>
                        <li id="liCity" runat="server" class="contact-li" style="padding-bottom: 3px">City<asp:TextBox CssClass="contact-tb" runat="server" ID="txtCity" Style="background-color: #86aca3; text-transform:capitalize; text-indent:3px; display:block"></asp:TextBox>
                        </li>
                        <li id="liState" runat="server" class="contact-li" style="padding-bottom: 3px">State<asp:TextBox CssClass="contact-tb" runat="server" ID="txtState" Style="background-color: #86aca3; text-transform:capitalize; text-indent:3px; display:block"></asp:TextBox>
                        </li>
                        <li id="liMessage" runat="server" class="contact-li">Question / Inquiry<textarea class="contact-ta" id="txtQuestion" name="txtQuestion" runat="server" style="background-color: #86aca3; color: #ffffff; font-size: large; padding-bottom: 47px; text-indent:3px; display:block"></textarea>
                        </li>
                        <li id="FillInfo" runat="server" style="display: none; color:#dd0214; font-style:italic; font-size:18px"><p>Please Fill All Boxes so we may contact you.</p></></li>
                        <li>
                            <asp:Button runat="server" ID="btnSubmit" Text="Submit Message" Visible="true" OnClick="btnSubmit_Click" CssClass="contact-button"/>
                        </li>
                        <li id="liSent" runat="server" class="contact-li" style="display:none"><p style="padding-top:50px; padding-bottom:17px; line-height:200%; text-align:center; font-size:xx-large"><br />Thank you! <br /> Your message has been sent.<br /><br /><br /><br /></p>
                        </li>
                    </ol>
                </div>

                <div class="post format-image box">
                    <h2 class="title" style="padding-top: 0px; padding-bottom: 4px"><a href="contact-kristal-bell.aspx#startC">Contact Us, We're Ready to Help</a></h2>
                    <div id="Phone" class="sale-box" runat="server" style="text-align:left">
                <asp:Repeater ID="Repeat" runat="server">
                    <ItemTemplate>
                        <p id="showStuff" runat="server" style="font-style: italic; font-size: 16px; font-weight: 800; text-shadow: 1.2px 0 #86aca3; color:#F87431"><%#Eval("CurrentContact")%></p>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:KBellString%>" SelectCommand="SELECT * FROM [tblContactMessage]"></asp:SqlDataSource>
        <div id="map" class="frame2" style="height: 296px; width: 100%; position: center; padding-bottom: 5px">
                        <iframe></iframe>
                    </div>
                    <script>
                        function myMap() {
                            var uluru = { lat: 30.411963, lng: -91.015501 };
                            var map = new google.maps.Map(document.getElementById('map'), {
                                zoom: 7,
                                center: uluru
                            });
                            var marker = new google.maps.Marker({
                                position: uluru,
                                map: map
                            });
                        }
                    </script>
                    <script async defer
                        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCnKzuMRIrOZsit5XZIC5nDixzDu_h0dzQ&callback=myMap">
                    </script>
                    <p></p>
                    <%--font-size: 15.265px;--%>
                    <p style="font-size: 15.265px; font-weight: 500; font-style: oblique; line-height: 125%; padding-bottom: 3.7px; text-shadow: 1.0px 0 #77BFC7;">
                        <a target="_blank" href="http://maps.google.com/maps?q=4608+Jones+Creek+Road+Suite+210+Baton+Rouge,+Louisiana+70817" style="color:lightgray">
                        Kristal Bell Method<br />
                        4608 Jones Creek Rd. Suite 210<br />
                        Baton Rouge, Louisiana 70817</a>
                    </p>
                    <p style="font-size: 15.265px; font-weight: 500; font-style: oblique; line-height: 131%; padding-bottom: 3.9px; text-shadow: 1.0px 0 #77BFC7;">
                        
                    <a href="tel:18005747825" style="color:#86aca3">
                        Phone:</a><br />
                        <a href="tel:18005747825" style="color:lightgray">
                    +1 800 574-7825 (KRISTAL)</a><br />
                        <a href="tel:12257563077" style="color:lightgray">
                    +1 225 756-3077</a>
                    </p>
                    <p style="font-size: 15.265px; font-weight: 500; font-style: oblique; line-height: 131%; padding-bottom: 3.9px; text-shadow: 1.0px 0 #77BFC7;">
                        
                    <a href="mailto:KristalBell93@gmail.com" style="color:#86aca3">
                        E-mail:</a><br />
                        <a href="mailto:KristalBell93@gmail.com" style="color:lightgray">
                        KristalBell93@gmail.com</a><br />
                        <a href="mailto:k5bell@aol.com" style="color:lightgray">
                        k5bell@aol.com</a>
                    </p>
                    <div class="details"><span class="icon-chat"><%--<a href="#">June 13, 2045</a>--%></span> <%--<span class="likes"><a href="#" class="likeThis">5</a></span> <span class="comments"><a href="#">0</a></span>--%> </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        (function (i, s, o, g, r, a, m) {
            i['GoogleAnalyticsObject'] = r; i[r] = i[r] || function () {
                (i[r].q = i[r].q || []).push(arguments)
            }, i[r].l = 1 * new Date(); a = s.createElement(o),
            m = s.getElementsByTagName(o)[0]; a.async = 1; a.src = g; m.parentNode.insertBefore(a, m)
        })(window, document, 'script', 'https://www.google-analytics.com/analytics.js', 'ga');

        ga('create', 'UA-102809051-1', 'auto');
        ga('send', 'pageview');

</script>
</asp:Content>
