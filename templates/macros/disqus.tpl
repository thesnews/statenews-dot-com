{% macro list(item) %}
	{% helper config %}
	{% if 1328812200 >= item.created %}
		<a id="comments"></a>

		{% import 'macros/comment.tpl' as comment %}

		<div class="pagination"><span>
			{{ comment.pagers(item) }}
		</span></div>

		<div class="comments">
			{{ comment.list(item) }}
		</div>

		<div class="pagination"><span>
			{{ comment.pagers(item) }}
		</span></div>

		{% if item.shouldAllowComments %}

			{% set commentItem = item %}
			{% include 'gryphon/comment/form.tpl' %}

		{% endif %}
	{% else %}
		<div id="disqus_thread"></div>
		<script type="text/javascript">
			/* * * CONFIGURATION VARIABLES: EDIT BEFORE PASTING INTO YOUR WEBPAGE * * */
			var disqus_shortname = '{{ config.get("gryphon:comments:disqus_shortname") }}'; // required: replace example with your forum shortname
			var disqus_identifier = '{{ item.uuid }}';
			var disqus_url = '{{ item.url }}';

			/* * * DON'T EDIT BELOW THIS LINE * * */
			(function() {
				var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;
				dsq.src = 'http://' + disqus_shortname + '.disqus.com/embed.js';
				(document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
			})();
		</script>
		<noscript>Please enable JavaScript to view the <a href="http://disqus.com/?ref_noscript">comments powered by Disqus.</a></noscript>
		<a href="http://disqus.com" class="dsq-brlink">Comments powered by <span class="logo-disqus">Disqus</span></a>
		<p><strong>Please note</strong> All comments are eligible for publication in <em>The State News</em>.</p>
	{% endif %}
{% endmacro %}

{% macro countlink(item) %}
	{% helper config %}
	{% if 1328812200 >= item.created %}
	<a href="{{ item.url }}#comments">{{ item.commentTotal|int2noun('comment') }}</a>
	{% else %}
	<a href="{{ item.url }}#disqus_thread" data-disqus-identifier="{{ item.uuid }}">{{ item.name }}</a>
	{% endif %}
{% endmacro %}

{% macro includejs() %}
	{% helper config %}
	<script type="text/javascript">
		/* * * CONFIGURATION VARIABLES: EDIT BEFORE PASTING INTO YOUR WEBPAGE * * */
		var disqus_shortname = '{{ config.get("gryphon:comments:disqus_shortname") }}'; // required: replace example with your forum shortname

		/* * * DON'T EDIT BELOW THIS LINE * * */
		(function () {
			var s = document.createElement('script'); s.async = true;
			s.type = 'text/javascript';
			s.src = 'http://' + disqus_shortname + '.disqus.com/count.js';
			(document.getElementsByTagName('HEAD')[0] || document.getElementsByTagName('BODY')[0]).appendChild(s);
		}());
	</script>

{% endmacro %}