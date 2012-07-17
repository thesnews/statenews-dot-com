{% extends 'gryphon/base.tpl' %}

{% block styles %}
<style type="text/css">
	.block-grid {

	}
	.block-grid li {
		float: left;
		padding: 0;
		padding-right: 5px;
		margin-bottom: 5px !important;
		width: 200px;
		overflow: hidden;
	}
	.block-grid li img.main-image {
		padding: 0;
		margin: 0;
		width: 100%;
		max-width: 200px;
	}
	.block-grid li section {
		display: none;
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

	.overlay img.main-image {
		float: left;
		width: 100%;
		max-width: 450px;
	}
	.overlay section {
		margin-left: 460px;
	}
</style>
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

				$('.block-grid li img.main-image')
					.mouseenter(function(e) {
						if( _to ) {
							clearTimeout(_to);
							_to = false;
							$('.overlay').remove();
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
										$('.overlay').remove();
									})
								})
								.append($this.clone())
								.append($this.siblings('section').clone().css('display', 'block'));
						$('body').append(container);

						container.css({
							'top': $this.offset().top - 10,
							'left': $this.offset().left - 10
						});
					})
					.mouseleave(function(e) {
						if( _to ) {
							clearTimeout(_to);
							_to = false;
						}
						_to = setTimeout(function() {
							$('.overlay').remove();
						}, 100);
					});

			});
		})(jQuery);

	</script>
{% endblock %}


