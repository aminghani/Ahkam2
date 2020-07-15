import Database.PersonalInfoTable;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/PageOne")
public class PageOne extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(request.getParameter("level").equals("Admin")){
            if(request.getParameter("username").equals("admin") && request.getParameter("password").equals("pass")) {
                String userName = request.getParameter("username");
                request.setAttribute("username", userName);
                RequestDispatcher dispatcher = request.getRequestDispatcher("/adminPage.jsp");
                dispatcher.forward(request, response);
            }else {
                pageNotFoundRespond(response);
            }
        }else if(request.getParameter("level").equals("Employee")){
            PersonalInfoTable personalInfoTable = new PersonalInfoTable();
            int id = personalInfoTable.loginVerify(request.getParameter("username") , request.getParameter("password"));
            if(id == -1){
                pageNotFoundRespond(response);
            }else{
                String userName = request.getParameter("username");
                request.setAttribute("username", userName);
                RequestDispatcher dispatcher = request.getRequestDispatcher("/userpage.jsp");
                dispatcher.forward(request, response);
            }
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    private void pageNotFoundRespond(HttpServletResponse response) throws IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.println("<html>\n" +
                "<head>\n" +
                "<title>error 404 for Website Template | Home :: w3layouts</title>\n" +
                "<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\"/>\n" +
                "<link href='//fonts.googleapis.com/css?family=Courgette' rel='stylesheet' type='text/css'>\n" +
                "<style type=\"text/css\">\n" +
                "body{\n" +
                "\tfont-family: 'Courgette', cursive;\n" +
                "}\n" +
                "body{\n" +
                "\tbackground:#f3f3e1;\n" +
                "}\t\n" +
                ".wrap{\n" +
                "\tmargin:0 auto;\n" +
                "\twidth:100%;\n" +
                "}\n" +
                ".logo{\n" +
                "\tmargin-top:50px;\n" +
                "}\t\n" +
                ".logo h1{\n" +
                "\tfont-size:200px;\n" +
                "\tcolor:#8F8E8C;\n" +
                "\ttext-align:center;\n" +
                "\tmargin-bottom:1px;\n" +
                "\ttext-shadow:1px 1px 6px #fff;\n" +
                "}\t\n" +
                ".logo p{\n" +
                "\tcolor:rgb(228, 146, 162);\n" +
                "\tfont-size:20px;\n" +
                "\tmargin-top:1px;\n" +
                "\ttext-align:center;\n" +
                "}\t\n" +
                ".logo p span{\n" +
                "\tcolor:lightgreen;\n" +
                "}\t\n" +
                ".sub a{\n" +
                "\tcolor:white;\n" +
                "\tbackground:#8F8E8C;\n" +
                "\ttext-decoration:none;\n" +
                "\tpadding:7px 120px;\n" +
                "\tfont-size:13px;\n" +
                "\tfont-family: arial, serif;\n" +
                "\tfont-weight:bold;\n" +
                "\t-webkit-border-radius:3em;\n" +
                "\t-moz-border-radius:.1em;\n" +
                "\t-border-radius:.1em;\n" +
                "}\t\n" +
                ".footer{\n" +
                "\tcolor:#8F8E8C;\n" +
                "\tposition:absolute;\n" +
                "\tright:10px;\n" +
                "\tbottom:10px;\n" +
                "}\t\n" +
                ".footer a{\n" +
                "\tcolor:rgb(228, 146, 162);\n" +
                "}\t\n" +
                "@media screen and (max-width: 1024px){\n" +
                "\t.logo h1 {\n" +
                "    font-size: 180px;\n" +
                "}\n" +
                "}\n" +
                "@media screen and (max-width: 991px){\n" +
                "\t.logo h1 {\n" +
                "\t\tfont-size: 170px;\n" +
                "\t}\n" +
                "}\n" +
                "@media screen and (max-width: 900px){\n" +
                "\t.logo h1 {\n" +
                "\t\tfont-size: 160px;\n" +
                "\t\tmargin-top: 130px;\n" +
                "\t}\n" +
                "}\n" +
                "@media screen and (max-width: 800px){\n" +
                "\t.logo h1 {\n" +
                "\t\tfont-size: 140px;\n" +
                "\t\tmargin-top: 135px;\n" +
                "\t}\n" +
                "}\n" +
                "@media screen and (max-width: 768px){\n" +
                "\t.logo h1 {\n" +
                "\t\tfont-size: 135px;\n" +
                "\t}\n" +
                "\t.logo p {\n" +
                "        font-size: 18px;\n" +
                "\t}\n" +
                "}\n" +
                "@media screen and (max-width: 667px){\n" +
                "\t.logo h1 {\n" +
                "\t\tfont-size: 130px;\n" +
                "\t\tmargin-top: 150px;\n" +
                "\t}\n" +
                "}\t\n" +
                "@media screen and (max-width: 640px){\n" +
                "\t.logo h1 {\n" +
                "    \tfont-size: 126px;\n" +
                "\t}\n" +
                "\t.footer {\n" +
                "       font-size: 15px\n" +
                "\t}\n" +
                "}\n" +
                "@media screen and (max-width: 600px){\n" +
                "\t.logo h1 {\n" +
                "\t\tfont-size: 120px;\n" +
                "\t}\n" +
                "}\n" +
                "\n" +
                "@media screen and (max-width: 568px){\n" +
                "\t.logo h1 {\n" +
                "\t\tfont-size: 110px;\n" +
                "\t}\n" +
                "\t.footer {\n" +
                "\t\tfont-size: 14px;\n" +
                "\t}\n" +
                "}\n" +
                "@media screen and (max-width: 480px){\n" +
                "\t.logo h1 {\n" +
                "\t\tfont-size: 105px;\n" +
                "\t\tmargin-top: 165px;\n" +
                "\t}\n" +
                "}\n" +
                "@media screen and (max-width: 414px){ \n" +
                "\t.logo h1 {\n" +
                "\t\tfont-size: 100px;\n" +
                "\t\tmargin-top: 180px;\n" +
                "\t}\n" +
                "}\n" +
                "@media screen and (max-width: 384px){\n" +
                "\t.logo h1 {\n" +
                "   \t\t font-size: 96px;\n" +
                "\t}\n" +
                "\t.logo p {\n" +
                "\t\tfont-size: 17px;\n" +
                "\t}\n" +
                "\t.footer {\n" +
                "\t\tfont-size: 13px;\n" +
                "\t}\n" +
                "}\n" +
                "@media screen and (max-width: 375px){\n" +
                "\t.logo h1 {\n" +
                "\t\tfont-size: 90px;\n" +
                "\t}\n" +
                "\t.footer {\n" +
                "\t\tfont-size: 13px;\n" +
                "\t\tline-height: 1.8;\n" +
                "\t\ttext-align: center;\n" +
                "\t\tpadding: 1em;\n" +
                "\t}\n" +
                "}\n" +
                "@media screen and (max-width: 320px){\n" +
                "\t.logo h1 {\n" +
                "\t\tfont-size: 84px;\n" +
                "\t}\n" +
                "\t.logo p {\n" +
                "\t\tfont-size: 16px;\n" +
                "\t}\n" +
                "}\n" +
                "/* -- //Responsive code -- */\n" +
                "</style>\n" +
                "</head>\n" +
                "\n" +
                "\n" +
                "<body>\n" +
                "\t<div class=\"wrap\">\n" +
                "\t   <div class=\"logo\">\n" +
                "\t   <h1>Try Again</h1>\n" +
                "\t    <p>Error occurred! - File not Found</p>\n" +
                "  \t      <div class=\"sub\">\n" +
                "\t        <p>Wrong Info</p>\n" +
                "\t      </div>\n" +
                "        </div>\n" +
                "\t</div>\n" +
                "\t\n" +
                "\t<div class=\"footer\">\n" +
                "\t &copy 2012 error 404 . All Rights Reserved | Design by<a href=\"http://w3layouts.com\">W3layouts</a>\n" +
                "\t</div>\n" +
                "\t\n" +
                "</body>");
    }
}
