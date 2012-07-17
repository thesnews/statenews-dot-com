{% block title %}Housing Guide{% endblock %}

{% block current %}roostadmin{% endblock %}

{% extends 'admin/base.tpl' %}

{% block toolbar %}
	<a href="{{ 'roost:admin/owner'|url }}" icon="{{ 'gAssets/img/icons/page_white_add.png'|url }}">New</a>
	
	<a href="{{ 'roost:admin/delete'|url }}#roost:propertyOwner" icon="{{ 'gAssets/img/icons/page_white_delete.png'|url }}" disable="true" enable-on-select="true" id="action_deleteItems">Delete</a>
	
{% endblock %}

{% block content %}
{% import 'admin/formatters.tpl' as formatters %}

<div class="grid_12">
	<div class="blue cap">
			Property Owners
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
				<th>Email</th>
				<th>Company</th>
				<th>Max Active</th>
				<th>Status</th>
			</tr>
		</thead>
		<tbody>
		{% for owner in owners %}
		<tr id="item_{{ owner.uid }}">
			<td><input type="checkbox" name="items[]" value="{{ owner.uid }}" /></td>
			<td class="col_name"><a href="{{ ('roost:admin/owner/'~owner.uid)|url }}">{{ owner.name }}</a></td>
			<td><a href="{{ ('roost:admin/owner/'~owner.uid)|url }}">{{ owner.email }}</a></td>
			<td>{{ owner.company }}</td>
			<td>{{ owner.max_active }}</td>
			<td>{% if owner.status %}<span class="active">Active{% else %}<span class="inactive">Inactive{% endif %}</span></td>
		</tr>
		{% endfor %}
		</tbody>
	</table>
</div>

{% endblock %}