{% block content %}
<div class="grid_8">

	<h1>Block Grid</h1>

	<ul class="block-grid">
		<li>
			<img src="http://placekitten.com/500/325" class="main-image"/>
			<section>
				I'm some stuff.<br />
				<b>Lorem ipsum</b>
				<p>
					Quick brown dogs jump over the lazy fox. The jay, pig, fox, zebra, and my wolves quack! Blowzy red vixens fight for a quick jump. Joaquin Phoenix was gazed by MTV for luck. A wizard’s job is to vex chumps quickly in fog. Watch "Jeopardy! ", Alex Trebek's fun TV quiz game. Woven silk pyjamas exchanged for blue quartz. Brawny gods just flocked up to quiz and vex him.
				</p>
			</section>
		</li>
		<li>
			<img src="http://placekitten.com/500/325" class="main-image"/>
			<section>
				I'm some stuff.<br />
				<b>Lorem ipsum</b>
				<p>
					Quick brown dogs jump over the lazy fox. The jay, pig, fox, zebra, and my wolves quack! Blowzy red vixens fight for a quick jump. Joaquin Phoenix was gazed by MTV for luck. A wizard’s job is to vex chumps quickly in fog. Watch "Jeopardy! ", Alex Trebek's fun TV quiz game. Woven silk pyjamas exchanged for blue quartz. Brawny gods just flocked up to quiz and vex him.
				</p>
			</section>
		</li>
		<li>
			<img src="http://placekitten.com/500/325" class="main-image"/>
			<section>
				I'm some stuff.<br />
				<b>Lorem ipsum</b>
				<p>
					Quick brown dogs jump over the lazy fox. The jay, pig, fox, zebra, and my wolves quack! Blowzy red vixens fight for a quick jump. Joaquin Phoenix was gazed by MTV for luck. A wizard’s job is to vex chumps quickly in fog. Watch "Jeopardy! ", Alex Trebek's fun TV quiz game. Woven silk pyjamas exchanged for blue quartz. Brawny gods just flocked up to quiz and vex him.
				</p>
			</section>
		</li>
		<li>
			<img src="http://placekitten.com/500/325" class="main-image"/>
			<section>
				I'm some stuff.<br />
				<b>Lorem ipsum</b>
				<p>
					Quick brown dogs jump over the lazy fox. The jay, pig, fox, zebra, and my wolves quack! Blowzy red vixens fight for a quick jump. Joaquin Phoenix was gazed by MTV for luck. A wizard’s job is to vex chumps quickly in fog. Watch "Jeopardy! ", Alex Trebek's fun TV quiz game. Woven silk pyjamas exchanged for blue quartz. Brawny gods just flocked up to quiz and vex him.
				</p>
			</section>
		</li>
		<li>
			<img src="http://placekitten.com/500/325" class="main-image"/>
			<section>
				I'm some stuff.<br />
				<b>Lorem ipsum</b>
				<p>
					Quick brown dogs jump over the lazy fox. The jay, pig, fox, zebra, and my wolves quack! Blowzy red vixens fight for a quick jump. Joaquin Phoenix was gazed by MTV for luck. A wizard’s job is to vex chumps quickly in fog. Watch "Jeopardy! ", Alex Trebek's fun TV quiz game. Woven silk pyjamas exchanged for blue quartz. Brawny gods just flocked up to quiz and vex him.
				</p>
			</section>
		</li>
		<li>
			<img src="http://placekitten.com/500/325" class="main-image"/>
			<section>
				I'm some stuff.<br />
				<b>Lorem ipsum</b>
				<p>
					Quick brown dogs jump over the lazy fox. The jay, pig, fox, zebra, and my wolves quack! Blowzy red vixens fight for a quick jump. Joaquin Phoenix was gazed by MTV for luck. A wizard’s job is to vex chumps quickly in fog. Watch "Jeopardy! ", Alex Trebek's fun TV quiz game. Woven silk pyjamas exchanged for blue quartz. Brawny gods just flocked up to quiz and vex him.
				</p>
			</section>
		</li>
		<li>
			<img src="http://placekitten.com/500/325" class="main-image"/>
			<section>
				I'm some stuff.<br />
				<b>Lorem ipsum</b>
				<p>
					Quick brown dogs jump over the lazy fox. The jay, pig, fox, zebra, and my wolves quack! Blowzy red vixens fight for a quick jump. Joaquin Phoenix was gazed by MTV for luck. A wizard’s job is to vex chumps quickly in fog. Watch "Jeopardy! ", Alex Trebek's fun TV quiz game. Woven silk pyjamas exchanged for blue quartz. Brawny gods just flocked up to quiz and vex him.
				</p>
			</section>
		</li>
		<li>
			<img src="http://placekitten.com/500/325" class="main-image"/>
			<section>
				I'm some stuff.<br />
				<b>Lorem ipsum</b>
				<p>
					Quick brown dogs jump over the lazy fox. The jay, pig, fox, zebra, and my wolves quack! Blowzy red vixens fight for a quick jump. Joaquin Phoenix was gazed by MTV for luck. A wizard’s job is to vex chumps quickly in fog. Watch "Jeopardy! ", Alex Trebek's fun TV quiz game. Woven silk pyjamas exchanged for blue quartz. Brawny gods just flocked up to quiz and vex him.
				</p>
			</section>
		</li>
		<li>
			<img src="http://placekitten.com/500/325" class="main-image"/>
			<section>
				I'm some stuff.<br />
				<b>Lorem ipsum</b>
				<p>
					Quick brown dogs jump over the lazy fox. The jay, pig, fox, zebra, and my wolves quack! Blowzy red vixens fight for a quick jump. Joaquin Phoenix was gazed by MTV for luck. A wizard’s job is to vex chumps quickly in fog. Watch "Jeopardy! ", Alex Trebek's fun TV quiz game. Woven silk pyjamas exchanged for blue quartz. Brawny gods just flocked up to quiz and vex him.
				</p>
			</section>
		</li>
		<li>
			<img src="http://placekitten.com/500/325" class="main-image"/>
			<section>
				I'm some stuff.<br />
				<b>Lorem ipsum</b>
				<p>
					Quick brown dogs jump over the lazy fox. The jay, pig, fox, zebra, and my wolves quack! Blowzy red vixens fight for a quick jump. Joaquin Phoenix was gazed by MTV for luck. A wizard’s job is to vex chumps quickly in fog. Watch "Jeopardy! ", Alex Trebek's fun TV quiz game. Woven silk pyjamas exchanged for blue quartz. Brawny gods just flocked up to quiz and vex him.
				</p>
			</section>
		</li>
		<li>
			<img src="http://placekitten.com/500/325" class="main-image"/>
			<section>
				I'm some stuff.<br />
				<b>Lorem ipsum</b>
				<p>
					Quick brown dogs jump over the lazy fox. The jay, pig, fox, zebra, and my wolves quack! Blowzy red vixens fight for a quick jump. Joaquin Phoenix was gazed by MTV for luck. A wizard’s job is to vex chumps quickly in fog. Watch "Jeopardy! ", Alex Trebek's fun TV quiz game. Woven silk pyjamas exchanged for blue quartz. Brawny gods just flocked up to quiz and vex him.
				</p>
			</section>
		</li>
		<li>
			<img src="http://placekitten.com/500/325" class="main-image"/>
			<section>
				I'm some stuff.<br />
				<b>Lorem ipsum</b>
				<p>
					Quick brown dogs jump over the lazy fox. The jay, pig, fox, zebra, and my wolves quack! Blowzy red vixens fight for a quick jump. Joaquin Phoenix was gazed by MTV for luck. A wizard’s job is to vex chumps quickly in fog. Watch "Jeopardy! ", Alex Trebek's fun TV quiz game. Woven silk pyjamas exchanged for blue quartz. Brawny gods just flocked up to quiz and vex him.
				</p>
			</section>
		</li>

	</ul>

</div>
<div class="grid_4">
	{#% include 'gryphon/main/sidebar-standard.tpl' %#}
</div>
<hr class="spacer" />

{% endblock %}