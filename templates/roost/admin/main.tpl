{% block title %}Housing Guide{% endblock %}

{% block current %}roostadmin{% endblock %}

{% extends 'admin/base.tpl' %}

{% block toolbar %}
	<a href="{{ 'roost:admin/edit'|url }}" icon="{{ 'gAssets/img/icons/page_white_add.png'|url }}">New</a>
	
	<a href="{{ 'roost:admin/delete'|url }}#roost:property" icon="{{ 'gAssets/img/icons/page_white_delete.png'|url }}" disable="true" enable-on-select="true" id="action_deleteItems">Delete</a>
	
	<div>
		<a href="{{ 'roost:admin/publish'|url }}#roost:property" icon="{{ 'gAssets/img/icons/page_white_go.png'|url }}" disable="true" enable-on-select="true" id="action_setPublish">Publish</a>
		<a href="{{ 'roost:admin/publish'|url }}#roost:property" icon="{{ 'gAssets/img/icons/page_white_unpublish.png'|url }}" disable="true" enable-on-select="true" id="action_setUnpublish">Un-publish</a>
	</div>
	
{% endblock %}

{% block content %}
{% import 'admin/formatters.tpl' as formatters %}

<div class="grid_12">
	<div class="blue cap">
			Properties
			<span>
				{% if pagination.getPrevious %}
					<a class="prev" href="{{ pagination.getPrevious.url }}">Prev</a>
				{% endif %}
				{% for page in pagination.getPages %}
					{% if page.isCurrent %}
						<a href="#" class="currentpage">{{ page.label }}</a>
					{% else %}
						<a href="{{ page.url }}">{{ page.label }}</a>
					{% endif %}
				{% endfor %}
				{% if pagination.getNext %}
					<a class="next" href="{{ pagination.getNext.url }}">Next</a>
				{% endif %}
			</span>
	</div>
	
	<table class="sortable">
		<thead>
			<tr>
				<th class="table-th-nosort"><input type="checkbox" /></th>
				<th class="col_name">Name</th>
				<th>Address</th>
				<th class="col_owner">Owner</th>
				<th class="col_modified">Last Modified</th>
				<th>Status</th>
			</tr>
		</thead>
		<tbody>
		{% for property in properties %}
		<tr id="item_{{ property.uid }}">
			<td><input type="checkbox" name="items[]" value="{{ property.uid }}" /></td>
			<td class="col_name"><a href="{{ ('roost:admin/edit/'~property.uid)|url }}">{{ property.name }}</a></td>
			<td><a href="{{ ('roost:admin/edit/'~property.uid)|url }}">{{ property.address }}</a></td>
			<td class="col_owner"><a href="{{ ('roost:admin/owner/'~property.propertyOwners[0].uid)|url }}">{{ property.propertyOwners[0].name }}</a></td>
			<td class="col_modified">{{ property.modified|timeSince }}</td>
			<td class="col_status">{{ formatters.status(property.status) }}</td>
		</tr>
		{% endfor %}
		</tbody>
	</table>
</div>

{% endblock %}