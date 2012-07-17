{% extends "gryphon/base.tpl" %}
{% block title %}:: Subscribe to The State News{% endblock %}


{% block active %}{% endblock %}
{% block subActive %}{% endblock %}

{% block content %}

<div class="grid_8">

	<script type="text/javascript">var host = (("https:" == document.location.protocol) ? "https://secure." : "http://");document.write(unescape("%3Cscript src='" + host + "wufoo.com/scripts/embed/form.js' type='text/javascript'%3E%3C/script%3E"));</script>
	
	<script type="text/javascript">
	var z7x3k7 = new WufooForm();
	z7x3k7.initialize({
	'userName':'statenews', 
	'formHash':'z7x3k7', 
	'autoResize':true,
	'height':'896'});
	z7x3k7.display();
	</script>

</div>

<div class="grid_4">
	{% include 'gryphon/main/sidebar-standard.tpl' %}
</div>

<div class="clear"></div>

{% endblock content %}