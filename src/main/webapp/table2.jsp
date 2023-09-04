<%@page import="javax.swing.text.Document"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AlphacursorMove</title>
<style type="text/css">
#table{
 font-family: monospace;
 font-size: 3em;
 border-collapse: collapse;
}

:focus{
	outline: red;
	outline-style: dotted;
}


</style>

<script type="text/javascript">
window.onload = ()=>{
	let t = document.querySelector('table');
	let hero = t.rows[10].cells[20];
	
	hero.style.color = 'red'
	hero.style.background = 'white';
//	hero.style.removeProperty('background');
	hero.innerText = '@';
	hero.tabIndex = 1;
	
	
	t.onclick = ()=>{ 
		hero.focus();
	}
	
	hero.onkeydown = (e) => {
		console.log(e);
		switch(e.key){
		case 'ArrowUp':
			let prow = hero.parentElement.previousElementSibling;
			if(prow != null){
				let up = prow.cells[hero.cellIndex];
				let up_left = up.previousElementSibling
				let hero_left2 = hero.previousElementSibling;
				
				let hero_parent = hero.parentElement
				let up_parent = up.parentElement
				
				hero.remove();
				up.remove();
			
				if(hero_left2 == null){
					hero_parent.prepend(up);
					up_parent.prepend(hero);
					
					
				} else {
					up_left.after(hero);
					hero_left2.after(up);
				}
			
				hero.focus();	
			}
			break;
		case 'ArrowDown':
			let drow = hero.parentElement.nextElementSibling;
			
	       if(drow != null){	
			let down = drow.cells[hero.cellIndex];
			let down_left = down.previousElementSibling
			hero_left3 = hero.previousElementSibling;
			
			let down_parent = down.parentElement;
			let hero_parent = hero.parentElement;
			hero.remove();
			down.remove();
			
			if(hero_left3 == null) {
				down_parent.prepend(hero);
				hero_parent.prepend(down);
			} else {
				down_left.after(hero);
				hero_left3.after(down);
				
			}
			hero.focus();
	       }
			break;
		  
		case 'ArrowLeft':
			let hero_left = hero.previousElementSibling;
			if(hero_left != null){
				hero_left.remove();
			    hero.after(hero_left);
			}
			break;
		case 'ArrowRight':
			let hero_right =  hero.nextElementSibling;
			if(hero_right != null){
				hero_right.remove();
				hero.before(hero_right);
			}
			break;
		
		}
	} 
	
}
</script>
</head>
<body>
<h1></h1>
<hr>
<table id="table">
<tbody>
<c:forEach var="i" begin="1" end="20">
	<tr>
		<c:forEach var="j" begin="1" end="40">
			<jsp:useBean id="a" class="util.Alpha"/>
			<td style="color:${a.fg};background:${a.bg};">${a.ch}</td>
			<c:remove var="a"/>
		</c:forEach>
	</tr>
</c:forEach>
</tbody>
</table>
<hr>
<button>start</button>
</body>
</html>