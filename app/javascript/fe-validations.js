function validateForm() {
  let returnval = true;

  const inputBody = document.querySelector('.form-text-body').value;
  let bodyError = document.querySelector('.body-error');

  const inputTitle = document.querySelector('.form-text').value;
  let titleError = document.querySelector('.title-error');

  const inputImage = document.querySelector('.image-field');
  let imageError= document.querySelector('.image-error');

  if (inputImage.files.length === 0) {
  	returnval = false;
		imageError.innerHTML = "Please provide the image";
  }

	if (inputBody.length < 10) {
		returnval = false;
		bodyError.innerHTML = "Body is too short [Minimum 10 characters required]";
  	}

	if (inputBody.trim() === '') {
		returnval = false;
		bodyError.innerHTML = "Body can't be blank";
	}

	if (inputTitle.trim() === '') {
		returnval = false;
		titleError.innerHTML = "Title can't be blank";
	}
	
  return returnval;
}


const fileName = document.querySelector('.file-name');
const fileInput = document.querySelector('.form-control-file');

fileInput.addEventListener('change', function(event) {
  const selectedFile = event.target.files[0];
  const fileNameValue = selectedFile ? selectedFile.name : '';
  fileName.textContent = fileNameValue;
});
