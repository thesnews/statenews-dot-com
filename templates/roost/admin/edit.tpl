{% block title %}Housing Guide{% endblock %}

{% block current %}roostadmin{% endblock %}

{% extends 'admin/base.tpl' %}

{% block scripts %}
	<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
	<script type="text/javascript" src="{{ 'roost:admin/support.js'|url }}"></script>
{% endblock %}

{% block toolbar %}
	<a href="{{ 'roost:admin/edit'|url }}" icon="{{ 'gAssets/img/icons/page_white_add.png'|url }}">New</a>
	
	<a href="#" icon="{{ 'gAssets/img/icons/disk.png'|url }}" class="action_saveItem" rel="entry">Save</a>
	
	<a href="{{ 'roost:admin/delete'|url }}#roost:property" icon="{{ 'gAssets/img/icons/page_white_delete.png'|url }}" id="action_deleteItem">Delete</a>
		
	<a href="{{ property.urlListing }}" target="_blank" icon="{{ 'gAssets/img/icons/world.png'|url }}">View This Property</a>
	
{% endblock %}

{% block content %}

{% import 'admin/blocks.tpl' as blocks %}
{% helper config %}

<form id="entry" method="post" action="{{ ('roost:admin/edit/'~property.uid)|url }}" warn-on-modify="true">
	<input type="hidden" name="uid" id="input_uid" value="{{ property.uid }}" />
	<input type="hidden" name="latlon" id="input_latlon" value="{{ property.latlon }}" />
	<div class="grid_9">
		<fieldset id="content">
			<label for="name">Name</label>
			<input id="name" name="name" type="text" value="{{ property.name }}" />
			<br /><br />
			<h3>Map</h3>
			
			<div id="canvas" style="width:100%; height:220px;" data-latlon="{{ property.latlon|default(config.get('roost:map:default:latLon')) }}"></div>
			<p class="quiet">Double-click anywhere on the map to reset the marker location.</p>
			<br /><br />
			
			<label for="street">Street</label>
			<input name="street" id="input_street" type="text" value="{{ property.street }}" />

			<label for="city">City</label>
			<input name="city" id="input_city" type="text" value="{{ property.city }}" />

			<label for="zip">Zip</label>
			<input name="zip" type="text" id="input_zip" value="{{ property.zip }}" />
			
			<label for="description">description</label>
			<textarea id="description" name="description" rows="8" class="formatable">{{ property.description }}</textarea>
			
		</fieldset>
		
		<h3>Property, Lease and Licensing</h3>
		
		This 
			<select name="type">
			{% for label in config.get('roost:property:types') %}
				<option value="{{ label }}"{% if label == property.type %} selected="selected"{% endif %}>{{ label }}</option>
			{% endfor %}
			</select>
		is
			<strong>licensed for</strong> <input type="text" size="2" name="licensed_for" value="{{ property.licensed_for }}" /> people.
		It has
			<input type="text" size="2" name="bedrooms" value="{{ property.bedrooms }}" /> <strong>bedroom(s)</strong>
		and
			<input type="text" size="2" name="bathrooms" value="{{ property.bathrooms }}" /> <strong>bathroom(s)</strong>. 

		<br /><br />

		The
			<select name="rent_type">
				{% for val,label in ['range':'rent range', 'value':'rent'] %}
					<option value="{{ val }}"{% if property.rent_type == val %} selected="selected"{% endif %}>{{ label }}</option>
				{% endfor %}
			</select>
		is
			<input type="text" size="4" name="rent_value" value="{{ property.rent }}" />
			<select name="rent_range">
				{% for label,val in config.get('roost:property:rents') %}
					<option value="{{ val }}"{% if property.rent_type == 'range' and property.rent == val %} selected="selected"{% endif %}>{{ label }}</option>
				{% endfor %}
			</select>
		per
			<select name="rent_modifier">
				{% for val,label in ['month':'month', 'person':'person per month'] %}
					<option value="{{ val }}"{% if val == property.rent_modifier %} selected="selected"{% endif %}>{{ label }}</option>
				{% endfor %}
			</select>.

		<br /><br />

		The
			<strong>lease</strong> is
			<select name="lease_duration">
			{% for label,val in config.get('roost:property:lease') %}
				<option value="{{ val }}"{% if property.lease_duration == val %} selected="selected"{% endif %}>{{ label }}</option>
			{% endfor %}
			</select>.
		<br /><br />
		
		<h3>Contact information</h3>

		Inquires about this property should be directed to 
			<input id="contact" name="contact" type="text" value="{{ property.contact }}" size="10" /> (name)
		who can be reached by 
			<strong>phone</strong> at <input id="phone" name="phone" type="text" value="{{ property.phone	 }}" size="15" />
		and/or
			<strong>email</strong> at <input id="email" name="email" type="text" value="{{ property.email }}" size="25" />.

		<br /><br />

		More information can be found at this <strong>website</strong> <input id="url" name="url" type="text" value="{{ property.url }}" size="15" />.
	
	</div>
	
<div class="grid_3">

	<fieldset id="meta">
		
		{{ blocks.status([
			'status': property.status
		]) }}
		
		<div class="blue cap">
			Owners
		</div>
		<div class="toolbar">
			<label class="autofill" for="owners">Owners</label>
				<input id="owners" type="text" class="autocomplete" rel="{{ 'roost:admin/osearch'|url }}" />
		</div>
		<table id="container_owners">
			<tr></tr> {# I have no idea, but autocomplete breaks if this isn't here #}
			{% for owner in property.propertyOwners %}
			<tr>
				<td>{{ owner.name }} <a class="delete" href="#" title="Remove Owner">Remove Owner</a><input type="hidden" name="owners[]" value="{{ owner.name }}" /></td>
			</tr>
			{% endfor %}
		</table>

		<div class="blue cap">
			Amenities
		</div>
		<table>
		{% for amenity, label in config.get('roost:amenitiesMap') %}
			<tr>
				<td><input type="checkbox" value="1" name="{{ amenity }}" id="input_{{ amenity }}"{% if property[amenity] %} checked="checked"{% endif %}/></td>
				<td><label for="input_{{ amenity }}">{{ label }}</label></td>
			</tr>
		{% endfor %}
		</table>

		
	</fieldset>
	
</div>

</form>

{% endblock %}