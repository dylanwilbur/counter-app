var myVar = setInterval(myTimer, 1000);
    
function myTimer() {
  var d = new Date();
  document.querySelector("clock").innerHTML = d.toLocaleTimeString();
}
