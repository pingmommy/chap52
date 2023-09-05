<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
table {
border: 1px;
width: 500;

}
</style>

<script type="text/javascript">
function printPos(e){
	
	let td = e.target;
	let tr = td.parentElement;
	console.log(`[\${tr.rowIndex},\${td.cellIndex}, \${td.innerText}]`)
	
}

</script>

<title>Insert title here</title>


</head>
<body>
<table  border="1" width ="500" onclick="printPos(event)">
<thead>
<tr><th colspan="2">position</th><th colspan="2">color</th><th></th></tr>
<tr><th>line</th><th>column</th><th>fg</th><th>bg</th><th>ch</th></tr>
</thead>
<tbody>
<tr><td>10</td><td rowspan="2">20</td><td>black</td><td>blue</td><td>C</td></tr>
<tr><td>15</td><td>Yellow</td><td>black</td><td rowspan="2">X</td></tr>
<tr><td>25</td><td>15</td><td>Magenta</td><td>Gray</td></tr>
</tbody>
</table>
</body>
</html>