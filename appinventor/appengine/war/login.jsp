<%@page import="javax.servlet.http.HttpServletRequest"%>
<%@page import="com.google.appinventor.server.util.UriBuilder"%>
<%@page import="org.apache.commons.lang3.StringEscapeUtils"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<%
   String error = StringEscapeUtils.escapeHtml4(request.getParameter("error"));
   String useGoogleLabel = (String) request.getAttribute("useGoogleLabel");
   String locale = StringEscapeUtils.escapeHtml4(request.getParameter("locale"));
   String redirect = StringEscapeUtils.escapeHtml4(request.getParameter("redirect"));
   String repo = StringEscapeUtils.escapeHtml4((String) request.getAttribute("repo"));
   String autoload = StringEscapeUtils.escapeHtml4((String) request.getAttribute("autoload"));
   String galleryId = StringEscapeUtils.escapeHtml4((String) request.getAttribute("galleryId"));
   String newGalleryId = StringEscapeUtils.escapeHtml4(request.getParameter("ng"));
   if (locale == null) {
       locale = "en";
   }

%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta HTTP-EQUIV="pragma" CONTENT="no-cache"/>
    <meta HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate"/>
    <meta HTTP-EQUIV="expires" CONTENT="0"/>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@500&display=swap" rel="stylesheet"> 
    <style>
       a:link {
  color: #999999;
  background-color: transparent;
  text-decoration: none;
}

a:visited {
  color: #999999;
  background-color: transparent;
  text-decoration: none;
}

a:hover {
  color: #999999;
  background-color: transparent;
  text-decoration: none;
}

a:active {
  color: #999999;
  background-color: transparent;
  text-decoration: none;
}
.button {
   border-radius: 5px; background-color: white; border: 1px solid #999999; width: 150px; height: 37px;
        cursor: pointer; padding: 10px; color: black;
      }

.signIn:hover{
  background-color: #999999;
}
.signIn{
  background-color: #999999;
  width: 150px; height: 37px;
}

.button:hover{
  background-color: #d3d3d3;
}

    </style>

    <title>Sign In - DevApps</title>
  </head>
<body style="background-color: #ffffff;"> 

   <center>
      <section style="width: 350px;
      border: 1px solid #ddd;  
      box-shadow: 0 2px 15px #ccc;
      border-radius: 5px;
      padding: 20px 30px 30px;
      padding-bottom: 3px;
      position: absolute;
      top: 50%;
      left: 50%;
      transform: translate(-50%, -50%);
      background-color: #fff;">
      <h2 style="font-family: open sans; color: #000; text-align: left;">Welcome Back</h2>
      <% if (error != null) {
        out.println("<center><font color=red><b>" + error + "</b></font></center><br/>");
           } %>
           <form method=POST action="/login">
            <center><table>
            <tr><td><input type=text name="email" style="padding: 4px; padding-left: 12px; font-size: 17px; border: 1px solid #999999; border-radius: 5px; background-color: #ffffff; width: 330px; height: 37px; color: black;" placeholder="Email" value=""></td></tr>
            <tr><td></td></td>
              <tr><td><input type=password name="password" style="padding: 4px; padding-left: 12px; font-size: 17px; border: 1px solid #999999; border-radius: 5px; background-color: #ffffff; width: 330px; height: 37px; color: black;" placeholder="Password" value=""></td></tr>
            </table></center>
            <center><p style="padding-left: 7px; text-align: left; background-color: white;" width="380px"><a href="/login/sendlink">Forget Password?</a></p></center>
            <% if (locale != null && !locale.equals("")) {
               %>
            <input type=hidden name=locale value="<%= locale %>">
            <% }
               if (repo != null && !repo.equals("")) {
               %>
            <input type=hidden name=repo value="<%= repo %>">
            <% }
               if (autoload != null && !autoload.equals("")) {
               %>
            <input type=hidden name=autoload value="<%= autoload %>">
            <% }
               if (galleryId != null && !galleryId.equals("")) {
               %>
            <input type=hidden name=galleryId value="<%= galleryId %>">
            <% }
               if (newGalleryId != null && !newGalleryId.equals("")) {
               %>
            <input type=hidden name=ng value="<%= newGalleryId %>">
            <% } %>
            <% if (redirect != null && !redirect.equals("")) {
               %>
            <input type=hidden name=redirect value="<%= redirect %>">
            <% } %>
            <p></p>
            <center><input type="Submit" class="signIn" value="Sign In" style="font-family: open sans; font-size: 17px; border-radius: 5px; background-color: white; border: 1px solid #999999; width: 150px; height: 37px;"></center>
            </form>
            <p></p>
            <p style="font: size 15px; background-color: white;">OR</p>
          <p style="height: 2px;"></p>  
            <%    if (useGoogleLabel != null && useGoogleLabel.equals("true")) { %>
              <center><p><a href="<%= new UriBuilder("/login/google")
                                            .add("locale", locale)
                                            .add("autoload", autoload)
                                            .add("repo", repo)
                                            .add("galleryId", galleryId)
                                            .add("ng", newGalleryId)
                                            .add("redirect", redirect).build() %>" class="button" style="font-size: 15px; color: black; font-family: open sans;">Login With Google</a></p></center><%    } %>

            <p style="height: 15px;"></p>                               
           <center><p style="text-align: center; background-color: white;" width="380px"><a href="/login/sendlink">Don't have account? Create New</a></p></center>

    
    
    </section>  </center>  

</body></html>

