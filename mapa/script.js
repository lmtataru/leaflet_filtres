var map = L.map('mapid').on('load', onMapLoad).setView([41.400, 2.206], 9);
//map.locate({setView: true, maxZoom: 17});
	
var tiles = L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {}).addTo(map);

//en el clusters almaceno todos los markers
var markers = L.markerClusterGroup();
var data_markers = [];

function onMapLoad() {

	console.log("Mapa cargado");
	 /*
	FASE 3.1
		1) Relleno el data_markers con una petición a la api
		2) Añado de forma dinámica en el select los posibles tipos de restaurantes
		3) Llamo a la función para --> render_to_map(data_markers, 'all'); <-- para mostrar restaurantes en el mapa
	*/
	//when the page is loaded get data from database using ajax
	$(document).ready ( function() {
		$.ajax({
			url:'http://localhost/mapa/api/apiRestaurants.php',
			type:'get',
			dataType:'json',
			success: function(data){
				// add option: all into select
				$("#kind_food_selector").append($('<option>', {
					value: 'all',
		    		text : 'All',
				}));
				// save data from json in data_markers
				for (var i = 0; i < data.length; i++) {
					data_markers.push(data[i]);
					// spilt the last element of json
					var temp_kind_food = data[i].kind_food.split(',');
					for (const element of temp_kind_food) {
						// verify if element exists in select, if not add it
						if ($("#kind_food_selector option[value='"+ element +"']").length == 0) {
							$("#kind_food_selector").append($('<option>', {
								value: element,
			     				text : element,
							}));
						}
					}		
				}
				render_to_map(data_markers, 'all');
			},
			error: function(xhr, status, error){
				console.log(xhr);
				console.log(status);
				console.log(error);
			}
		})
	});
   

}

$('#kind_food_selector').on('change', function() {
  console.log(this.value);
  render_to_map(data_markers, this.value);
});



function render_to_map(data_markers,filter) {
	/*
	FASE 3.2
		1) Limpio todos los marcadores
		2) Realizo un bucle para decidir que marcadores cumplen el filtro, y los agregamos al mapa
	*/	
	// remove markers from map
	map.removeLayer(markers);	
	markers.clearLayers();
	// verify if filter is "all" - if it is then add markers for all restaurants
	if (filter == "all") {
		for (var i = 0; i < data_markers.length; i++) {
			var marker = L.marker([data_markers[i].lat, data_markers[i].lng]).bindPopup("<b><h3>" + data_markers[i].name + "<br>" + data_markers[i].address + "</h3><b>");
			markers.addLayer(marker);
			map.addLayer(markers);
		}
	} else {
		// if it's not all - add markers only for the selected filter
		for (var i = 0; i < data_markers.length; i++) {
			// split kind_food and find out which type of food each restaurant has
			var temp_kind_food = data_markers[i].kind_food.split(',');
			for (const element of temp_kind_food ) {
				if (filter == element) {
					var marker = L.marker([data_markers[i].lat, data_markers[i].lng]).bindPopup("<b><h3>" + data_markers[i].name + "<br>" + data_markers[i].address + "</h3><b>");
					markers.addLayer(marker);
					map.addLayer(markers);
				}	
			}
		}

	}
}