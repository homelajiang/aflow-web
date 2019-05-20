{% extends "layout.tpl" %}
{% block content %}

<div class="post">
    {% for archive in list %}
    <section id="archive" class="archive">
        <div class="archive__group-year-header">
            <h2>{{archive._id}}</h2>
        </div>
        {% for post in archive.posts %}
        <div class="archive__post">
            <span class="archive__post-date">
                {{post.publish_date | date('MM-DD') }}
            </span>
            <span class="archive__post-title">
              <a href="/post/{{post.id}}" class="archive-post-link">
                  {{post.title}}
              </a>
            </span>
        </div>

        {% else %}

        <div>没有相关数据</div>

        {% endfor %}

    </section>

    {% else %}
    <h2>{{error}}</h2>
    {% endfor %}
</div>

{% if hasPrePage or hasNextPage %}
<!--pagination-->
<div class="pagination">
    <div class="pagination__buttons">
        {% if hasPrePage %}
        <span class="button previous">
        <a href="/page/{{prePage}}">
          <span class="button__icon">←</span>
          <span class="button__text">Newer posts</span>
        </a>
      </span>
        {% endif %}

        {% if hasNextPage %}
        <span class="button next">
        <a href="/page/{{nextPage}}">
<!--            todo 按钮样式问题-->
          <span class="button__text">Older posts</span>
          <span class="button__icon">→</span>
        </a>
      </span>
        {% endif %}
    </div>
</div>
<!--pagination-->
{% endif %}

{% endblock %}
