


window.onload = function(){
    /**@type {HTMLTableElement} */	
	let table = document.querySelector('#table');
	
	
	let h = new Hero(5,5);	
	let h1 = new Hero(15,15);	
	let h2 = new Hero(18,25);	
	let h3 = new Hero(10,10);	

	table.onclick = function(){
		h.target.focus();
	}
	
 
}

class Hero {
	static color =['Black', 'Red',  'Green', 'Yellow', 'Blue',  'Magenta','Cyan','White'];
	
	
	constructor(row , cell) {
	/**@type {HTML TableDataCellElement} */
	let target = table.rows[row].cells[cell];
	do{
	target.style.color = Hero.color[parseInt(Math.random()*8)];
	target.style.background =Hero.color[parseInt(Math.random()*8)];
	}while(target.style.color == target.style.background);
	target.innerText = String.fromCharCode(parseInt(Math.random()*26)+"A".charCodeAt(0));
	target.tabIndex =1;
	
	this.target = target;
		
	this.target.onkeydown = e => {
	this.keydown(e);
	  }
	  
	setInterval( () =>{  
		 
		 if(this.target.style.visibility =='visible')
		  this.target.style.visibility ='hidden';
		 else 
		  this.target.style.visibility ='visible';
	 
	 },Math.random()*500+10 );  
 }	

	/**@param {KeyboardEvent} e */	
	
	
	
	keydown(e){
		console.log(e.key);
		console.log(e);
		
		switch(e.key){
			
			case 'ArrowUp':	
				this.up();
				break;
			case 'ArrowDown':
				this.down();
				break;
			case 'ArrowLeft':
				this.left();
			   break;
			case 'ArrowRight':
				this.right();	
				break;
		}
		
		e.stopPropagation();
		if(e.key.startsWith("Arrow"))
			e.preventDefault();
	}
	
	up(){
		console.log("up");
		//let hero_left2 = hero.previousElementSibiling;
		
		let hero = this.target;
		let prow = hero.parentElement.previousElementSibling; 
		if(prow != null){
		
		let up =prow.cells[hero.cellIndex];
		let up_left = up.previousElementSibling;
		
		let hero_parent = hero.parentElement;
		let up_parent = up.parentElement
		
		up.remove();
		hero.remove();
		
		
		if(up_left == null){
			hero_parent.prepend(up);
			up_parent.prepend(hero);
			
		} else{
		
		up_left.after(hero);
		hero.parentElement.nextElementSibling.cells[hero.cellIndex].before(up);
		}
		
		hero.focus();
		}
	}	
	
	down(){
		console.log("down");
		let hero = this.target;
		let drow = hero.parentElement.nextElementSibling; 
		if(drow != null){
		
		let down =drow.cells[hero.cellIndex];
		let down_left = down.previousElementSibling;
		
		let hero_parent = hero.parentElement;
		let down_parent = down.parentElement
		
		down.remove();
		hero.remove();
		
		
		if(down_left == null){
			hero_parent.prepend(down);
			down_parent.prepend(hero);
			
		} else{
		
		down_left.after(hero);
		hero.parentElement.previousElementSibling.cells[hero.cellIndex].before(down);
		}
		
		hero.focus();
		}
	}
	
	left(){
		console.log("left");
		let hero = this.target;
		let hero_left = hero.previousElementSibling;
				
			if(hero_left != null){
			   hero_left.remove();
			   hero.after(hero_left);
		}
				
	}
	
	right(){
		console.log("right");
		let hero = this.target;
		let hero_right = hero.nextElementSibling;
				
			if(hero_right != null){
			   hero_right.remove();
			   hero.before(hero_right);
		}
	}
		
	}
	


