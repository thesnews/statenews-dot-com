{% extends "gryphon/base.tpl" %}
{% block title %} :: Podcasts{% endblock %}

{% block content %}

<div class="grid_8">

	<h1>Podcasts</h1>

	<hr class="spacer" />

	{% fetch opinion from gryphon:media with [
		'where': 'media:type = "audio" and media:status = 1',
		'order': 'media:created desc',
		'limit': '2',
		'withTags': ['opinion_podcast']
	] %}

	<h2>Opinion Podcast</h2>
	<img src="{{ 'style/gryphon/images/rss_small.png'|asset }}" class="icon" /> <a href="http://www.statenews.com/index.php/feeds/opinion.xml">Subscribe to the Podcast</a>

	<hr class="spacer" />


	<div class="grid_2 alpha" style="text-align: center;padding-top:20px;">
		<a href="{{ opinion[0].urlOriginal }}"><img src="{{ 'gAssets/img/mime/mime_audio.png'|asset }}" /></a><br />
		<a href="{{ opinion[0].urlOriginal }}">Listen Now</a>
	</div>
	<div class="grid_6 omega">
		<h3>Latest: <a href="{{ opinion[0].urlOriginal }}">{{ opinion[0].title }}</a></h3>
		<div class="box gray">
			Published {{ opinion[0].created|timeSince }}
		</div>
		{{ opinion[0].caption_formatted }}
	</div>

	<hr class="spacer" />


	<div class="grid_2 alpha" style="text-align: center;padding-top:20px;">
		<a href="{{ opinion[1].urlOriginal }}"><img src="{{ 'gAssets/img/mime/mime_audio.png'|asset }}" /></a><br />
		<a href="{{ opinion[1].urlOriginal }}">Listen Now</a>
	</div>
	<div class="grid_6 omega">
		<h3>Previously: <a href="{{ opinion[1].urlOriginal }}">{{ opinion[1].title }}</a></h3>
		<div class="box gray">
			Published {{ opinion[1].created|timeSince }}
		</div>
		{{ opinion[1].caption_formatted }}
	</div>

	<hr class="spacer" />
	<hr  />

	{% fetch sports from gryphon:media with [
		'where': 'media:type = "audio" and media:status = 1',
		'order': 'media:created desc',
		'limit': '2',
		'withTags': ['sports_podcast']
	] %}

	<h2>Sports Podcast</h2>
	<img src="{{ 'style/gryphon/images/rss_small.png'|asset }}" class="icon" /> <a href="http://www.statenews.com/index.php/feeds/sports.xml">Subscribe to the Podcast</a>

	<hr class="spacer" />


	<div class="grid_2 alpha" style="text-align: center;padding-top:20px;">
		<a href="{{ sports[0].urlOriginal }}"><img src="{{ 'gAssets/img/mime/mime_audio.png'|asset }}" /></a><br />
		<a href="{{ sports[0].urlOriginal }}">Listen Now</a>
	</div>
	<div class="grid_6 omega">
		<h3>Latest: <a href="{{ sports[0].urlOriginal }}">{{ sports[0].title }}</a></h3>
		<div class="box gray">
			Published {{ sports[0].created|timeSince }}
		</div>
		{{ sports[0].caption_formatted }}
	</div>

	<hr class="spacer" />


	<div class="grid_2 alpha" style="text-align: center;padding-top:20px;">
		<a href="{{ sports[1].urlOriginal }}"><img src="{{ 'gAssets/img/mime/mime_audio.png'|asset }}" /></a><br />
		<a href="{{ sports[1].urlOriginal }}">Listen Now</a>
	</div>
	<div class="grid_6 omega">
		<h3>Previously: <a href="{{ sports[1].urlOriginal }}">{{ sports[1].title }}</a></h3>
		<div class="box gray">
			Published {{ sports[1].created|timeSince }}
		</div>
		{{ sports[1].caption_formatted }}
	</div>

	<hr class="spacer" />
	<hr  />

	{% fetch features from gryphon:media with [
		'where': 'media:type = "audio" and media:status = 1',
		'order': 'media:created desc',
		'limit': '2',
		'withTags': ['features_podcast']
	] %}

	<h2>Features Podcast</h2>
	<img src="{{ 'style/gryphon/images/rss_small.png'|asset }}" class="icon" /> <a href="http://www.statenews.com/index.php/feeds/entertainment.xml">Subscribe to the Podcast</a>

	<hr class="spacer" />


	<div class="grid_2 alpha" style="text-align: center;padding-top:20px;">
		<a href="{{ features[0].urlOriginal }}"><img src="{{ 'gAssets/img/mime/mime_audio.png'|asset }}" /></a><br />
		<a href="{{ features[0].urlOriginal }}">Listen Now</a>
	</div>
	<div class="grid_6 omega">
		<h3>Latest: <a href="{{ features[0].urlOriginal }}">{{ features[0].title }}</a></h3>
		<div class="box gray">
			Published {{ features[0].created|timeSince }}
		</div>
		{{ features[0].caption_formatted }}
	</div>

	<hr class="spacer" />


	<div class="grid_2 alpha" style="text-align: center;padding-top:20px;">
		<a href="{{ features[1].urlOriginal }}"><img src="{{ 'gAssets/img/mime/mime_audio.png'|asset }}" /></a><br />
		<a href="{{ features[1].urlOriginal }}">Listen Now</a>
	</div>
	<div class="grid_6 omega">
		<h3>Previously: <a href="{{ features[1].urlOriginal }}">{{ features[1].title }}</a></h3>
		<div class="box gray">
			Published {{ features[1].created|timeSince }}
		</div>
		{{ features[1].caption_formatted }}
	</div>


</div>

<div class="grid_4">
	{% include 'gryphon/main/sidebar-short.tpl' %}
</div>

<div class="clear"></div>

{% endblock content %}