<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<script src="scripts/main.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.15.0/jquery.validate.min.js"></script>
<title>Lis?? asiakas</title>
<link rel="stylesheet" href="css/style.css" type="text/css" /> 
</head>
<body>
<form id="tiedot">
	<table>
		<thead>
			<tr>
				<th colspan="5" class="oikealle"><span id="takaisin">Takaisin asiakaslistaukseen</span></th>
			</tr>
			<tr>
				<th>Etunimi</th>
				<th>Sukunimi</th>
				<th>Puhelin</th>
				<th>Sposti</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td><input type="text" name="etunimi" id="etunimi"></td>
				<td><input type="text" name="sukunimi" id="sukunimi"></td>
				<td><input type="text" name="puhelin" id="puhelin"></td>
				<td><input type="text" name="sposti" id="sposti"></td>
				<td><input type="submit" id="tallenna" value="Lis??"></td>
			</tr>
		</tbody>
	</table>
</form>
<span id="ilmoitus"></span>
</body>
<script>
$(document).ready(function(){
	$("#takaisin").click(function(){
		document.location="listaaasiakkaat.jsp";
	});
	$("#tiedot").validate({
		rules: {
			etunimi: {
				required: true,
				minlength: 2
			},
			sukunimi: {
				required: true,
				minlength: 2
			},
			puhelin: {
				required: true,
				minlength: 10
			},
			sposti: {
				required: true,
				minlength: 10
			}
		},
		messages: {
			etunimi: {
				required: "Tyhj?",
				minlength: "Liian lyhyt"
			},
			
			sukunimi: {
				required: "Tyhj?",
				minlength: "Liian lyhyt"
			},
			puhelin: {
				required: "Tyhj?",
				minlength: "Liian lyhyt"
			},
			sposti: {
				required: "Tyhj?",
				minlength: "Liian lyhyt"
			}
			
		},
		
		submitHandler: function(form) {
			lisaaAsiakas();
		}
	});
	
});

function lisaaAsiakas(){	
	var formJsonStr = formDataJsonStr($("#tiedot").serializeArray());
	$.ajax({url:"asiakkaat", data:formJsonStr, type:"POST", dataType:"json", success:function(result) {    
		if(result.response==0){
      	$("#ilmoitus").html("Asiakkaan lis??minen ep?onnistui.");
      }else if(result.response==1){			
      	$("#ilmoitus").html("Asiakkaan lis??minen onnistui.");
      	$("#etunimi", "#sukunimi", "#puhelin", "#sposti").val("");
		}
  }});	
}
</script>
</html>