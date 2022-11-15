const form  = document.getElementById('form');
const fname = document.getElementById("firstname");
const lname = document.getElementById("lastname");
const phnum = document.getElementById("phone");
const email = document.getElementById("email");
const password = document.getElementById("password");
const confirmPass = document.getElementById("confirm-password");
const fnameError = document.querySelector('#firstname + span.error');
const lnameError = document.querySelector('#lastname + span.error');
const phnumError = document.querySelector('#phone + span.error');
const emailError = document.querySelector('#email + span.error');
const passwordError = document.querySelector('#password + span.error');
const cpswdError = document.querySelector('#confirm-passwod + span.error');


form.addEventListener('submit', function (event) {
	
	if (fname.value=="" || fname.value==null) {
    	fnameError.textContent="Firstname is required.";
		event.preventDefault();
   	}
    else{
		fnameError.className = 'error active';	
	}
   	if(lname.value=="" || lname.value==null){
		
		lnameError.textContent="Lastname is required.";
		event.preventDefault();
	}
	else{
		lnameError.className = 'error active';	
	} 
	if(phnum.value=="" || phnum.value==null){
		
		phnumError.textContent="Phone number is required.";
		event.preventDefault();
	}
	else{
		phnumError.className = 'error active';	
	} 
	if(email.value=="" || email.value==null){
		
		emailError.textContent="Email ID is required.";
		event.preventDefault();
	}
	else{
		emailError.className = 'error active';	
	} 
	if(password.value=="" || password.value==null){
		
		passwordError.textContent="Password is required.";
		event.preventDefault();
	}
	else{
		passwordError.className = 'error active';	
	} 
	if(confirmPass.value=="" || confirmPass.value==null){
		
		cpswdError.textContent="Password doesn't match'";
		event.preventDefault();
	}
	else{
		cpswdError.className = 'error active';	
	} 
	
  	
  
});


