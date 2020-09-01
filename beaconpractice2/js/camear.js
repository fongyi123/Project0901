 var pictureSource;   // picture source
     var destinationType; // sets the format of returned value

      // Wait for device API libraries to load
      //
     document.addEventListener("deviceready",onDeviceReady,false);

     // device APIs are available
     //
     function onDeviceReady() {
         pictureSource=navigator.camera.PictureSourceType;
         destinationType=navigator.camera.DestinationType;
      }


     // 啟動相機拍攝照片, 並存入相片集(saveToPhotoAlbum: true)
     //
     function capturePhoto() {
       navigator.camera.getPicture(onSuccess, onFail, { quality: 50,
        destinationType: Camera.DestinationType.FILE_URI, saveToPhotoAlbum: true });
     }

      function onSuccess(imageURI) {
       var image = document.getElementById('largeImage');
       image.style.display = "block";
       image.src = imageURI;
      }

     // 讀取相片集
     function getPhoto(source) {
        // Retrieve image file location from specified source
        navigator.camera.getPicture(onPhotoURISuccess, onFail, { quality: 50,
         destinationType: destinationType.FILE_URI,
         sourceType: source });
     }
     function onPhotoURISuccess(imageURI) {
       var largeImage = document.getElementById('largeImage');
       largeImage.style.display = 'block';
        largeImage.src = imageURI;
     }


     // 拍攝或讀取相片錯誤
      function onFail(message) {
        alert('Failed because: ' + message);
      }
