<%@ page import="java.util.List" %>
<%@ page import="Database.*" %>
  Created by IntelliJ IDEA.
  User: Amin
  Date: 6/18/2020
  Time: 1:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/css/userPageStyle/userPage.css">
    <style>
        .sidebar {
            height: 100%;
            width: 0;
            position: fixed;
            z-index: 1;
            top: 0;
            left: 0;
            background-color: #172a74;
            overflow-x: hidden;
            padding-top: 60px;
            transition: 0.5s;
            font-family: Arial;
        }

        /* The sidebar links */
        .sidebar a {
            padding: 8px 8px 8px 32px;
            text-decoration: none;
            font-size: 25px;
            color: #818181;
            display: block;
            transition: 0.3s;
        }

        /* When you mouse over the navigation links, change their color */
        .sidebar a:hover {
            color: #f1f1f1;
        }

        /* Position and style the close button (top right corner) */
        .sidebar .closebtn {
            position: absolute;
            top: 0;
            right: 25px;
            font-size: 36px;
            margin-left: 50px;
        }

        /* The button used to open the sidebar */
        .openbtn {
            font-size: 20px;
            cursor: pointer;
            background-color: #111;
            color: white;
            padding: 10px 15px;
            border: none;
        }

        .openbtn:hover {
            background-color: #444;
        }

        /* Style page content - use this if you want to push the page content to the right when you open the side navigation */
        #main {
            transition: margin-left .5s; /* If you want a transition effect */
            padding: 20px;
        }

        /* On smaller screens, where height is less than 450px, change the style of the sidenav (less padding and a smaller font size) */
        @media screen and (max-height: 450px) {
            .sidebar {padding-top: 15px;}
            .sidebar a {font-size: 18px;}
        }
        .userInfo {
            background-color: #80bdff;
            margin: 25px;
            padding: 30px;
            width: 600px;
            position: static;
            left: 550px;
            top: 100px;
            text-align: right;
            z-index: 1;
            border: #172a74 3px;
        }

        .password-change {
            position: static;
            top: 500px;
            left: 400px;
            background-color: #80bdff;
            margin: 25px;
            padding: 35px;
            width: 300px;
            z-index: 1;
            text-align: right;
            border: #172a74 3px;

        }

        .monthly-salary {
            background-color: #80bdff;
            position: static;
            top: 100px ;
            left: 550px ;
            margin: 25px;
            padding: 35px;
            z-index: 1;
            border: #172a74 3px;

        }


        body{
            background-color: #9fcdff;
        }
    </style>
</head>
<body>

<div id="mySidebar" class="sidebar">
    <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
    <a href="#" id="user-info-btn">user info</a>
    <a href="#" id="monthly-salary">monthly salary</a>
    <a href="#" id="change-password">change password</a>
    <a href="#" id="feedback">FeedBack</a>
</div>

<div id="main">
    <button class="openbtn" onclick="openNav()">&#9776; Open Sidebar</button>
