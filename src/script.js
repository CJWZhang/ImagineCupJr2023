const form = document.querySelector('form');
const nameInput = document.getElementById('name');
const dobInput = document.getElementById

var petID = "Pet ID: 900023069003191";
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


document.addEventListener("DOMContentLoaded", function() {
    const video = document.getElementById("video-preview");
    const canvas = document.getElementById("canvas-preview");
    const captureButton = document.getElementById("capture-btn");
    let stream;
    let imageCapture;

    // Access the camera stream
    navigator.mediaDevices.getUserMedia({ video: true })
      .then(function(mediaStream) {
        stream = mediaStream;
        video.srcObject = mediaStream;
        video.onloadedmetadata = function() {
          video.play();
        };
        const track = mediaStream.getVideoTracks()[0];
        imageCapture = new ImageCapture(track);
        captureButton.style.display = "block";
      })
      .catch(function(error) {
        console.log("Camera access denied:", error);
      });

    // Capture image from video stream
    captureButton.addEventListener("click", function() {
      canvas.width = video.videoWidth;
      canvas.height = video.videoHeight;
      canvas.getContext("2d").drawImage(video, 0, 0, canvas.width, canvas.height);
      const imageUrl = canvas.toDataURL("image/png");
      
      // Create a link element with the captured image as the source
      const link = document.createElement("a");
      link.href = imageUrl;
      link.download = "captured_image.png";
      
      // Simulate a click on the link to trigger the download
      link.click();
    });

    // Stop camera access when leaving the page
    window.addEventListener("beforeunload", function() {
      if (stream) {
        stream.getTracks().forEach(function(track) {
          track.stop();
        });
      }
    });
  });