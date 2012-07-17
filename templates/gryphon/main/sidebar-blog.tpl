{% include "gryphon/ads/rectangle.tpl" %}

<hr />

{% fetch blogs from gryphon:blog with [
	'order': 'name asc',
	'where': 'status = 1'
] %}

<div class="box gray">
	<h5>TSN BLOGROLL <span><a href="{{ 'blog'|url }}">More &#187;</a></span></h5>

	<ul class="bullet">
		{% for blog in blogs %}
			<li><a href="{{ blog.url }}">{{ blog.name }}</a></li>
		{% endfor %}
	<ul>

</div>

<hr class="spacer" />


<div class="box gray">
	{% include "pre1/featured.tpl" %}
</div>

<hr class="spacer" />

{% include 'gryphon/main/featured.tpl' %}

<hr class="spacer" />

{% include 'gryphon/main/pod-gallery.tpl' %}

<hr class="spacer" />

{% include 'google/calendar/featured.tpl' %}

<hr class="spacer" />