const form = document.querySelector('form');
const nameInput = document.getElementById('name');
const dobInput = document.getElementById

var petID = "Pet ID: 007";
document.getElementById("petID").innerHTML = petID;


var dob = "Date of Birth: June 1, 2022";
document.getElementById("dob").innerHTML = dob;


var gender = "Gender: M";
document.getElementById("gender").innerHTML = gender;


// get signature from user
var canvas = document.getElementById("signature-canvas");
var ctx = canvas.getContext("2d");
var isDrawing = false;
var lastX, lastY;

canvas.addEventListener("mousedown", startDrawing);
canvas.addEventListener("mousemove", draw);
canvas.addEventListener("mouseup", stopDrawing);
canvas.addEventListener("mouseout", stopDrawing);

function startDrawing(e) {
    isDrawing = true;
    [lastX, lastY] = [e.offsetX, e.offsetY];
}

function draw(e) {
    if (!isDrawing) return;
    ctx.beginPath();
    ctx.moveTo(lastX, lastY);
    ctx.lineTo(e.offsetX, e.offsetY);
    ctx.stroke();
    [lastX, lastY] = [e.offsetX, e.offsetY];
}

function stopDrawing() {
    isDrawing = false;
}

function clearSignature() {
    ctx.clearRect(0, 0, canvas.width, canvas.height);
}

function saveSignature() {
    var dataURL = canvas.toDataURL();
    console.log(dataURL);
    // send dataURL to backend for processing
}


// submit insurance amount

function submitInsurance() {

    var amountInsurance = "Amount: " + document.getElementById("amountInsurance").value;
    var coverageDuration = "Duration: " + document.getElementById("duration").value;
    document.getElementById("amountA").innerHTML = amountInsurance;

    
}
