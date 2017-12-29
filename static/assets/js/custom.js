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
		title.innerHTML = index > 0 ? '&#9679;&#9632;AM&#9632;&#9679;' : '&#9632;&#9679;AM&#9679;&#9632;';
		index = index > 0 ? 0 : 1;
	}
}

setInterval(changeTitle, 1000);