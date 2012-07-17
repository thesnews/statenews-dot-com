{% extends "gryphon/base.tpl" %}
{% block title %}:: Spring Break 2012{% endblock %}
{% block scripts %}
	<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?v=3&sensor=false"></script>

	<div id="fb-root"></div>
	<script>(function(d, s, id) {
	  var js, fjs = d.getElementsByTagName(s)[0];
	  if (d.getElementById(id)) return;
	  js = d.createElement(s); js.id = id;
	  js.src = "//connect.facebook.net/en_US/all.js#xfbml=1&appId=122067054530307";
	  fjs.parentNode.insertBefore(js, fjs);
	}(document, 'script', 'facebook-jssdk'));</script>
	<script type="text/javascript">
	  (function() {
		var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
		po.src = 'http://apis.google.com/js/plusone.js';
		var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
	  })();
	</script>
	<script type="text/javascript">
$(document).addEvent("domready",function(){$("map-overlay").setStyle("opacity",0).set("morph",{transition:"bounce:out"}).set("tween",250);$$("#map-overlay .close").addEvent("click",function(){$("map-overlay").tween("opacity",0);setTimeout(function(){$("map-overlay").setStyle("left","-10000px")},250)});$("map-info").setStyle("display","none");$$("#map-info .close").addEvent("click",function(){$("map-info").setStyle("display","none")});$("input-name").addEvent("keydown",function(a){"enter"==a.key&&
a.stop()});var c=new google.maps.Map($("map-canvas"),{zoom:5,mapTypeId:google.maps.MapTypeId.ROADMAP,center:new google.maps.LatLng(42.708678,-84.559021)}),g=new google.maps.Geocoder,b=!1;$$("#input-name, #input-description").each(function(a){a.get("value")==a.get("placeholder")&&a.set("value","")});$("map-save").addEvent("click",function(a){a.stop();var c=this;c.hide();a=b.getPosition();(new Request.JSONP({url:"http://ossian.statenews.com/stage/statenews/index.php/cproxy/create.json",data:{lat:a.lat(),
lng:a.lng(),name:$$("#map-overlay input").pop().get("value"),description:$$("#map-overlay textarea").pop().get("value"),address:$("container-street").get("text")+" "+$("container-city").get("text")+" "+$("container-country").get("text")},onComplete:function(){$("map-overlay").tween("opacity",0);setTimeout(function(){$("map-overlay").setStyle("left","-10000px");c.show();$$("#map-overlay input").pop().set("value","");$$("#map-overlay textarea").pop().set("value","");d();b.setMap(null)},250)}})).send()});
var f=new Hash,d=function(){$("map-info").setStyle("display","none");var a=c.getBounds(),b=a.getNorthEast(),a=a.getSouthWest();(new Request.JSONP({url:"http://ossian.statenews.com/stage/statenews/index.php/cproxy/find.json",data:{x1:b.lat(),x2:a.lat(),y1:b.lng(),y2:a.lng()},onFailure:function(){console.log(arguments)},onComplete:function(a){for(var b in a)if(!f.has(b)){var e=a[b].value,d=new google.maps.Marker({map:c,icon:"http://statenews.com/images/markers/palm-tree-export.png",position:new google.maps.LatLng(e.lat,
e.lng)});google.maps.event.addListener(d,"click",function(a){$("map-info").setStyle("display","none");c.panTo(a.latLng);var b=this;setTimeout(function(){$("map-info").setStyles({position:"absolute",display:"block",top:$("map-container").getCoordinates($("map-container").getParent()).top,left:240});$$("#map-info .box h4")[0].set("text",b.name.unencode());$$("#map-info .box aside")[0].set("text",b.address.unencode());b.description?$$("#map-info .box p")[0].set("text",b.description.unencode()):$$("#map-info .box p")[0].set("text",
"Didn't provide a description. Probably having a sweet time.");$("map-static").set("src","http://maps.googleapis.com/maps/api/staticmap?sensor=false&zoom=14&size=278x98&center="+b.lat+","+b.lng)},250)}.bind(e));f.set(b,d)}}})).send()};google.maps.event.addListener(c,"zoom_changed",d);google.maps.event.addListener(c,"dragend",d);google.maps.event.addListener(c,"dragstart",function(){$("map-info").setStyle("display","none")});google.maps.event.addListener(c,"click",function(a){$("map-info").setStyle("display",
"none");b?(b.setAnimation(null),b.setPosition(a.latLng),b.setAnimation(google.maps.Animation.DROP),b.setMap(c)):(b=new google.maps.Marker({map:c,draggable:!0,icon:"http://statenews.com/images/markers/palm-tree-export-r.png",animation:google.maps.Animation.DROP,position:a.latLng}),google.maps.event.addListener(b,"click",function(a){var b=$("map-container").getCoordinates($("map-container").getParent());$("map-overlay").setStyles({display:"block",top:b.top-50,left:b.left}).tween("opacity",1).morph({top:b.top});
g.geocode({location:a.latLng},function(a){a[0].address_components.each(function(a){"locality"==a.types[0]&&$("container-street").set("html",a.long_name);"administrative_area_level_1"==a.types[0]&&$("container-city").set("html",a.long_name);"country"==a.types[0]&&$("container-country").set("html",a.long_name)})})}))});setTimeout(d,1E3);Browser.Engine.trident&&($("input-name").set("value",$("input-name").get("placeholder")),$("input-description").set("value",$("input-description").get("placeholder")),
6>=Browser.Engine.version&&$("map-static").setStyle("display","none"),$$("#input-name, #input-description").addEvents({focus:function(){this.set("value","")},blur:function(){""==this.get("value")&&this.set("value",this.get("placeholder"))}}))});
	</script>
{% endblock %}
{% block styles %}
	<style type="text/css">
		#map-container {
			background: url({{ 'images/maps/sb12-map-border.png'|asset }}) no-repeat 0 0;
			position: relative;
			height: 520px;
			width: 780px;
		}
		#map-canvas {
			position: absolute;
			top: 25px;
			left: 25px;
			width: 730px;
			height: 469px;
		}
		#map-logo {
			position: absolute;
			bottom: 40px;
			right: 25px;
			z-index: 10;
		}
		#map-overlay {
			background: url({{ 'images/maps/sb12-map-postcard.png'|asset }}) no-repeat 0 0;
			width: 780px;
			height: 520px;
			position: absolute;
			z-index: 20;
			left: -10000px;
		}
		#map-overlay textarea {
			background: transparent;
			position: absolute;
			top: 50px;
			left: 30px;
			font-size: 16px;
			border: none;
		}
		#map-overlay #input-name {
			background: transparent;
			position: absolute;
			top: 205px;
			left: 440px;
			font-size: 18px;
			border: none;
		}
		#map-overlay #container-street {
			position: absolute;
			top: 245px;
			left: 445px;
			font-size: 18px;
		}
		#map-overlay #container-city {
			position: absolute;
			top: 280px;
			left: 445px;
			font-size: 18px;
		}
		#map-overlay #container-country {
			position: absolute;
			top: 315px;
			left: 445px;
			font-size: 18px;
		}
		#map-overlay .close {
			position: absolute;
			cursor: pointer;
			top: -10px;
			right: -5px;
		}

		#map-overlay #map-save {
			position: absolute;
			bottom: 25px;
			right: 25px;
			cursor: pointer;
		}

		#map-info {
			width: 300px;
			height: 250px;
			background: url({{ 'images/maps/sb12-infobox.png'|asset }}) no-repeat center center;
		}
		#map-info .box {
			height: 190px;
			overflow: auto;
		}
		#map-info .close {
			position: absolute;
			cursor: pointer;
			top: -10px;
			right: -5px;
		}
		#map-static {
			width: 100%;
			height: 100px;
		}
	</style>
{% endblock %}

