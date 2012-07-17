{% block title %}Housing Guide{% endblock %}

{% block current %}roostadmin{% endblock %}

{% extends 'admin/base.tpl' %}

{% block toolbar %}
	<a href="{{ 'roost:admin/owner'|url }}" icon="{{ 'gAssets/img/icons/page_white_add.png'|url }}">New</a>
	
	<a href="#" icon="{{ 'gAssets/img/icons/disk.png'|url }}" class="action_saveItem" rel="entry">Save</a>
	
	<a href="{{ 'roost:admin/delete'|url }}#roost:propertyOwner" icon="{{ 'gAssets/img/icons/page_white_delete.png'|url }}" id="action_deleteItem">Delete</a>

	<a href="{{ 'roost:admin/publish'|url }}#roost:property" icon="{{ 'gAssets/img/icons/page_white_unpublish.png'|url }}" id="action_setUnpublish">Deactive all listings</a>
		
{% endblock %}

{% block content %}

{% import 'admin/blocks.tpl' as blocks %}
{% helper config %}

<form id="entry" method="post" action="{{ ('roost:admin/owner/'~owner.uid)|url }}" warn-on-modify="true">
	<input type="hidden" name="uid" id="input_uid" value="{{ owner.uid }}" />
	<div class="grid_9">
		<fieldset id="content">
			<label for="name">Name</label>
			<input id="name" name="name" type="text" value="{{ owner.name }}" />

			<label for="email">Email</label>
			<input name="email" id="input_email" type="text" value="{{ owner.email }}" />

			<label for="company">Company</label>
			<input name="company" type="text" value="{{ owner.company }}" />

			<label for="pass1"><span>Update<br />Password</span></label>
			<input name="pass1" type="password" />
			
			<label for="pass2">Verify</label>
			<input name="pass2" type="password" />

		</fieldset>

	</div>
	
<div class="grid_3">

	<fieldset id="meta">
		
		<div class="blue cap">Status</div>
		<table>
			<tr>
				<td><input type="checkbox" value="1" name="status" id="input_status"{% if owner.status == 1 %} checked="checked"{% endif %} /></td>
				<td><label for="input_status">Active account</label></td>
			</tr>
			<tr>
				<td>
					<select name="max">
					{% for i in 1|range(105, 5) %}
						{% set v = i %}
						{% if i > 1 %}
							{% set v = v - 1 %}
						{% endif %}
						<option value="{{ v }}"{% if owner.max_active == v %} selected="selected"{% endif %}>{{ v }}</option>
					{% endfor %}
					</select>
				</td>
				<td>Max active</td>
			</tr>
		</table>
		
		<div class="blue cap">
			Properties
		</div>
		<table>
			{% for property in owner.properties %}
				<tr id="item_{{ property.uid }}">
					<td><input style="display:none;" type="checkbox" name="items[]" checked="checked" value="{{ property.uid }}" /><a href="{{ ('roost:admin/edit/'~property.uid)|url }}">{{ property.name }}</a></td>
				</tr>
			{% endfor %}
		</table>
		
	</fieldset>
	
</div>

</form>

{% endblock %}