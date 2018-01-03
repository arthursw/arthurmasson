let index = 0;
let titleString = 'ArthurMasson';
let length = 8;

let changeTitle = function() {
	let title = document.getElementById('title');
	if(title != null) {
		// let newString = ''
		// let copy = titleString.split('')
		// for(let i=0 ; i<titleString.length ; i++) {
		// 	let char = copy.splice(Math.floor(Math.random()*copy.length), 1)
		// 	newString += char
		// }
		// console.log(newString)
		// title.innerHTML = newString;
		
		// title.innerHTML = titleString.substring(index, index + length) + titleString.substring(0, index + length - titleString.length);
		// index++;
		// if(index >= titleString.length) {
		// 	index = 0;
		// } 

		let triangle = '&#9650';
		let circle = '&#9679';
		let square = '&#9632';

		title.innerHTML = index > 0 ? circle + square + 'AM' + square + circle : square + circle + 'AM' + circle + square;
		index = index > 0 ? 0 : 1;
	}
}

setInterval(changeTitle, 1000);

document.addEventListener("click", function(event) {
	if(event.target.tagName.toLowerCase() == 'video') {
		if(event.target.currentTime == 0) {
			event.target.play();
		} else {
			event.target.pause();
			event.target.currentTime = 0;
		}
	}
});