{% extends "gryphon/base.tpl" %}

{% block title %} :: {{ article.headline }}{% endblock %}
{% block description %}{{ article.abstract_formatted|striptags }}{% endblock %}
{% block links %}
	<link rev="canonical" type="text/html" href="{{ article.url }}" />
	<link rel="alternate shorter" type="text/html" href="{{ shortUrl }}" />

	{% if article.created|date('Ymd') <= '-2 years'|date('Ymd') %}
		<meta name="robots" content="noindex, nofollow">
	{% endif %}
{% endblock %}

{% block styles %}
<!--[if lt IE 9]>
<script src="//html5shiv.googlecode.com/svn/trunk/html5.js"></script>
<link href="{{ 'images/bestof/ie.css'|asset }}" rel='stylesheet' type='text/css'>
<![endif]-->
<style type="text/css">
	.block-grid {

	}
	.block-grid li {
		float: left;
		padding: 0;
		padding-right: 5px;
		margin-bottom: 5px !important;
		width: 200px;
		height: 150px;
		overflow: hidden;
	}
	.block-grid li img.main-image {
		padding: 0;
		margin: 0;
		width: 100%;
		max-width: 200px;
	}
	.overlay {
		background: #fff;
		padding: 10px;
		width: 600px;

		-webkit-box-shadow: 0 0 5px #666;
		-moz-box-shadow: 0 0 5px #666;
		box-shadow: 0 0 5px #666;

		border-radius: 3px;

	}

	.overlay-image .overlay-media {
		float: left;
		width: 350px;
	}
	.overlay-image .overlay-media img {
		width: 100%;
		max-width: 350px;
	}
	.overlay-image .overlay-content {
		margin-left: 360px;
	}
</style>
<!--[if lt IE 9]>
<style type="text/css">
	.overlay {
		background: #f1f1f1;
	}
</style>
<![endif]-->
{% endblock %}

{% block scripts %}

	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5/jquery.min.js"></script>
	<script type="text/javascript">
	  jQuery.noConflict();
	</script>
	<script type="text/javascript">
		(function($) {
			$(document).ready(function() {
				var _to = false;
				$('.block-grid li section').hide();

				$('.block-grid li img.main-image')
					.mouseenter(function(e) {
						if( _to ) {
							clearTimeout(_to);
							_to = false;
							$('.overlay').hide();
						}

						if( $(this).data('overlay') && $(this).data('overlay').length ) {
							$(this).data('overlay').show();
							return;
						}

						var $this = $(this),
							container = $('<div></div>')
								.addClass('overlay')
								.css({
									'position': 'absolute',
									'top': 0,
									'left': '-10000px'
								})
								.mouseenter(function() {
									if( _to ) {
										clearTimeout(_to);
										_to = false;
									}
								})
								.mouseleave(function() {
									if( _to ) {
										clearTimeout(_to);
										_to = false;
									}
									_to = setTimeout(function() {
										$('.overlay').hide();
										$(".video-js").each(function() { this.player.pause(); });
									})
								})
								.append($this.siblings('section').show());
						$('body').append(container);

						container.css({
							'top': $this.offset().top - 10,
							'left': $this.offset().left - 10
						});

						$this.data('overlay', container);
					})
					.mouseleave(function(e) {
						if( _to ) {
							clearTimeout(_to);
							_to = false;
						}
						_to = setTimeout(function() {
							$('.overlay').hide();
							$(".video-js").each(function() { this.player.pause(); });
						}, 100);
					});

			});
		})(jQuery);

	</script>
{% endblock %}

{% block content %}
{% helper dswSync %}
{% import 'macros/tools.tpl' as tools %}

