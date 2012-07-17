{% extends "gryphon/base.tpl" %}


{% block title %} :: Blogs{% endblock %}
{% block active %}blogs{% endblock %}

{% block content %}
{% helper dswSync %}

<div class="grid_8">
	<h1>State News Blogs</h1>

	<p>
		State News Blog posts are the opinion of the author. The State News Editorial Board is not responsible for the content contained herein. <a href="{{ 'tsn:mail/4'|url }}">Let us know about your blog ideas</a>.
	</p>

	<hr class="spacer" />


		{% fetch blogs from blog with [
				'where': 'status = 1',
				'order': 'self:modified desc'
				]
		%}

		{% for blog in blogs %}
		{% if blog.media.length %}
			<div style="text-align: center;">
				<a href="{{ blog.url }}" style="border:0;"><img src="{{ blog.media[0].url }}" style="border:0;"/></a>
			</div>
		{% else %}
		<h2 id="blogname"><a href="{{ blog.url }}">{{ blog.name }}</a>:</h2>
		{% endif %}


		{% set post = blog.mostRecent %}
		<h3><a href="{{ post.url }}">{{ post.headline }}</a></h3>

		<p>
			{{ post.abstract_formatted }}
		</p>
		<div class="small gray box">
			By {{ post.authors.splat('name')|join(', ') }}
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			Last updated: {{ blog.modified|timeSince }}
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="{{ post.url }}">Read more &#187;</a>

		</div>



		<hr style="margin-bottom:2em;" />

	{% endfor %}

</div>

<div class="grid_4 standard-sidebar">
	{% include 'gryphon/main/sidebar-blog.tpl' %}
</div>

<hr class="spacer" />

{% endblock %}