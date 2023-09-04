


window.onload = function(){
    /**@type {HTMLTableElement} */	
	let table = document.querySelector('#table');
	
	
	let h = new Hero();	

	table.onclick = function(){
		h.target.focus();
	}
	
 
}

class Hero {
	
	constructor() {
	/**@type {HTML TableDataCellElement} */
	let target = table.rows[10].cells[20];
	target.style.color = 'blue';
	target.style.background = 'white';
	target.innerText = '@';
	target.tabIndex =1;
	
	this.target = target;
		
	this.target.onkeydown = e => {
	this.keydown(e);
	 
	  }
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
		hero.parentElement.nextElementSibling.cells[hero.cellIndex].after(up);
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
		hero.parentElement.previousElementSibling.cells[hero.cellIndex].after(down);
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
	


