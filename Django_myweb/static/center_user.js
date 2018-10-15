var imageUploadInput = document.querySelector('.upload-image__input');
var imageUploadPreview = document.querySelector('.upload-image__preview');

var fileReader = new FileReader();
var imageUploadInput = document.querySelector('.upload-image__input');
var imageUploadPreview = document.querySelector('.upload-image__preview');

var fileReader = new FileReader();

if (!window.fileReader) {
  alert('鎮ㄧ殑娴忚鍣ㄤ笉鏀寔鏂囦欢涓婁紶锛岃鍗囩骇鍒版渶鏂扮増Chrome娴忚鍣�');
}


fileReader.addEventListener('load', function(event) {
  imageUploadPreview.src = event.target.result;
});

imageUploadInput.addEventListener('change', function(event) {
  fileReader.readAsDataURL(event.target.files[0]);
});

if (!window.fileReader) {
  alert('鎮ㄧ殑娴忚鍣ㄤ笉鏀寔鏂囦欢涓婁紶锛岃鍗囩骇鍒版渶鏂扮増Chrome娴忚鍣�');
}


fileReader.addEventListener('load', function(event) {
  imageUploadPreview.src = event.target.result;
});

imageUploadInput.addEventListener('change', function(event) {
  fileReader.readAsDataURL(event.target.files[0]);
});
