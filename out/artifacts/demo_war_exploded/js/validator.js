"use strict";

var click;

function xButton(e){
  document.getElementById("X-value").value = e.target.dataset.x
}
const xButtons = document.getElementsByClassName('x');
Array.from(xButtons).forEach(b=>b.addEventListener('click', xButton));

function rButton(e){
  document.getElementById("R-value").value = e.target.dataset.r
}
const rButtons = document.getElementsByClassName('r');
Array.from(rButtons).forEach(b=>b.addEventListener('click', rButton));

const formElement = document.getElementById('input');
const dataStorage = [];



function getFormElement(event) {
  event.preventDefault();
  const valX = document.getElementById('X-value').value;
  const valY = document.getElementById('Y-value').value;
  const valR = document.getElementById('R-value').value;
  if(validator(valX, valY, valR)){
    sendRequest(valX, valY, valR);
    drawPoint(valX, valY, valR);
    // console.log(valX);
    // console.log(valY);
    // console.log(valR);
    // console.log(click);
  }
}
formElement.addEventListener('submit', getFormElement);

function validator(x, y, r){
  return validateX(x) && validateY(y) && validateR(r);
}

function validateX(x){
  if(x == -5 || x == -4 || x == -3 || x == -2 || x == -1 || x == 0 || x == 1 || x == 2 || x == 3) {
    document.getElementById("errX").textContent="";
    return true;
  }
  document.getElementById("errX").textContent="invalid X";
  return false;
}

function validateY(y){
  // return true;
  const maxY = 3;
  const minY = -3;
  if(isNaN(y) || y>=maxY || y<=minY || y == "") {
    document.getElementById("errY").textContent="invalid Y";
    // alert ("please enter -3<Y<3");
    return false;
  } else {
    document.getElementById("errY").textContent="";
    return true;}
}

function validateR(r){
  if(r == 1 || r == 1.5 || r == 2 || r == 2.5 || r == 3) {
    document.getElementById("errR").textContent="";
    return true;
  }
  document.getElementById("errR").textContent="invalid R";
  return false;
}