</div>
    <script>
        function openNav() {
            document.getElementById("mySidebar").style.width = "250px";
            document.getElementById("main").style.marginLeft = "250px";
        }

        function closeNav() {
            document.getElementById("mySidebar").style.width = "0";
            document.getElementById("main").style.marginLeft = "0";
    }
    </script>
    <script>
        userinfobtn = document.getElementById("user-info-btn")
        passwordchange = document.getElementById("change-password")
        monthlysalary = document.getElementById("monthly-salary")
        feedback = document.getElementById("feedback");
        userinfobtn.addEventListener("click" , () => {
            document.querySelector(".userInfo").style.visibility = "visible";
            document.querySelector(".password-change").style.visibility = "hidden";
            document.querySelector(".monthly-salary").style.visibility = "hidden";
            document.querySelector(".feedback-form").style.visibility = "hidden";
        })
        passwordchange.addEventListener("click" , () => {
            document.querySelector(".password-change").style.visibility = "visible";
            document.querySelector(".userInfo").style.visibility = "hidden";
            document.querySelector(".monthly-salary").style.visibility = "hidden";
            document.querySelector(".feedback-form").style.visibility = "hidden";
        })
        monthlysalary.addEventListener("click" , () => {
            document.querySelector(".monthly-salary").style.visibility = "visible";
            document.querySelector(".password-change").style.visibility = "hidden";
            document.querySelector(".userInfo").style.visibility = "hidden";
            document.querySelector(".feedback-form").style.visibility = "hidden";
        })
        feedback.addEventListener("click" , () => {
            document.querySelector(".feedback-form").style.visibility = "visible";
            document.querySelector(".monthly-salary").style.visibility = "hidden";
            document.querySelector(".password-change").style.visibility = "hidden";
            document.querySelector(".userInfo").style.visibility = "hidden";
        })
    </script>
    <div class="feedback-form" style="visibility: hidden;position: absolute;top: 150px;left: 500px;text-align: right">
        <%
            PersonalInfoTable personalInfoTable = new PersonalInfoTable();
            int id = personalInfoTable.loginVerify(request.getParameter("username") , request.getParameter("password"));
            List<String> personalInfo = new PersonalInfoTable().read(id);
            List<String> jobInfo = new JobAndJobLocationInfoTable().read(id);
            System.out.println(id);
        %>
        <form action="FeedBack" , method="post">
            <input size="100" height="10" name="feedback-body" placeholder="متن درخواست"/>
            <input type="submit" value="ارسال">
            <input name="id" style="visibility: hidden" value=<%=id%>>
            <input name="level" style="visibility: hidden" value="Employee">
            <input name="username" style="visibility: hidden" value=<%=personalInfo.get(3)%>>
            <input name="password" style="visibility: hidden" value=<%=personalInfo.get(5)%>>
        </form>
    </div>
    <div class="header-admin" style="position: absolute;top: 0px;right: 0px;width: 85.8%;height: 100px;text-align:right;background-color: #86cfda;padding: 10px;z-index: 2;color: white">
        <br>
        <p id="datetime"></p>
        <br>
    </div>
    <div class="right-bar" style="position: absolute;top: 100px;right: 0px;height: 300%;width: 200px;background-color: #43e3b0;text-align: right;padding: 25px;z-index: 1;color: white">

        <p style="font-size: 18px">صفحه کاربری</p>
        <br>
        <hr>
        : نام<br>
        <p style="font-size: 16px"><%=personalInfo.get(0)%></p>
        <br>
        <hr>
        : نام خانوادگی<br>
        <p style="font-size: 16px"><%=personalInfo.get(1)%></p>
        <br>
        <hr>
        : نام پدر<br>
        <p style="font-size: 16px"><%=personalInfo.get(2)%></p>
        <br>
        <hr>
        : شماره شناسنامه<br>
        <p style="font-size: 16px"><%=personalInfo.get(3)%></p>
        <br>
        <hr>
        : سطح مستخدم<br>
        <p style="font-size: 16px"><%=jobInfo.get(7)%></p>

    </div>
    <script>
        window.setInterval(function(){
            var dt = new Date();
            document.getElementById("datetime").innerHTML = dt.toLocaleString();
        }, 1000);
    </script>
    <div class="monthly-salary" style="visibility: hidden;position: absolute;top: 150px;left: 550px;background-color: #7abaff;border: #0c5460 5px solid;margin: 35px;padding: 35px;text-align: right;color: white">
        <%
            List<Double> kosor = new KosorTable().read();
            List<Integer> hogog = new HogogVaFogoladeHaTable().read(id);
            int zarib = new ZaribTable().getCurrentZarib(Integer.parseInt(jobInfo.get(7)));
            int sumEmtiaz = hogog.get(0)+hogog.get(1)+hogog.get(2)+hogog.get(3)+hogog.get(4)+hogog.get(5)+
                    hogog.get(6)+hogog.get(7)+hogog.get(8)+hogog.get(9)+hogog.get(10)+hogog.get(11)+hogog.get(12);
        %>

        <div class="kosor" style="text-align: right;text-align: right">
            <%=kosor.get(0)%> : مالیات
            <br>
            <hr style="height: 1px;width: 550px;alignment: right">
            <br>
            <%=kosor.get(1)%>: بیمه تامین اجتماعی
            <br>
            <hr style="height: 1px;width: 550px;alignment: right">
            <br>
            <%=kosor.get(2)%>: عضویت صندوق تعاون
            <br>
            <hr style="height: 1px;width: 550px;alignment: right">
            <br>
            <%=kosor.get(3)%>: بیمه تکمیلی
            <br>
            <hr style="height: 1px;width: 550px;alignment: right">
            <br>
            <%=kosor.get(0) + kosor.get(1) + kosor.get(2) + kosor.get(3)%> : جمع کسور
        </div>
        <hr style="height: 4px;background-color: #1b1e21">
        <div class="mazaya">
           <%=String.valueOf((hogog.get(0)*zarib))%>  : مبلغ حق شغل <br><br>
            <hr style="height: 1px;width: 550px;alignment: right">
            <%=String.valueOf((hogog.get(1)*zarib))%>: مبلغ فوق العاده مدیریت <br><br>
            <hr style="height: 1px;width: 550px;alignment: right">
            <%=String.valueOf((hogog.get(2)*zarib))%> : مبلغ حق شاغل <br><br>
            <hr style="height: 1px;width: 550px;alignment: right">
            <%=String.valueOf((hogog.get(3)*zarib))%> : مبلغ تفاوت تطبیق <br><br>
            <hr style="height: 1px;width: 550px;alignment: right">
            <%=String.valueOf((hogog.get(4)*zarib))%> : مبلغ مناطق کمتر توسعه یافته<br><br>
            <hr style="height: 1px;width: 550px;alignment: right">
            <%=String.valueOf((hogog.get(5)*zarib))%> : مبلغ بدی ابو هوا<br><br>
            <hr style="height: 1px;width: 550px;alignment: right">
            <%=String.valueOf((hogog.get(6)*zarib))%> : مبلغ ایثارگری <br><br>
            <hr style="height: 1px;width: 550px;alignment: right">
            <%=String.valueOf((hogog.get(7)*zarib))%> : مبلغ نشان های دولتی<br><br>
            <hr style="height: 1px;width: 550px;alignment: right">
            <%=String.valueOf((hogog.get(8)*zarib))%> : مبلغ خدمت در مناطق جنگ زده<br><br>
            <hr style="height: 1px;width: 550px;alignment: right">
            <%=String.valueOf((hogog.get(9)*zarib))%> : مبلغ سختی شرایط کار <br><br>
            <hr style="height: 1px;width: 550px;alignment: right">
            <%=String.valueOf((hogog.get(10)*zarib))%> : مبلغ عایله مندی <br><br>
            <hr style="height: 1px;width: 550px;alignment: right">
            <%=String.valueOf((hogog.get(11)*zarib))%> : مبلغ هزینه اولاد <br><br>
            <hr style="height: 1px;width: 550px;alignment: right">
            <%=String.valueOf((hogog.get(12)*zarib))%> : مبلغ فوق العاده شغل <br><br>
            <%=String.valueOf((sumEmtiaz * zarib))%> :  مجموع
        </div>
        <%=((sumEmtiaz * zarib)/12) - (kosor.get(0) + kosor.get(1) + kosor.get(2) + kosor.get(3))%> : درامد خالص ماهانه
    </div>
    <div class="password-change" style="visibility: hidden;position: absolute;top: 150px;left: 550px;background-color: #7abaff;border: #0c5460 5px solid;margin: 35px;padding: 35px;color: white">
        <form action="ChangePassword" method="post">
            <input type="text" name="user-name" placeholder="نام کاربری">
            <br>
            <hr>
            <input type="password" name="former-password" placeholder="پسورد فعلی">
            <br>
            <hr>
            <input type="password" name="new-password" placeholder="پسورد جدید">
            <br>
            <hr>
            <input type="submit">
        </form>
    </div>
    <div class="userInfo" style="visibility: hidden;position: absolute;top: 150px;left: 550px;background-color: #7abaff;border: #0c5460 5px solid;margin: 35px;padding: 35px;color: white">
        <%
            List<String> birthInfo = new BirthAndDegreeInfoTable().read(id);
            List<String> info = new OtherTable().read(id);
            List<String> isargariInfo = new IsargariAndMarriageInfoTable().read(id);
            List<String> shenasnameAndPostSazmani = new PostSazmaniAndShenasnameTable().read(id);
        %>
        <div class="job-info" style="text-align: right">
              <%=jobInfo.get(0)%>  :  رسته <br><br>
            <hr style="height: 1px;width: 550px;alignment: right">
              <%=jobInfo.get(1)%>: رشته شغلی  <br><br>
            <hr style="height: 1px;width: 550px;alignment: right">
            <%=jobInfo.get(2)%> : طبقه شغلی   <br><br>
            <hr style="height: 1px;width: 550px;alignment: right">
            <%=jobInfo.get(3)%> : رتبه <br><br>
            <hr style="height: 1px;width: 550px;alignment: right">
            <%=jobInfo.get(4)%> : شهرستان خدمت  <br><br>
            <hr style="height: 1px;width: 550px;alignment: right">
            <%=jobInfo.get(5)%> : استان خدمت  <br><br>
            <hr style="height: 1px;width: 550px;alignment: right">
            <%=jobInfo.get(6)%> : نوع حکم <br><br>
            <hr style="height: 1px;width: 550px;alignment: right">
            <%=jobInfo.get(7)%> : سطح مستخدم <br>
        </div>
        <br>
        <hr style="height: 4px;background-color: #1b1e21">
        <div class="personal-info" style="text-align: right">
             <%=personalInfo.get(0)%> : نام <br><br>
            <hr style="height: 1px;width: 550px;alignment: right">
            <%=personalInfo.get(1)%> : نام خانوادگی   <br><br>
            <hr style="height: 1px;width: 550px;alignment: right">
            <%=personalInfo.get(2)%> : نام پدر  <br><br>
            <hr style="height: 1px;width: 550px;alignment: right">
            <%=personalInfo.get(3)%> :  شماره ملی <br><br>
            <hr style="height: 1px;width: 550px;alignment: right">
            <%=personalInfo.get(4)%> : شماره مستخدم  <br>
        </div>
        <br>
        <hr style="height: 4px;background-color: #1b1e21">
        <div class="hogog-va-fogolade" style="text-align: right">
            <%=hogog.get(0).toString()%>                   امتیاز حق شغل :  <%=String.valueOf((hogog.get(0)*zarib))%>  : مبلغ حق شغل <br><br>
            <hr style="height: 1px;width: 550px;alignment: right">
            <%=hogog.get(1).toString()%>         امتیاز فوق العاده مدیریت:  <%=String.valueOf((hogog.get(1)*zarib))%>: مبلغ فوق العاده مدیریت <br><br>
            <hr style="height: 1px;width: 550px;alignment: right">
            <%=hogog.get(2).toString()%>                   امتیاز حق شاغل:  <%=String.valueOf((hogog.get(2)*zarib))%> : مبلغ حق شاغل <br><br>
            <hr style="height: 1px;width: 550px;alignment: right">
            <%=hogog.get(3).toString()%>               امتیاز تفاوت تطبیق:  <%=String.valueOf((hogog.get(3)*zarib))%> : مبلغ تفاوت تطبیق <br><br>
            <hr style="height: 1px;width: 550px;alignment: right">
            <%=hogog.get(4).toString()%>     امتیاز مناطق کمتر توسعه یافته: <%=String.valueOf((hogog.get(4)*zarib))%> : مبلغ مناطق کمتر توسعه یافته<br><br>
            <hr style="height: 1px;width: 550px;alignment: right">
            <%=hogog.get(5).toString()%>              امتیاز بدی اب و هوا:  <%=String.valueOf((hogog.get(5)*zarib))%> : مبلغ بدی ابو هوا<br><br>
            <hr style="height: 1px;width: 550px;alignment: right">
            <%=hogog.get(6).toString()%>                  امتیاز ایثارگری:  <%=String.valueOf((hogog.get(6)*zarib))%> : مبلغ ایثارگری <br><br>
            <hr style="height: 1px;width: 550px;alignment: right">
            <%=hogog.get(7).toString()%>             امتیاز نشان های دولتی: <%=String.valueOf((hogog.get(7)*zarib))%> : مبلغ نشان های دولتی<br><br>
            <hr style="height: 1px;width: 550px;alignment: right">
            <%=hogog.get(8).toString()%>      امتیاز خدمت در مناطق جنگ زده: <%=String.valueOf((hogog.get(8)*zarib))%> : مبلغ خدمت در مناطق جنگ زده<br><br>
            <hr style="height: 1px;width: 550px;alignment: right">
            <%=hogog.get(9).toString()%>             امتیاز سختی شرایط کار: <%=String.valueOf((hogog.get(9)*zarib))%> : مبلغ سختی شرایط کار <br><br>
            <hr style="height: 1px;width: 550px;alignment: right">
            <%=hogog.get(10).toString()%>                امتیاز عایله مندی: <%=String.valueOf((hogog.get(10)*zarib))%> : مبلغ عایله مندی <br><br>
            <hr style="height: 1px;width: 550px;alignment: right">
            <%=hogog.get(11).toString()%>                امتیاز هزینه اولاد: <%=String.valueOf((hogog.get(11)*zarib))%> : مبلغ هزینه اولاد <br><br>
            <hr style="height: 1px;width: 550px;alignment: right">
            <%=hogog.get(12).toString()%>            امتیاز فوق العاده شغل: <%=String.valueOf((hogog.get(12)*zarib))%> : مبلغ فوق العاده شغل <br>
            <hr style="height: 1px;width: 550px;alignment: right">
            <%=String.valueOf((sumEmtiaz * zarib))%> :  مجموع
        </div>
        <br>
        <hr style="height: 4px;background-color: #1b1e21">
        <div class="birth-info" style="text-align: right">
             <%=birthInfo.get(0)%>:  ماه تولد<br><br>
            <hr style="height: 1px;width: 550px;alignment: right">
             <%=birthInfo.get(1)%>: تاریخ تولد<br><br>
            <hr style="height: 1px;width: 550px;alignment: right">
             <%=birthInfo.get(2)%>: مدرک<br><br>
            <hr style="height: 1px;width: 550px;alignment: right">
             <%=birthInfo.get(3)%>: رشته<br>
        </div>
        <br>
        <hr style="height: 4px;background-color: #1b1e21">
        <div class="forth-pane" style="text-align: right">
             <%=info.get(0)%>: سوابق خدمت<br><br>
            <hr style="height: 1px;width: 550px;alignment: right">
            <%=info.get(1)%> : واحد سازمانی<br><br>
            <hr style="height: 1px;width: 550px;alignment: right">
            <%=info.get(2)%>:  نوع حکم<br>
        </div>
        <br>
        <hr style="height: 4px;background-color: #1b1e21">
        <div class="isargari-and-marriage" style="text-align: right">
             <%=isargariInfo.get(0)%>: وضیعت ایثارگری<br><br>
            <hr style="height: 1px;width: 550px;alignment: right">
             <%=isargariInfo.get(1)%>: وضعیت تاهل<br><br>
            <hr style="height: 1px;width: 550px;alignment: right">
             <%=isargariInfo.get(2)%>: تعداد فرزند<br>
        </div>
        <br>
        <hr style="height: 4px;background-color: #1b1e21">
        <div class="shenasname-and-posrsazmani" style="text-align: right">
             <%=shenasnameAndPostSazmani.get(0)%> : عنوان پست<br><br>
            <hr style="height: 1px;width: 550px;alignment: right">
             <%=shenasnameAndPostSazmani.get(1)%>: شماره<br><br>
            <hr style="height: 1px;width: 550px;alignment: right">
             <%=shenasnameAndPostSazmani.get(2)%> : شماره شناسنامه<br><br>
            <hr style="height: 1px;width: 550px;alignment: right">
             <%=shenasnameAndPostSazmani.get(3)%> : استان صدور<br><br>
            <hr style="height: 1px;width: 550px;alignment: right">
             <%=shenasnameAndPostSazmani.get(4)%> : شهر صدور<br>
        </div>
    </div>
</body>
</html>
