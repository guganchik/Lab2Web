<%@ page import="data.ResultRow" %>
<%@ page import="data.ResultList" %>
<%@ page import="java.util.Collections" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:useBean id="result" scope="session" class="data.ResultList" />
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon">
    <title>Lab2Web</title>




    <style>
        body {
            background-color:#000000;
        }
        /* --------------------------header-------------------------- */
        header {
            min-width: 1000px;
            word-spacing:0cm;
            text-align: center;
            margin: 0;
        }

        .headText{
            color: #C6C6C6;
            text-transform: uppercase;
            padding: 5px 24px;
            font-size: 11px;
            text-decoration: none;
            font-weight: normal;
            box-sizing: border-box;
            background: #000000;
            border: 0px;
            border-radius: 0%;
        }

        .headText:hover{
            background-color: #2f2f2f;
            color: #ffffff;
        }
        /* --------------------------header-------------------------- */
        .invisable {
            opacity: 0;
            pointer-events: none;
            position: absolute;
            display: inline;
        }

        .row1 {
            background-color: #1b1b1b;
            margin: 0px;
            max-width: 100%;
            height: auto;
            overflow:hidden
        }

        .logo {
            margin-top: 3px;
            margin-left: 100px;
            float:left;
            width: 150px;
        }

        .valueY {
            margin-top: 14px;
            float:left;
            width: 140px;
            font-size:14pt;
        }

        .lupaY {
            margin-top: 0px;
            outline: none;
            border: none;
            color: #fff;
            background-color: #252525;
            border-radius: 2px;
        }
        .lupa {
            margin-top: 2px;
            float:left;
        }

        .textY {
            margin: 0px;
            outline: none;
            border: none;
            color: #fff;
            background-color: #252525;
            border-radius: 2px;
        }

        .paramY{
            background-color: #252525;
            border-radius: 3px;
        }

        .lableY {
            margin-left: 4px;
            color:#7c7c7c;
            font-size: 12px;
        }

        .lableX{
            color: #7c7c7c;
            padding: 5px 24px;
            font-size: 11px;
            text-decoration: none;
            font-weight: normal;
            box-sizing: border-box;
            background: #252525;
            border: 0px;
            border-radius: 10%;
            height: 10px;
        }

        .valueX {
            margin-top: 10px;
            margin-left: 50px;
            float:left;
            font-size:14pt;
        }

        #spanX{
            background: #252525;
            width: 200px;
            width: 100px;
            border-radius: 5px;
        }
        #X-value{
            color: #7c7c7c;
            background: #25252500;
            border: 0px;
            border-radius: 100%;
            width: 20px;
        }

        .x {
            margin-left: 30px;
            color: #7c7c7c;
            background: #252525;
            border: 0px;
            border-radius: 20%;
            width: 30px;
            height: 20px;
        }

        .err{
            margin-top: 10px;
            margin-left: 50px;
            float:left;
            font-size:14pt;
        }
        #errX{
            color: red;
        }
        #errY {
            color: red;
        }
        #errR {
            color: red;
        }
        #errEnd {
            color: red;
        }

        .valueR {
            margin-top: 20px;
            margin-left:400px;
        }

        #spanR{
            background: #252525;
            width: 250px;
            width: 100px;
            border-radius: 5px;
            margin-left: 20px;
        }

        .lableR{
            color: #7c7c7c;
            padding: 5px 24px;
            font-size: 11px;
            text-decoration: none;
            font-weight: normal;
            box-sizing: border-box;
            background: #252525;
            border: 0px;
            border-radius: 10%;
            height: 10px;
        }

        #R-value{
            color: #7c7c7c;
            background: #25252500;
            border: 0px;
            border-radius: 100%;
            width: 30px;
        }

        .r {
            display: inline-block;
            cursor: pointer;
            padding: 0px 10px;
            line-height: 30px;
            border: 1px solid #2f2f2f;
            background: #1b1b1b;
            border-radius: 20px;
            transition: background 0.2s ease;
            color: #ffffff;
            font-size: small;
            font-weight:bold;
            font-family:Arial, Helvetica, sans-serif;
            margin-left: 50px;
        }

        .r:hover {
            background: #2f2f2f;
        }

        .sendForm {
            display: inline-block;
            cursor: pointer;
            padding: 0px 10px;
            line-height: 30px;
            border: 1px solid #2f2f2f;
            background: #1b1b1b;
            border-radius: 20px;
            transition: background 0.2s ease;
            color: #ffffff;
            font-size: small;
            font-weight:bold;
            font-family:Arial, Helvetica, sans-serif;
            margin-left: 50px;
        }

        .sendForm:hover {
            background: #2f2f2f;
        }
        .goalGrafic{
            margin-top: 10px;
            border-radius: 60px;
            border-color: #2f2f2f;
            background-color:#2f2f2f;
        }

        .goal{
            text-align: center;
        }

        .goaltxt{
            text-align: center;
            margin-top: 10px;
        }

        .txt {
            font-size: 15px;
            color: #fff;
            font-family: Arial, Helvetica, sans-serif;
            font-weight:lighter
        }

        .txt:hover {
            font-size: 15px;
            color: #ff6600;
            font-family: Arial, Helvetica, sans-serif;
            font-weight:lighter
        }


        a {
            text-decoration: none;
            font-size: 15px;
            color: #fff;
            font-family: Arial, Helvetica, sans-serif;
            font-weight:lighter
        }


        a:link {
            font-size: 15px;
            color: #ff6600;
            font-family: Arial, Helvetica, sans-serif;
            font-weight:lighter
        }

        a:hover {
            color: #ff6600;
        }

        table {
            overflow-x: auto;
            margin:auto;
            font-family:Arial, Helvetica, sans-serif;
            font-weight: bold;
            text-align: left;
            border-collapse: separate;
            border-spacing: 5px;
            background: #000000;
            color: #000000;
            border: 16px solid #000000;
            border-radius: 20px;

        }
        th {
            font-size: 18px;
            padding: 10px;

        }
        td {
            background: #ff6600;
            padding: 10px;
            border-radius: 16px;
        }

        .resultbody {
            bottom: 0;
            right: 0;
            top: 400px;
            position: absolute;
            width: 100%;
            overflow-y: scroll;
        }

        /* Hide scrollbar for Chrome, Safari and Opera */
        .resultbody::-webkit-scrollbar {
            display: none;
        }

        /* Hide scrollbar for IE, Edge and Firefox */
        .resultbody {
            -ms-overflow-style: none;  /* IE and Edge */
            scrollbar-width: none;  /* Firefox */
        }

    </style>

