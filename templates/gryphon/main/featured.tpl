<script type="text/javascript" src="http://statenews.disqus.com/combination_widget.js?num_items=3&hide_mods=0&color=green&default_tab=recent&excerpt_length=1"></script><a href="http://disqus.com/">Powered by Disqus</a>
<hr class="spacer" />

<ul class="box gray">
	<h5>FRESH CONTENT <span><a href="{{ 'recent'|url }}">More &#187;</a></span></h5>
		<ul class="bullet">
		{% fetch recently from article with [
			'where': 'status = 1',
			'order': 'created desc',
			'limit': 6
		] %}
		{% for article in recently %}
			<li><a href="{{ article.url }}">{{ article.headline }}</a> </li>
		{% endfor %}
		</ul>
	</li>
</ul>