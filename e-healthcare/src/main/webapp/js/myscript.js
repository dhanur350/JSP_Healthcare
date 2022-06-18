
function validateNumber(evt){
	
	var e = evt || window.event;
	var Key = e.keycode || e.which;
	
	if(!e.shiftKey && !e.altKey && !e.ctrlKey &&

	//numbers
	Key>=48 && Key<=57 ||
	
	//Numeric Keypad
	Key>=96 && Key<=105 ||
	
	//backspace and tab and enter
	Key == 8 || Key == 9 || Key == 13 ||
	
	//Home and End
	Key == 35 || Key == 36 ||
	
	//left and right arrows 
	Key == 37 || Key == 39 ||
	
	//Del and Ins
	Key == 46 || Key ==45) {
		// Input is VALID
	}
	else{
		//input is INVALID
		e.returnValue = false;
		if(e.preventDefault) e.preventDefault();
		
	}
	
	
	
}


 
 