{# we grab these ahead because they're all 'images' #}

{% set mugShots = article.media.grab('meta', 'mugshot', true) %}

{% set sections = article.sections %}

{% set domPhoto = images.shift() %}

<div class="grid_8">


	<div id="article">
		{% if message %}
			<div class="box gray">
				<h5>{{ message.value }}</h5>
			</div>
			<hr class="spacer" />
		{% endif %}

		<h1>{{ article.headline }}</h1>
		{% if article.subhead %}
			<h2 style="padding:.5em 0;">{{ article.subhead }}</h2>
		{% endif %}

		<div class="gray box small">
			{% if article.authors.length %}
				{% set author = article.authors.shift() %}
				By <span class="credit"><a href="{{ author.url }}">{{ author.name }}</a>
				<span class="byline_divider">|</span>
				{% for author in article.authors %}
					and <a href="{{ author.url }}">{{ author.name }}</a>
				{% endfor %}
				</span>
			{% endif %}

			<b>Originally Published:</b> {{ article.created|timeSince }}
			{% if article.created != article.modified %}
				<span class="byline_divider">|</span><b>Modified:</b> {{ article.modified|timeSince }}
			{% endif %}
			<span class="byline_divider">|</span>
			{{ disqus.countlink(article) }}

		</div>

		<hr class="spacer" />




			<a href="http://twitter.com/share" class="twitter-share-button" data-count="horizontal" data-via="thesnews">Tweet</a><script type="text/javascript" src="http://platform.twitter.com/widgets.js"></script>

			<iframe src="http://www.facebook.com/plugins/like.php?href={{ article.urlShort }}%2Fpage%2Fto%2Flike&amp;layout=button_count&amp;show_faces=false&amp;width=200&amp;action=recommend&amp;font=arial&amp;colorscheme=light&amp;height=21" scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:200px; height:21px;" allowTransparency="true"></iframe>

			<!--<div id='rdbWrapper' style="float:right"></div><script type='text/javascript'>
			(function() {
				var s     = document.getElementsByTagName('script')[0],
					rdb   = document.createElement('script');
				rdb.type  = 'text/javascript';
				rdb.async = true;
				rdb.src   = document.location.protocol + '//www.readability.com/embed.js';
				s.parentNode.insertBefore(rdb, s);
			})();
			</script>

			<hr class="spacer" />-->


		{% if mugShots.length %}
			{% for mug in mugShots %}
			<div class="mugshots">
				<img src="{{ mug.url }}" alt="{{ mug.caption }}" />
				<strong>{{ mug.caption_formatted }}</strong>
			</div>
			{% endfor %}
		{% endif %}

		{{ article.copy_formatted }}

		<hr class="spacer" />

		<ul class="block-grid">
			{% for item in article.media %}
				<li>
					<img src="{{ item.urlPreview }}" class="main-image" />
					<section class="overlay-{{ item.type }}">
						<div class="overlay-media">
							{% if item.type == 'image' %}
								<img src="{{ item.url }}" />
							{% else %}
								<hr class="spacer" />
								<div class="video-js-box">
								  <video id="video_{{ item.uid }}" class="video-js vjs-default-skin" width="605" height="340" poster="{{ item.url }}" controls preload data-setup="{}">
									<source src="{{ item.urlOriginalMp4 }}" type='video/mp4'>
									<source src="{{ item.urlOriginalOgg }}" type='video/ogg'>
								  </video>
									<br />
									<a href="http://videojs.com"><img class="noborder" src="{{ 'style/gryphon/images/videojs-link.png'|url }}" /></a>
									<span style="display:none"><a href="http://videojs.com">HTML5 Video Player</a> by VideoJS</span>
								  </p>
								</div>
							{% endif %}
						</div>
						<div class="overlay-content">
							{{ item.caption_formatted }}
						</div>
					</section>
				</il>
			{% endfor %}
		</ul>


		<hr />

		<div class="grid_4 alpha">
		<h5>Article Tools:</h5>
		<ul id="tools">
			<li>{{ tools.facebook(article) }}</li>
			<li>{{ tools.twitter(article) }}</li>
			<li>{{ tools.digg(article) }}</li>
			<li>{{ tools.delicious(article) }}</li>
			<li>{{ tools.blogger(article) }}</li>
			<li>{{ tools.feed(article) }}</li>
			<li>{{ tools.print(article) }}</li>
		</ul>
		<h5>Short URL:</h5>
		<a class="small" href="{{ shortUrl }}">{{ shortUrl }}</a>
		</div>

		<div class="grid_4 omega">
		<h5>Possibly related:</h5>
		<ul id="article-related">
			{% for item in article.getRelated() %}
				<li><a href="{{ item.url }}">{{ item.headline }}</a></li>
			{% endfor %}
		</ul>
		{% if sections.length %}
			<h5>More in {{ sections[0].name }}:</h5>
			{% fetch more from gryphon:article with [
				'where': 'status = 1',
				'limit': 5,
				'order': 'weight desc, created desc',
				'withTags': sections[0].tags.splat('name')
			] %}
			<ul>
			{% for item in more %}
				<li><a href="{{ item.url }}">{{ item.headline }}</a></li>
			{% endfor %}
			</ul>
		{% endif %}
		</div>

		<br />


</div>



</div>


<div class="grid_4 standard-sidebar">
	{% include 'gryphon/main/sidebar-article.tpl' %}
</div>

<div class="clear"></div>

<div class="grid_8">

	<hr />

	{{ disqus.list(article) }}

</div>
<div class="grid_4">
	{% include 'gryphon/main/sidebar-lower.tpl' %}
</div>

<hr class="spacer" />

{% endblock %}