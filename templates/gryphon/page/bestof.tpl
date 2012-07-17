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
			<ol>

			<ol>
				<li><strong>Best Overall Restaurant</strong> - Sansu Sushi</li>
				<li><strong>Best Pizza</strong> - Pizza House</li>
				<li><strong>Best Burger</strong> - The Peanut Barrel</li>
				<li><strong>Best Wings</strong> - Buffalo Wild Wings</li>
				<li><strong>Best Sushi</strong> - Sansu Sushi</li>
				<li><strong>Best Chinese</strong> - P.F. Chang’s</li>
				<li><strong>Best Thai</strong> - No Thai</li>
				<li><strong>Best Mexican</strong> - El Azteco</li>
				<li><strong>Best Italian - Bravo</li>
				<li><strong>Best Dessert</strong> - MSU Dairy Store</li>
				<li><strong>Best Sandwich Place</strong> - Jimmy John’s</li>
				<li><strong>Best Breakfast Place</strong> - Golden Harvest (Tony’s lost by 1 vote)</li>
				<li><strong>Best Steakhouse</strong> - Outback Steakhouse</li>
				<li><strong>Best Late Night</strong> - Menna’s Joint</li>
				<li><strong>Best Restaurant for a Date</strong> - Sansu Sushi</li>
				<li><strong>Best Place to Eat OnCampus</strong> - Brody Square</li>
				<li><strong>Best Coffee House</strong> - Biggby </li>
				<li><strong>Best Place to Be Spoiled By Your Parents</strong> - P.F. Chang’s</li>
				<li><strong>Best Meal under $5</strong> - The Peanut Barrel</li>
				<li><strong>Best Bakery</strong> - Grand Traverse Pie Co.</li>
				<li><strong>Best Place to Take A Date </li>
			</ol>
		</section>
		<section id="second" class="catagory" data-category="Drinks">
			<h1><span>Drinks</span></h1>
			<ol>
				<li><strong>Best Happy Hour/Drink Specials</strong> - Harper’s</li>
				<li><strong>Best Cocktail</strong> - The Peanut Barrel</li>
				<li><strong>Best Margarita</strong> - Los Tres Amigos</li>
				<li><strong>Best East Lansing Bar</strong> - Harper’s</li>
				<li><strong>Best Lansing Bar</strong> - Rum Runners </li>
				<li><strong>Best Dance Spot</strong> - Rick’s</li>
				<li><strong>Best Karaoke</strong> - Crunchy’s </li>
			</ol>
		</section>
		<section id="third" class="catagory" data-category="Services">
			<h1><span>Services</span></h1>
			<ol>
				<li><strong>Best Salon/Spa</strong> - Douglas J Aveda Institute</li>
				<li><strong>Best Tanning Salon</strong> - Bronze Bay Tanning</li>
				<li><strong>Best Gym</strong> - IM West</li>
				<li><strong>Best Massage</strong> - Massage & Wellness</li>
				<li><strong>Best Bike/Scooter Shop</strong> - MSU Bikes Service Center</li>
			</ol>
		</section>
		<section id="fourth" class="catagory" data-category="Stores">
			<h1><span>Stores</span></h1>
			<ol>
				<li><strong>Best Grocery Store - Meijer</li>
				<li><strong>Best Organic Store</strong> - Foods for Living</li>
				<li><strong>Best Party Store</strong> - Quality Dairy</li>
				<li><strong>Best Bookstore</strong> - Student Book Store</li>
				<li><strong>Best Cell Phone Service - Verizon</li>
				<li><strong>Best Flowershop</strong> - B/A Florist</li>
				<li><strong>Best Sporting Goods Store</strong> - Dick’s Sporting Goods</li>
				<li><strong>Best Clothing Store</strong> - Urban Outfitters</li>
				<li><strong>Best Home Décor Store</strong> - Bed, Bath & Beyond</li>
				<li><strong>Best Vintage/Thrift Store - Goodwill</li>
				<li><strong>Best Shoe Store - DSW</li>
				<li><strong>Best Craft/Hobby Store</strong> - Hobby Lobby</li>
			</ol>
		</section>
		<section id="fifth" class="catagory" data-category="Living">
			<h1><span>Living</span></h1>
			<ol>
				<li><strong>Best On Campus Housing</strong> - Brody Complex</li>
				<li><strong>Best Apartment Complex</strong> - DTN Communities </li>
			</ol>
		</section>
		<section id="sixth" class="catagory" data-category="Other">
			<h1><span>Other</span></h1>
			<ol>
				<li><strong>Best Theater</strong> - NCG Cinemas</li>
				<li><strong>Best Place to Study</strong> - Main Library</li>
				<li><strong>Best Bank</strong> - MSU Federal Credit Union</li>
				<li><strong>Best MSU Merchandise</strong> - Student Book Store</li>
				<li><strong>Best New Business</strong> - What Up Dawg?</li>
				<li><strong>Best Unique Business</strong> - The Record Lounge</li>
				<li><strong>Best Hidden Gem</strong> - MSU Dairy Store</li>
				<li><strong>Best Student Publication</strong> - The State News</li>
			</ol>
		</section>

	</div>

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