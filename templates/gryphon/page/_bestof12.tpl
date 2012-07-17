{% extends 'gryphon/base.tpl' %}

{% block styles %}
	<link href='http://fonts.googleapis.com/css?family=Alfa+Slab+One' rel='stylesheet' type='text/css'>
	<link href="{{ 'images/bestof/style.css'|asset }}" rel='stylesheet' type='text/css'>
	<!--[if IE]>
	<script src="//html5shiv.googlecode.com/svn/trunk/html5.js"></script>
	<link href="{{ 'images/bestof/ie.css'|asset }}" rel='stylesheet' type='text/css'>
	<![endif]-->
{% endblock %}

{% block scripts %}

	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5/jquery.min.js"></script>
	<script type="text/javascript">
	  jQuery.noConflict();
	</script>
	<script type='text/javascript' src="{{ 'images/bestof/js/functions.js'|asset }}"></script>
	<script type='text/javascript' src="{{ 'images/bestof/js/jquery.hoverflow.min.js'|asset }}"></script>
	<script type="text/javascript">
		(function($) {
			{% include 'gryphon/page/bestof.json' %}

			$(document).ready(function() {
				var today = new Date();
				today.setHours(0,0,0);
				var tomorrow = new Date(today.getTime()+86400000);
				var sortTotal = 0;

				var doSort = function() {
					sortTotal += 1;

					if( sortTotal < 2 ) {
						return;
					}

					var inputs = $('.catagory select');
					inputs.each(function() {
						var $this = $(this);
						var kids = $this.children();
						$this.empty();

						kids = kids.sort(function(a, b) {
							if( $(a).val() == 'writein' ) {
								return 1;
							}
							if( $(b).val() == 'writein' ) {
								return -1;
							}
							var vals = [$(a).val(), $(b).val()].sort();

							if( vals[0] == $(a).val() ) {
								return -1;
							}

							return 1;
						});

						$this.append(kids);

					});
				};

				var modal = function(html) {
					var div = $('<div/>')
						.addClass('box gray')
						.html(html)
						.css({
							'position': 'fixed',
							'top': '200px',
							'width': '300px',
							'left': '-1000px',
							'z-index': 100,
							'border': '2px solid #ccc'
						});
					$('body').append(div);

					div.append($('<img />')
						.attr('src', 'http://statenews.com/images/maps/sb12-cross.png')
						.css({
							'position': 'absolute',
							'top': '-20px',
							'right': '-20px',
							'cursor': 'pointer'
						})
						.click(function() {
							div.remove();
						})
					);

					div.css('left', $('body').width()/2 - div.width()/2);
				};

				var message = function(text) {
					var type = 'success';

					if( arguments[1] ) {
						type = arguments[1];
					}
					var div = $('<div />')
						.addClass('box '+type)
						.text(text)
						.css({'position': 'fixed', 'top': 0, 'left': -1000+'px'});
					$('body').append(div);

					div.css('left', $('body').width()/2 - div.width()/2);
					setTimeout(function() { div.fadeOut(); }, 5000);
				}

				for( var category in questions ) {
					var counter = 1;
					var container = $('.catagory[data-category="'+category+'"]');
					var items = questions[category];

					$(items).each(function(idx, item) {
						var ol = $('<ol><li /></ol>');
						var select = $('<select />')
							.attr('name', category.toLowerCase()+idx)
							.attr('data-question', item.label);

						var spn = $('<span />').text(item.label);
						ol.children().first().append(spn, select);

						select.append(
							$('<option />')
								.text('Select one')
								.val(0)
						);

						$(item.options).each(function(idx, op) {
							var norm = op.replace(/[^a-zA-Z0-9_]/g, '');
							select.append(
								$('<option />').text(op).val(op)
									.attr('data-norm', norm)
							);
						});

						select.append(
							$('<option />').text('Add your own').val('writein')
						);

						select.change(handleChange);
						container.append(ol);
					});
				}
				doSort();

				$.ajax({
					type: 'GET',
					url: 'http://parks.thesn.net/responses',
					crossDomain: true,
					contentType: "application/json",
					dataType: 'jsonp',
					processData: false,
					success: function(data) {
						for( var i in data ) {
							var select = $('select[data-question="'+i+'"]');
							var options = data[i];

							for( var k in options ) {
								var norm = k.replace(/[^a-zA-Z0-9_]/g, '');
								if( select.children('[data-norm="'+norm+'"]').length >= 1 ) {
									continue;
								}
								$('<option/>').text(k).val(k).attr('data-norm', norm)
									.insertBefore(select.children().last());
							}

						}
						doSort();
					}
				});

				$('#submit-vote').click(function(e) {
					e.preventDefault();
					$(this).css('opacity', 0.5);
					var vals = []
					$('.catagory select, .catagory input').each(function() {
						var $this = $(this);

						if( $this.val() && $this.val() != 0 ) {
							vals.push(JSON.stringify({
								id: $this.attr('name'),
								question: $this.parents('li').find('span').text(),
								response: $this.val()
							}));
						}

					});

					if( $.cookie('_a6fd7880Z_snbestof12') !== null ) {
						message('Dang! You\'ve already voted today. Come back after midnight.', 'error');
						$(this).css('opacity', 1);
						return;
					}

					if( vals.length < 20 ) {
						message('Dang! Sorry, you have to vote in at least 20 categories for your vote to count.', 'error');
						$(this).css('opacity', 1);
						return;
					}

					$.cookie('_a6fd7880Z_snbestof12', today.getTime(), {
						expires: tomorrow
					});

					var str = vals.join(',');

					$.ajax({
						type: 'GET',
						url: 'http://parks.thesn.net/vote',
						crossDomain: true,
						contentType: "application/json",
						dataType: 'jsonp',
						data: 'vals=['+encodeURIComponent(str)+']',
						processData: false,
						success: function(data) {
							modal('<h3>Thanks for voting!</h3><hr /><p>As a thank you, we have a page of <a href="{{ 'images/bestof/bestof_12_final.pdf'|asset }}" target="_blank">special coupons</a> from our sponsors for you to download.</p><hr class="spacer" /><p>Remember to come back tomorrow and vote for your favorites again!</p>');
						}
					});
				});
			});
		})(jQuery);

	</script>
