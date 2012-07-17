		$(document).addEvent('domready', function() {

			$('map-overlay').setStyle('opacity', 0).set('morph', {
				transition: 'bounce:out'
			}).set('tween', 250);
			$$('#map-overlay .close').addEvent('click', function(e) {
				$('map-overlay').tween('opacity', 0);
				setTimeout(function() {
					$('map-overlay').setStyle('left', '-10000px');
				}, 250);
			});

			$('map-info').setStyle('display', 'none');
			$$('#map-info .close').addEvent('click', function(e) {
				$('map-info').setStyle('display', 'none');
			});
			$('input-name').addEvent('keydown', function(e) {
				if( e.key == 'enter' ) {
					e.stop();
				}
			});


			var map = new google.maps.Map($('map-canvas'), {
				zoom: 5,
				mapTypeId: google.maps.MapTypeId.ROADMAP,
				center: new google.maps.LatLng(42.708678, -84.559021)
			});
			var geocoder = new google.maps.Geocoder();
			var userMarker = false;

			$$('#input-name, #input-description').each(function(el) {
				if( el.get('value') == el.get('placeholder') ) {
					el.set('value', '');
				}
			});


			$('map-save').addEvent('click', function(e) {
				e.stop();
				var button = this;
				button.hide();
				var latLon = userMarker.getPosition();

				new Request.JSONP({
					url: 'http://ossian.statenews.com/stage/statenews/index.php/cproxy/create.json',
					data: {
						lat: latLon.lat(),
						lng: latLon.lng(),
						name: $$('#map-overlay input').pop().get('value'),
						description: $$('#map-overlay textarea').pop().get('value'),
						address: $('container-street').get('text')+' '+$('container-city').get('text')+' '+$('container-country').get('text')
					},
					onComplete: function(data) {
						$('map-overlay').tween('opacity', 0);
						setTimeout(function() {
							$('map-overlay').setStyle('left', '-10000px');
							button.show();
							$$('#map-overlay input').pop().set('value', '');
							$$('#map-overlay textarea').pop().set('value', '');

							update_markers();

							userMarker.setMap(null);
						}, 250);
					}
				}).send();

			});

			var allMarkers = new Hash;
			var update_markers = function() {
				$('map-info').setStyle('display', 'none');
				var bounds = map.getBounds();

				var ne = bounds.getNorthEast();
				var sw = bounds.getSouthWest();

				var req = new Request.JSONP({
					url: 'http://ossian.statenews.com/stage/statenews/index.php/cproxy/find.json',
					data: {
						'x1': ne.lat(),
						'x2': sw.lat(),
						'y1': ne.lng(),
						'y2': sw.lng()
					},
					onFailure: function() {
						console.log(arguments);
					},
					onComplete: function(data) {
						var docs = data;
						for( var i in docs ) {
							if( allMarkers.has(i) ) {
								continue;
							}

							var doc = docs[i].value;

							var marker = new google.maps.Marker({
								map: map,
								icon: 'http://statenews.com/images/markers/palm-tree-export.png',
								position: new google.maps.LatLng(doc.lat, doc.lng)
							});

							google.maps.event.addListener(marker, 'click', function(e) {
								$('map-info').setStyle('display', 'none');
								map.panTo(e.latLng);
								var doc = this;
								setTimeout(function() {
									$('map-info').setStyles({
										position: 'absolute',
										display: 'block',
										top: $('map-container').getCoordinates($('map-container').getParent()).top,
										left: 240
									});
									$$('#map-info .box h4')[0].set('text', doc.name.unencode());
									$$('#map-info .box aside')[0].set('text', doc.address.unencode());
									if( doc.description ) {
										$$('#map-info .box p')[0].set('text', doc.description.unencode());
									} else {
										$$('#map-info .box p')[0].set('text', 'Didn\'t provide a description. Probably having a sweet time.');
									}
									$('map-static').set('src', 'http://maps.googleapis.com/maps/api/staticmap?sensor=false&zoom=14&size=278x98&center='+doc.lat+','+doc.lng);
								}, 250);
							}.bind(doc));


							allMarkers.set(i, marker);
						}
					}
				}).send();

			};
			google.maps.event.addListener(map, 'zoom_changed', update_markers);
			google.maps.event.addListener(map, 'dragend', update_markers);
			google.maps.event.addListener(map, 'dragstart', function() {
				$('map-info').setStyle('display', 'none');
			});

			google.maps.event.addListener(map, 'click', function(e) {
				$('map-info').setStyle('display', 'none');
				if( userMarker ) {
					userMarker.setAnimation(null);
					userMarker.setPosition(e.latLng);
					userMarker.setAnimation(google.maps.Animation.DROP);
					userMarker.setMap(map);
				} else {
					userMarker = new google.maps.Marker({
						map: map,
						draggable: true,
						icon: 'http://statenews.com/images/markers/palm-tree-export-r.png',
						animation: google.maps.Animation.DROP,
						position: e.latLng
					});

					google.maps.event.addListener(userMarker, 'click', function(e) {
						var coords = $('map-container').getCoordinates($('map-container').getParent());

						$('map-overlay').setStyles({
							display: 'block',
							top: coords.top-50,
							left: coords.left
						}).tween('opacity', 1).morph({
							top: coords.top
						});


						geocoder.geocode({location:e.latLng}, function(result, stat) {
							result[0].address_components.each(function(component) {
								if( component.types[0] == 'locality' ) {
									$('container-street').set('html', component.long_name);
								}
								if( component.types[0] == 'administrative_area_level_1' ) {
									$('container-city').set('html', component.long_name);
								}
								if( component.types[0] == 'country' ) {
									$('container-country').set('html', component.long_name);
								}
							});
						});
					});
				}
			});

			setTimeout(update_markers, 1000);
			if( Browser.Engine.trident ) {
				$('input-name').set('value', $('input-name').get('placeholder'));
				$('input-description').set('value', $('input-description').get('placeholder'));

				if( Browser.Engine.version <= 6 ) {
					$('map-static').setStyle('display', 'none');
				}

				$$('#input-name, #input-description').addEvents({
					'focus': function(e) {
						this.set('value', '');
					},
					'blur': function(e) {
						if( this.get('value') == '' ) {
							this.set('value', this.get('placeholder'));
						}
					}
				});
			}

		});
