{% extends "layout.tpl" %}
{% block content %}

<div class="posts post on-list">

    <div>
        <h3>{{tags.length}} tags in total</h3>
        <div class="post-meta">
            {% for tag in tags %}
            <a class="more-meta" href="/tag/{{tag.name}}">
                {{tag.name}}</a>&nbsp;&nbsp;&nbsp;&nbsp;

            {% else %}

            {{ __('no_tags_found') }}

            {% endfor %}
        </div>
    </div>

    <div style="margin-bottom: 40px;">
        <h3>{{categories.length}} categories in total</h3>
        <div class="post-meta">
            {% for cate in categories %}
            <a class="more-meta" href="/categories/{{cate.name}}">
                {{cate.name}}</a>&nbsp;&nbsp;&nbsp;&nbsp;

            {% else %}

            {{ __('no_categories_found') }}

            {% endfor %}
        </div>
    </div>


</div>

{% endblock %}