</head>
<body>
<header>
    <button class="headText">Komlev</button>
    <button class="headText">Igor</button>
    <button class="headText">Vladimirovich</button>
    <button class="headText">P32111</button>
    <button class="headText">V-114987</button>
</header>
<main>
    <div>
        <form id="input" action="ControllerServlet">
            <div class="row1">
                <div class="logo">
                    <img width="125" height="40" src="img/nick.png">
                </div>
                <div class = "valueY">
                    <div class="lupaY">
                        <div class="lupa">
                            <img width="14" height="14" src="img/lupa.png">
                        </div>
                        <input class="textY" type="text" name="y" id = "Y-value" size="13" maxlength="20" placeholder="Enter Y (-3<Y<3)" autocomplete="off"/>

                    </div>
                </div>
                <div class = "valueX">
							<span id="spanX">
								<button class="lableX" type="button">Choose X:</button>
							<input id="X-value" name="x" type="text" value="" disabled/>
							</span>


                    <button class="x" data-x="-5" type="button">-5</button>
                    <button class="x" data-x="-4" type="button">-4</button>
                    <button class="x" data-x="-3" type="button">-3</button>
                    <button class="x" data-x="-2" type="button">-2</button>
                    <button class="x" data-x="-1" type="button">-1</button>
                    <button class="x" data-x="0" type="button">0</button>
                    <button class="x" data-x="1" type="button">1</button>
                    <button class="x" data-x="2" type="button">2</button>
                    <button class="x" data-x="3" type="button">3</button>

                    <span id="spanR">
								<button class="lableR" type="button">Your R:</button>
							<input id="R-value" name="r" type="text" value="" disabled/>
							</span>

                </div>
                <div class="err">
                    <span id="errX"></span>
                    <span id="errY"></span>
                    <span id="errR"></span>
                    <span id="errEnd"></span>
                </div>
            </div>
            <div class = "valueR">
                <button class="r" data-r="1" type="button">R = 1</button>
                <button class="r" data-r="1.5" type="button">R = 1.5</button>
                <button class="r" data-r="2" type="button">R = 2</button>
                <button class="r" data-r="2.5" type="button">R = 2.5</button>
                <button class="r" data-r="3" type="button">R = 3</button>
                <button class="sendForm" type="submit">Check!</button>
            </div>

        </form>

        <div class = "goal">
            <svg id="graphic" class="goalGrafic" width="250" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" height="250">

                <polygon points="125,125 215,125 215,215 125,215"
                         fill="orange" fill-opacity="1" stroke-width="0"></polygon>

                <path d="M 35 125 A 90 90 90 0 0 125 215 L 125 125 Z"
                      fill="orange" fill-opacity="1" stroke-width="0"></path>

                <polygon points="125,125 125,35 170,125"
                         fill="orange" fill-opacity="1" stroke-width="0"></polygon>

                <line x1="0" x2="250" y1="125" y2="125" stroke="black"></line>
                <line x1="125" x2="125" y1="0" y2="250" stroke="black"></line>
                <polygon points="125,0 120,10 130,10" stroke="black"></polygon>
                <polygon points="250,125 240,130 240,120" stroke="black"></polygon>

                <line x1="170" x2="170" y1="130" y2="120" stroke="black"></line>
                <line x1="215" x2="215" y1="130" y2="120" stroke="black"></line>

                <line x1="80"  x2="80"  y1="130" y2="120" stroke="black"></line>
                <line x1="35" x2="35" y1="130" y2="120" stroke="black"></line>

                <line x1="130" x2="120" y1="170" y2="170" stroke="black"></line>
                <line x1="130" x2="120" y1="215"  y2="215"  stroke="black"></line>

                <line x1="130" x2="120" y1="80" y2="80" stroke="black"></line>
                <line x1="130" x2="120" y1="35" y2="35" stroke="black"></line>

                <text x="240" y="115">x</text>
                <text x="135" y="10">y</text>

                <text x="160" y="115">R/2</text>
                <text x="210" y="115">R</text>

                <text x="30" y="115" >-R</text>
                <text x="80" y="115">-R/2</text>

                <text x="130" y="80">R/2</text>
                <text x="130" y="40">R</text>

                <text x="130" y="172">-R/2</text>
                <text x="130" y="220">-R</text>
            </svg>
        </div>
        <div class="goaltxt">
            <span class="txt"><a href="https://t.me/guganchik"> Can you get inside?</a></span>
        </div>
        <%  if(result.getStatus() == 1) {%>
        <script>document.getElementById("errEnd").textContent="Error processing request!";</script>
        <%} else{%>
        <script>document.getElementById("errEnd").textContent="";</script>
        <%}%>
        <div class="resultbody" id="outputContainer">
                        <table class="resultTable">
                            <tr>
                                <td class="cellNum">№</td>
                                <td class="cellNum">X</td>
                                <td class="cellNum">Y</td>
                                <td class="cellNum">R</td>
                                <td class="cellRes">Result</td>
                                <td class="cellTime">Working time</td>
                                <td class="cellTime">Current time</td>
                            </tr>
                            <tbody>
                            <%
                                for (ResultRow row : result.getRows()) {
                            %>
                            <tr>
                                <td class="table-text"><%=row.getId()%></td>
                                <td class="table-text"><%=row.getX()%></td>
                                <td class="table-text"><%=row.getY()%></td>
                                <td class="table-text"><%=row.getR()%></td>
                                <td class="table-text"><%=row.getIsHit()%></td>
                                <td class="table-text"><%=row.getWorkTime() + "ms"%> </td>
                                <td class="table-text"><%=row.getCurrentTime()%></td>
                            </tr>
                            <% } %>
                            </tbody>
                        </table>

        </div>
    </div>
</main>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src = "js/click.js"></script>
<%
    for (ResultRow row : result.getRows()) {
%>
<script> drawPoint(<%=row.getX()%>, <%=row.getY()%>, <%=row.getR()%>)</script>
<% } %>
<script src = "js/validator.js"></script>
</body>
<html>


