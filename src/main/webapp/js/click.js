'use strict';
let x;
let y;
let r;

function rIsChoosen() {

  r = document.getElementById("R-value").value;
   return validateR(r);
}

document.getElementById("graphic").onclick = function(event) {
  document.getElementById("graphic").getBoundingClientRect();

  if (rIsChoosen()) {
       x = parseFloat(((event.offsetX - 125)*r/90).toFixed(3));
       y = parseFloat((-(event.offsetY - 125)*r/90).toFixed(3));
      // console.log(x);
      // console.log(y);
      drawPoint(x, y, r);
      sendRequest(x, y, r);
  } else {
    alert("I can't check your point \n" +
        "Please check R ")
  }
}

function drawPoint(x, y, r) {
    var x1 = x*90/r+125;
    var y1 = -y*90/r+125;
    // alert ("x= "+ x + " y= "+ y + " R= " + r);
  var svgns = "http://www.w3.org/2000/svg",
  container = document.getElementById('graphic');
  var circle = document.createElementNS(svgns, 'circle');
  circle.setAttributeNS(null, 'cx', x1);
  circle.setAttributeNS(null, 'cy', y1);
  circle.setAttributeNS(null, 'r', 5);
  circle.setAttributeNS(null, 'style', 'fill: white; stroke: white; stroke-width: 1px;' );
  container.appendChild(circle);
}
function formatParams(params) {
    return "?" + Object
        .keys(params)
        .map(function (key) {
            return key + "=" + encodeURIComponent(params[key])
        })
        .join("&")
}

function sendRequest(x, y, r) {
    const params = {'x':x, 'y':y, 'r':r}
    window.location.replace("ControllerServlet" + formatParams(params));
}