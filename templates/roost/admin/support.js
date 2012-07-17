document.addEvent('domready', function() {
	var maskMap = function() {
		var canvas = $('canvas');
		var coords = canvas.getCoordinates();
		
		var mask = canvas.retrieve('cmask');
		if( !mask ) {
			var mask = new Element('div', {
				styles: {
					position: 'absolute',
					top: coords.top,
					left: -1000,
					background: '#fff url('+ Rose.basePath+
						'gAssets/img/cog_anim.gif) no-repeat center center',
					height: coords.height,
					width: coords.width,
					opacity: 0.8
				}
			});
			$(document.body).adopt(mask);
		}

		canvas.store('cmask', mask);
		
		mask.setStyle('left', coords.left);
	};
	
	var unmaskMap = function() {

		var mask = $('canvas').retrieve('cmask');
		if( !mask ) {
			return false;
		}
		mask.setStyle('left', -1000);
	};
	
	maskMap();
	
	var checkRentType = function() {
		if( this.get('value') == 'range' ) {
			$$('input[name="rent_value"]').setStyle('display', 'none');
			$$('select[name="rent_range"]').setStyle('display', '');
		} else {
			$$('select[name="rent_range"]').setStyle('display', 'none');
			$$('input[name="rent_value"]').setStyle('display', '');
		}
	};

	var type = $$('select[name="rent_type"]');
	if( type ) {
		checkRentType.run([], type[0]);
		type.addEvent('change', checkRentType);
	}
	
	(function() {
		var encodeAddr = function() {
			var street = $('input_street').get('value');
			var city = $('input_city').get('value');
			var zip = $('input_zip').get('value');
			
			if( !street || !city || !zip ) {
				return;
			}
			maskMap();
			
			var addr = street+', '+city+' '+zip;
			
			var gc = new google.maps.Geocoder();
			
			if( marker) {
				marker.setMap(null);
				marker = false;
			}
			
			gc.geocode({'address': addr}, function(resp, status) {
				if(	status == google.maps.GeocoderStatus.OK ) {
					map.setCenter(resp[0].geometry.location);
					map.setZoom(16);
					marker = new google.maps.Marker({
						map: map, 
						position: resp[0].geometry.location
					});
					
					$('input_latlon').value = resp[0].geometry.location.lat()+','+
						resp[0].geometry.location.lng();
						
				}
				unmaskMap();		
			});
		};		

		var ll = $('canvas').get('data-latlon').split( ',' );
	
		var latlng = new google.maps.LatLng(ll[0], ll[1]);
		var myOptions = {
			zoom: 11,
			center: latlng,
			disableDoubleClickZoom: true,
			mapTypeId: google.maps.MapTypeId.ROADMAP
		};
		var map = new google.maps.Map($('canvas'), myOptions);
		
		if( $('input_latlon') ) {
			map.setZoom(16);
			marker = new google.maps.Marker({
				map: map, 
				position: latlng
			});
		}
		
		google.maps.event.addListener(map, 'dblclick', function() {
	
			if( marker ) {
				marker.setMap(null);
				marker = false;
			}
	
			map.setCenter(arguments[0].latLng);
			map.setZoom(16);
			marker = new google.maps.Marker({
				map: map, 
				position: arguments[0].latLng
			});
	
			$('input_latlon').value = arguments[0].latLng.lat()+','+
				arguments[0].latLng.lng();
				
		});

		[$('input_street'), $('input_city'), $('input_zip')].each(function(e) {
			e.addEvent('blur', encodeAddr);
		});
		
		unmaskMap();
	})();

});