
$(document).on("ready", main);
function main() {
	$("#tfBuscar").on("keyup", buscar); 
}
function buscar(){
	var tarjetas = $(".rectangulo");
	var texto = $("#tfBuscar").val(); 
	texto = texto.toLowerCase(); 
	tarjetas.show(); 
	$(".resultados").show(); 
	for(var i=0; i< tarjetas.length; i++){
		var contenido = tarjetas.eq(i).text();
		contenido = contenido.toLowerCase();
		var index = contenido.indexOf(texto);
	if(index == -1){
		tarjetas.eq(i).hide(); 
		$(".resultados").hide(); 
		}
                    
                
	}
}

                 
              
                 
                 
                 function valore(val)
                 {
                     const now = Date.now();
                   var resultado = (parseInt(val) / now);
                   var key = btoa(now.toString());
                   var mensaje =btoa(resultado.toString());
                   console.log(mensaje + key + " epoc " + now);
                    window.open("pgllaves.jsp?id="+mensaje+"&log="+key);
                    console.log(mensaje + key + " epoc " + now+"esto es lo que aveces agarra");
                   return false;

                   
                   
                   
                 }
                 
                 
                    function valor(val)
                 {
                   const now = Date.now();
                   var resultado = (parseInt(val) / now);
                   var key = btoa(now.toString());
                   var mensaje =btoa(resultado.toString());
                   console.log(mensaje + key + " epoc " + now);
                   window.close();
                    window.open("entregar.jsp?id="+mensaje+"&log="+key);
                    
                    console.log(mensaje + key + " epoc " + now+"esto es lo que aveces agarra");
                   return false;
                   
                 }
                 
                 function ir()
                 {
                     window.location.href ="usuario.jsp";
                 }
                 
    
         