<script type="text/javascript">
  (function() {
    var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
    po.src = 'https://apis.google.com/js/plusone.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
  })();
</script>
{% endblock %}


{% block content %}
<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/en_US/all.js#xfbml=1&appId=122067054530307";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>
<div class="grid_8">

<section id="best-of" class="wrap">
	<header>
		<h1>Best of MSU</h1>

		<hr class="spacer" />

		<strong>Rules</strong>: You may vote once for every 24 hour period. You must vote in, at least, 20 categories for a single ballot to be counted. The State News reserves the right to invalidate inappropriate or derogatory responses.

		<hr class="spacer" />

		<a href="https://twitter.com/share" class="twitter-share-button" data-text="Best Of MSU 2012" data-via="thesnews">Tweet</a>
		<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src="//platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>

		<g:plusone size="medium" annotation="inline" width="200"></g:plusone>

		<div class="fb-like" data-send="false" data-layout="button_count" data-width="200" data-show-faces="false"></div>
		<hr class="spacer" />
	</header>
	<nav id="best-of-sidebar">
		<ul id="best-of-navigation">
			<li><a href="#" id="navfirst">Food</a></li>
			<li><a href="#" id="navsecond">Drinks</a></li>
			<li><a href="#" id="navthird">Services</a></li>
			<li><a href="#" id="navfourth">Stores</a></li>
			<li><a href="#" id="navfifth">Living</a></li>
			<li><a href="#" id="navsixth">Other</a></li>
			<li><a href="#disqus_thread">Comments</a></li>
			<li><a href="#" id="navtop">Back to Top</a></li>
		</ul>
	</nav>
	<div id="best-of-content">
		<section id="first" class="catagory" data-category="Food">
			<h1><span>Food</span></h1>
		</section>
		<section id="second" class="catagory" data-category="Drinks">
			<h1><span>Drinks</span></h1>
		</section>
		<section id="third" class="catagory" data-category="Services">
			<h1><span>Services</span></h1>
		</section>
		<section id="fourth" class="catagory" data-category="Stores">
			<h1><span>Stores</span></h1>
		</section>
		<section id="fifth" class="catagory" data-category="Living">
			<h1><span>Living</span></h1>
		</section>
		<section id="sixth" class="catagory" data-category="Other">
			<h1><span>Other</span></h1>
		</section>

	</div>

	<hr class="spacer" />
	<img src="{{ 'images/bestof/images/vote-button.png'|asset }}" data-submit id="submit-vote" title="Vote" style="cursor:pointer; display:block; margin-left:122px; margin-top:20xp;" />

	<hr class="spacer" />

	<div id="disqus_thread"></div>
	<script type="text/javascript">
		var disqus_shortname = 'statenews';
		var disqus_identifier = 'bestof12';

		/* * * DON'T EDIT BELOW THIS LINE * * */
		(function() {
			var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;
			dsq.src = 'http://' + disqus_shortname + '.disqus.com/embed.js';
			(document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
		})();
	</script>
	<noscript>Please enable JavaScript to view the <a href="http://disqus.com/?ref_noscript">comments powered by Disqus.</a></noscript>
	<a href="http://disqus.com" class="dsq-brlink">Comments powered by <span class="logo-disqus">Disqus</span></a>
</section>


</div>
<div class="grid_4">
	{% include 'gryphon/main/sidebar-standard.tpl' %}
</div>
<hr class="spacer" />

{% endblock %}