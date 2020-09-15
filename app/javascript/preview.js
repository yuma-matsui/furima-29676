if (document.URL.match( /new/ ) || document.URL.match( /edit/ )) {
document.addEventListener('DOMContentLoaded', () => {
  const ImageList = document.getElementById('image-list');
 
  const createImageHTML = (blob) => {

    const imageElement = document.createElement('div');

    const blobImage = document.createElement('img');
    blobImage.setAttribute('src', blob);
    blobImage.setAttribute('style', "height: 180px")
    blobImage.setAttribute('style', "width: 120px")

    imageElement.appendChild(blobImage);
    ImageList.appendChild(imageElement);
  };

  document.getElementById('item-image').addEventListener('change', (e) => {
    const imageContent = document.querySelector('img');
    if (imageContent){
      imageContent.remove();
    }

    const file = e.target.files[0];
    const blob = window.URL.createObjectURL(file);

    createImageHTML(blob);
  });
});
}

