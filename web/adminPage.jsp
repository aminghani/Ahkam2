<%@ page import="Database.ZaribTable" %>
<%@ page import="Database.PersonalInfoTable" %>
<%@ page import="Database.FeedbackTable" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>--%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
   <%-- <link rel="stylesheet" href="css/adminPageStyle/adminstyle.css">--%>
    <style>
        body{
            background-color: #9fcdff;
        }

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

        .add-employee {
            background-color: #7abaff;
            position: absolute;
            top: 200px;
            left: 400px;
            justify-content: space-between;
            width: 800px;
            padding: 30px;
            margin-right: 30px;
            margin-bottom: 30px;
        }

        /*.remove-employee {
            background-color: #7abaff;
            position: absolute;
            top: 200px;
            left: 400px;
            justify-content: space-between;
            width: 800px;
            padding: 30px;
            margin-right: 30px;
            margin-bottom: 30px;
        }*/

        .change-zarib {
            background-color: #7abaff;
            position: absolute;
            top: 200px;
            left: 400px;
            justify-content: space-between;
            width: 800px;
            padding: 30px;
            margin-right: 30px;
            margin-bottom: 30px;
        }

        /*.remove-form {
            background-color: #7abaff;
            position: absolute;
            top: 200px;
            left: 400px;
            justify-content: space-between;
            width: 800px;
            padding: 30px;
            margin-right: 30px;
            margin-bottom: 30px;
        }*/


    </style>