{% block active %}{% endblock %}
{% block subActive %}{% endblock %}

{% block content %}

<div class="grid_10">

	<h2 class="grid_3 alpha">
		Spring Break 2012
	</h2>
	<div class="grid_7 omega right">

		<a href="http://twitter.com/share" class="twitter-share-button" data-text="Where are you headed?" data-via="thesnews" data-hashtags="springbreak">Tweet</a>
		<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src="//platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>

		<div class="g-plusone" data-size="medium" data-annotation="inline" data-width="200"></div>

		<div class="fb-like" data-send="false" data-layout="button_count" data-width="200" data-show-faces="false"></div>

	</div>

	<hr class="spacer" />

	<p>
		<strong>Where are you heading?</strong> Drop a marker anywhere on the map, then click the marker and tell us where you'll be spending Spring Break!
	</p>

	<div id="map-container">
		<div id="map-canvas"></div>
		<img src="{{ 'images/maps/sb12-map-logo.png'|asset }}" id="map-logo" />
	</div>

	<div id="map-overlay">
		<img src="{{ 'images/maps/sb12-cross.png'|asset }}" class="close" />
		<form>
			<textarea rows="20" cols="30" placeholder="Tell us a bit about it, if you want." id="input-description"></textarea>

			<input type="text" placeholder="Your name" size="20" id="input-name"/>

			<span id="container-street">123 Faux St</span>
			<span id="container-city">Anyplace</span>
			<span id="container-country">USA</span>
		</form>

		<img src="{{ 'images/maps/sb12-save.png'|asset }}" id="map-save" />
	</div>

	<div id="map-info"><div class="box">
		<img src="{{ 'images/maps/sb12-cross.png'|asset }}" class="close" />
		<h4>Name</h4>
		<aside>Location</aside>

		<img src="" id="map-static" />

		<p>
			description
		</p>
	</div></div>

	<hr class="spacer" />


</div>
<div class="grid_2">
	{% include "gryphon/ads/skyscraper.tpl" %}
</div>

<div class="clear"></div>

{% endblock content %}