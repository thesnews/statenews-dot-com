{% extends "gryphon/base.tpl" %}

{% block title %} :: Galleries{% endblock %}
{% block active %}multimedia{% endblock %}
{% block subActive %}Galleries{% endblock %}

{% block content %}
	{% helper dswSync %}
	
	{% set gallery = galleries.shift() %}
	{% set image = gallery.mediaOrdered|first() %}
	{% set nextImage = gallery.mediaOrdered|next() %}
	{% set previousImage = gallery.mediaOrdered|last() %}
	
<div class="grid_8">

	<h1>{{ gallery.name }}</h1>

	<div class="inline_gallery" id="gallery_{{ gallery.uid }}">
	
		{% set i = 1 %}

		<div class="pagination">
			<a href="{{ gallery.urlDefault~'/'~previousImage.uid }}" class="previous">&#171;</a>
			<div class="overflow_wrapper"><div>
				{% for item in gallery.mediaOrdered %}
					<a href="{{ [gallery.urlDefault, item.uid]|join('/') }}" id="gallery_item_{{ item.uid }}"{% if item.uid == image.uid %} class="selected"{% endif %}>{{ i }}</a>
					{% set i = i+1 %}
				{% endfor %}
			</div></div>
			<a href="{{ gallery.urlDefault~'/'~nextImage.uid }}" class="next">&#187;</a>
		</div>
		

		<div class="gallery_image image">
	
			<img src="{{ image.url }}" class="photo shadow-item" />
	
			<div class="info">
				<span>{{ image.authors.splat('name')|join(', ') }}
				&middot; {{ image.source }}</span>
				
				<span>Posted: {{ image.created|timeSince }}</span>
		
				<span><a href="{{ gallery.urlDefault~'/'~image.uid }}" class="permalink">Link to this</a></span>
				
				{% if dswSync.buyURL(image) %}
					<a href="{{ dswSync.buyURL(image) }}" class="reprint"><img style="border: none;" class="reprint_icon" src="{{ 'style/gryphon/images/reprint.png'|url }}" alt="Reprints" /></a>
				{% endif %}
	
				{{ image.caption_formatted }}
	
			</div>
		</div>
	</div>

	<hr />

	<div class="pagination">
		<h5>GALLERIES</h5>
		<span>
		{% for page in pagination %}
			<a href="{{ page.url }}">{{ page.label }}</a>
		{% endfor %}
		</span>
	</div>
	
	{% for i in 0..(galleries.length-1) %}
		{% set item = galleries[i] %}
		
		{% if i%2 == 0 %}
			<div class="grid_4 alpha">
		{% else %}
			<div class="grid_4 omega">
		{% endif %}
			<a href="{{ item.urlDefault }}"><img src="{{ item.urlThumbnail }}" class="thumbnail" /></a>
			<h4><a href="{{ item.urlDefault }}">{{ item.name }}</a></h4>
			{{ item.media.length }} images<br />
			Posted: {{ item.created|timeSince }}
			
			<hr class="spacer" />
		</div>

		{% if i%2 != 0 %}
			<hr class="clear-fix" />
		{% endif %}
		
	{% endfor %}
	<hr class="spacer" />
	<div class="pagination">
		<span>
		{% for page in pagination %}
			<a href="{{ page.url }}">{{ page.label }}</a>
		{% endfor %}
		</span>
	</div>

</div>

<div class="grid_4">
	{% include "gryphon/main/sidebar-standard.tpl" %}
</div>

<hr class="spacer" />

<script type="text/javascript">
	{% include 'gryphon/gallery/inline.js' %}
</script>

{% endblock %}