</head>
<body>
    <div class="header-admin" style="position: absolute;top: 0px;right: 0px;width: 85.8%;height: 100px;text-align:right;background-color: #86cfda;padding: 10px;z-index: 2">
        <br>
        <p id="datetime"></p>
        <br>
    </div>
    <div class="right-bar" style="position: absolute;top: 100px;right: 0px;height: 200%;width: 200px;background-color: #43e3b0;text-align: right;padding: 25px;z-index: 1">
        <br>
        <p style="font-size: 18px">صفحه ادمین سیستم</p>
        <br>
        <br>
        <hr>
        <br>
        <%
            PersonalInfoTable personalInfo = new PersonalInfoTable();
            int count = personalInfo.getRecordCounts();
        %>
        <h4><%=count%></h4>: تعداد کل کارمندان
    </div>
    <div id="mySidebar" class="sidebar">
        <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
        <a href="#" id="add-employee-btn">Add Employee</a>
        <a href="#" id="remove-employee-btn">Remove Employee</a>
        <a href="#" id="inc-btn">Clients</a>
        <a href="#" id="kosor-btn">update Kosor</a>
        <a href="#" id="feedback-btn">Show feedbacks</a>
    </div>

    <div id="main">
        <button class="openbtn" onclick="openNav()">&#9776; Open Sidebar</button>
    </div>
    <script>
        window.setInterval(function(){
            var dt = new Date();
            document.getElementById("datetime").innerHTML = dt.toLocaleString();
        }, 1000);

    </script>
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
        addemployeebtn = document.getElementById("add-employee-btn")
        addemployeebtn.addEventListener("click" , () => {
            document.querySelector(".add-employee").style.visibility  = "visible";
            document.querySelector(".remove-employee").style.visibility = "hidden";
            document.querySelector(".change-zarib").style.visibility = "hidden";
            document.querySelector(".kosor-update").style.visibility = "hidden";
            document.querySelector(".feedback").style.visibility = "hidden";
        })
        removeemployeebtn = document.getElementById("remove-employee-btn");
        removeemployeebtn.addEventListener("click" , () => {
            document.querySelector(".remove-employee").style.visibility = "visible";
            document.querySelector(".add-employee").style.visibility  = "hidden";
            document.querySelector(".change-zarib").style.visibility = "hidden";
            document.querySelector(".kosor-update").style.visibility = "hidden";
            document.querySelector(".feedback").style.visibility = "hidden";
        })
        zaribinc = document.getElementById("inc-btn");
        zaribinc.addEventListener("click" , () => {
            document.querySelector(".change-zarib").style.visibility = "visible";
            document.querySelector(".remove-employee").style.visibility = "hidden";
            document.querySelector(".add-employee").style.visibility  = "hidden";
            document.querySelector(".kosor-update").style.visibility = "hidden";
            document.querySelector(".feedback").style.visibility = "hidden";
        })
        kosor = document.getElementById("kosor-btn");
        kosor.addEventListener("click" , () => {
            document.querySelector(".kosor-update").style.visibility = "visible";
            document.querySelector(".change-zarib").style.visibility = "hidden";
            document.querySelector(".remove-employee").style.visibility = "hidden";
            document.querySelector(".add-employee").style.visibility  = "hidden";
            document.querySelector(".feedback").style.visibility = "hidden";
        })
        feedback = document.getElementById("feedback-btn");
        feedback.addEventListener("click" , () => {
            document.querySelector(".feedback").style.visibility = "visible";
            document.querySelector(".kosor-update").style.visibility = "hidden";
            document.querySelector(".change-zarib").style.visibility = "hidden";
            document.querySelector(".remove-employee").style.visibility = "hidden";
            document.querySelector(".add-employee").style.visibility  = "hidden";
        })
    </script>
    <div class="feedback" style="visibility: hidden;position: absolute;top: 150px;left: 500px;background-color: #007bff;
    border: 3px #0c5460 solid;margin: 35px;padding: 35px;text-align: right;width: 400px;color: white">
        <%
            FeedbackTable feedbackTable = new FeedbackTable();
            List<String> feedbacks = feedbackTable.readBody();
            List<Integer> ids = feedbackTable.readids();
            for(int i = 0;i<feedbacks.size();i++){
                out.print(ids.get(i) + " - "+feedbacks.get(i)+"____");
                out.print("\t\t\t\t");
            }
        %>

    </div>
    <div class="change-zarib" style="visibility: hidden;position: absolute;top: 100px;left: 550px;background-color: #007bff;border: 3px #0c5460 solid;margin: 35px;padding: 35px;text-align: right">
        <form class="zarib-inc" method="post" action="ZaribInc">
            <input type="number" name="amount" placeholder="مقدار افزایش"><br><br>
            <hr style="height: 1px;width: 750px;alignment: right">
            <input type="number" name="level" placeholder="سطح مستخدم"><br><br>
            <hr style="height: 1px;width: 750px;alignment: right">
            <input type="date" name="date" placeholder="تاریخ"><br><br>
            <hr style="height: 1px;width: 750px;alignment: right">
            <input type="submit" value="افزایش ضریب">
            <h4>level 1 : <%=String.valueOf(new ZaribTable().getCurrentZarib(1))%></h4>
            <h4>level 2 : <%=String.valueOf(new ZaribTable().getCurrentZarib(2))%></h4>
            <h4>level 3 : <%=String.valueOf(new ZaribTable().getCurrentZarib(3))%></h4>
            <h4>level 4 : <%=String.valueOf(new ZaribTable().getCurrentZarib(4))%></h4>
            <h4>level 5 : <%=String.valueOf(new ZaribTable().getCurrentZarib(5))%></h4>
        </form>
    </div>
    <div class="remove-employee" style="visibility: hidden;position: absolute;top: 20%;left: 40%;background-color: #0051ff;border: 3px #0c5460 solid;margin: 35px;padding: 35px;height: 150px">
        <form action="Remove" method="post">
            <input id="idd" type="number" name="id" placeholder="ایدی">
            <br>
            <hr>
            <br>
            <input type="submit" value="حذف">
        </form>
    </div>
    <div class="kosor-update" style="visibility: hidden;position: absolute;top: 100px;left: 550px;background-color: #007bff;border: 3px #0c5460 solid;margin: 25px;padding: 35px;text-align: right">
        <form action="Updatemaliat" method="post">
            <input type="number" name="maliat" placeholder="مقدار جدید مالیات"><br><br>
            <input type="submit" value="به روز رسانی">
        </form>
        <br><br>
        <hr style="height: 1px;width: 750px;alignment: right">
        <form action="Updatebimetaminejtemai" method="post">
            <input type="number" name="bimetaminejtemai" placeholder="مقدار جدید بیمه تامین اجتماعی"><br><br>
            <input type="submit" value="به روز رسانی">
        </form>
        <br><br>
        <hr style="height: 1px;width: 750px;alignment: right">
        <form action="Updateozviatsandogtavon" method="post">
            <input type="number" name="ozviatsandogtavon" placeholder="مقدار جدید عضویت صندوق تعاون"><br><br>
            <input type="submit" value="به روز رسانی">
        </form>
        <br><br>
        <hr style="height: 1px;width: 750px;alignment: right">
        <form action="Updatebimetakmili" method="post">
            <input type="number" name="bimetakmili" placeholder="مقدار جدید بیمه تکمیلی"><br><br>
            <input type="submit" value="به روز رسانی">
        </form>
    </div>
    <div class="add-employee" style="visibility: hidden;position: absolute;top: 100px;left: 550px;background-color: #007bff;border: 3px #0c5460 solid;margin: 35px;
        padding: 35px;text-align: right">
        <form class="employee-form" action="AddEmployee" method="post">
            <input type="text" id="vaziatIsargari" name="vaziatIsargari" placeholder= " وضیعت ایثاارگری" size="40"><br>
            <hr style="height: 1px;width: 750px;alignment: right">
            <input type="text" id="raste" name="raste" placeholder="رسته" size="40"><br>
            <hr style="height: 1px;width: 750px;alignment: right">
            <input type="text" id="reshteShoghli" name="reshteShoghli" placeholder="رشته شغلی" size="40"><br>
            <hr style="height: 1px;width: 750px;alignment: right">
            <input type="number" id="tabageShoghl" name="tabageShoghl" placeholder="طبقه شغل" size="40"><br>
            <hr style="height: 1px;width: 750px;alignment: right">
            <input type="number" id="satheShoghl" name="satheShoghl" placeholder="سطح شغل" size="40"><br>
            <hr style="height: 1px;width: 750px;alignment: right">
            <input type="text" id="rotbe" name="rotbe" placeholder="رتبه" size="40"><br>
            <hr style="height: 1px;width: 750px;alignment: right">
            <input type="text" id="mahaleTavalod" name="mahaleTavalod" placeholder="محل تولد" size="40"><br>
            <hr style="height: 1px;width: 750px;alignment: right">
            <input type="text" id="tarikhTavalod" name="tarikhTavalod" placeholder="تاریخ تولد" size="40"><br>
            <hr style="height: 1px;width: 750px;alignment: right">
            <input type="text" id="madrak" name="madrak" placeholder="مدرک" size="40"><br>
            <hr style="height: 1px;width: 750px;alignment: right">
            <input type="text" id="reshte" name="reshte" placeholder="رشته" size="40"><br>
            <hr style="height: 1px;width: 750px;alignment: right">
            <input type="number" id="hageShoghl" name="hageShoghl" placeholder="حق شغل" size="40"><br>
            <hr style="height: 1px;width: 750px;alignment: right">
            <input type="number" id="hageModiriat" name="hageModiriat" placeholder="حق مدیریت" size="40"><br>
            <hr style="height: 1px;width: 750px;alignment: right">
            <input type="number" id="hageShaghl" name="hageShaghl" placeholder="حق شاغل" size="40"><br>
            <hr style="height: 1px;width: 750px;alignment: right">
            <input type="number" id="tafavotTatbig" name="tafavotTatbig" placeholder="تفاوت تطبیق" size="40"><br>
            <hr style="height: 1px;width: 750px;alignment: right">
            <input type="number" id="manategKamtarToseeYefte" name="manategKamtarToseeYefte" placeholder="مناطق کمتر توسعه یافته" size="40"><br>
            <hr style="height: 1px;width: 750px;alignment: right">
            <input type="number" id="badiAboHava" name="badiAboHava" placeholder="بدی ابو هوا" size="40"><br>
            <hr style="height: 1px;width: 750px;alignment: right">
            <input type="number" id="isargari" name="isargari" placeholder="ایثارگری" size="40"><br>
            <hr style="height: 1px;width: 750px;alignment: right">
            <input type="number" id="neshanHayeDolati" name="neshanHayeDolati" placeholder="نشان های دولتی" size="40"><br>
            <hr style="height: 1px;width: 750px;alignment: right">
            <input type="number" id="manategMahrom" name="manategMahrom" placeholder="مناطق محروم" size="40"><br>
            <hr style="height: 1px;width: 750px;alignment: right">
            <input type="number" id="sakhtiKar" name="sakhtiKar" placeholder="سختی کار" size="40"><br>
            <hr style="height: 1px;width: 750px;alignment: right">
            <input type="number" id="hageAyelemandi" name="hageAyelemandi" placeholder="حق عتیله مندی" size="40"><br>
            <hr style="height: 1px;width: 750px;alignment: right">
            <input type="number" id="hageOlad" name="hageOlad" placeholder="حق اولاد" size="40"><br>
            <hr style="height: 1px;width: 750px;alignment: right">
            <input type="number" id="fogoladeShoghl" name="fogoladeShoghl" placeholder="فوق العاهده شغل" size="40"><br>
            <hr style="height: 1px;width: 750px;alignment: right">
            <input type="text" id="shahrestanKhedmat" name="shahrestanKhedmat" placeholder="شهرستان خدمت" size="40"><br>
            <hr style="height: 1px;width: 750px;alignment: right">
            <input type="text" id="ostanKhedmat" name="ostanKhedmat" placeholder="استان خدمت" size="40"><br>
            <hr style="height: 1px;width: 750px;alignment: right">
            <input type="text" id="noeEstekhdam" name="noeEstekhdam" placeholder="نوع استخدام" size="40"><br>
            <hr style="height: 1px;width: 750px;alignment: right">
            <input type="text" id="vaziatTahol" name="vaziatTahol" placeholder="وضعیت تاهل" size="40"><br>
            <hr style="height: 1px;width: 750px;alignment: right">
            <input type="number" id="tedadFarzand" name="tedadFarzand" placeholder="تعداد فرزند" size="40"><br>
            <hr style="height: 1px;width: 750px;alignment: right">
            <input type="text" id="nam" name="nam" placeholder="نام" size="40"><br>
            <hr style="height: 1px;width: 750px;alignment: right">
            <input type="text" id="nameKhanevadegi" name="nameKhanevadegi" placeholder="نام خانوادگی" size="40"><br>
            <hr style="height: 1px;width: 750px;alignment: right">
            <input type="text" id="namePedar" name="namePedar" placeholder="نام پدر" size="40"><br>
            <hr style="height: 1px;width: 750px;alignment: right">
            <input type="text" id="shomaremeli" name="shomaremeli" placeholder="شماره ملی" size="40"><br>
            <hr style="height: 1px;width: 750px;alignment: right">
            <input type="text" id="shomareMostakhdem" name="shomareMostakhdem" placeholder="شماره مستخدم" size="40"><br>
            <hr style="height: 1px;width: 750px;alignment: right">
            <input type="text" id="password" name="password" placeholder="رمز عبور" size="40"><br>
            <hr style="height: 1px;width: 750px;alignment: right">
            <input type="text" id="onvanPost" name="onvanPost" placeholder="عنوتن پست" size="40"><br>
            <hr style="height: 1px;width: 750px;alignment: right">
            <input type="number" id="shomare" name="shomare" placeholder="شماره" size="40"><br>
            <hr style="height: 1px;width: 750px;alignment: right">
            <input type="text" id="shomareShenasname" name="shomareShenasname" placeholder="شماره شناسنامه" size="40"><br>
            <hr style="height: 1px;width: 750px;alignment: right">
            <input type="text" id="shaheSodor" name="shaheSodor" placeholder="شهر صدور" size="40"><br>
            <hr style="height: 1px;width: 750px;alignment: right">
            <input type="text" id="ostanSodor" name="ostanSodor" placeholder="استان صدور" size="40"><br>
            <hr style="height: 1px;width: 750px;alignment: right">
            <input type="text" id="savabegKhedmat" name="savabegKhedmat" placeholder="سوابق خدمت" size="40"><br>
            <hr style="height: 1px;width: 750px;alignment: right">
            <input type="text" id="vahedSazmani" name="vahedSazmani" placeholder="واحد سازمانی" size="40"><br>
            <hr style="height: 1px;width: 750px;alignment: right">
            <input type="text" id="noeHokm" name="noeHokm" placeholder="نوع حکم" size="40"><br>
            <hr style="height: 1px;width: 750px;alignment: right">
            <input id="submit-btn" type="submit" value="ثبت نهایی">
        </form>
    </div>
</body>
</html>