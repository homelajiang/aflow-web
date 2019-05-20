{% extends "layout.tpl" %}
{% block content %}
{% if post %}
<div class="post">
    <h2 class="post-title">{{post.title}}</h2>
    <div class="post-meta">
      <span class="post-date">
        {{post.publish_date}}
      </span>
        <!--<span class="post-author">WrittenBy Elliot</span>-->
    </div>

    <!--Tags-->
    {% if post.tags.length>0 %}
    <span class="post-tags">
        {% for tag in post.tags %}
            #<a href="/tag/{{tag.name}}">{{tag.name}}</a>&nbsp;&nbsp;
        {% endfor %}
      </span>
    {% endif %}
    <!--Cover-->

    <!--    {% if post.cover %}
        <img src="{{post.cover}}" class="post-cover"/>
        {% endif %}-->
    <!--content-->
    <div class="post-content">
        {% markdown %}
        {{post.content | safe}}

        {% endmarkdown %}
    </div>

    {% if showAround %}
    <!--pagination-->
    <div class="pagination">
        <div class="pagination__title">
            <span class="pagination__title-h">READ OTHER POSTS</span>
            <hr/>
        </div>
        <div class="pagination__buttons">
            {% if previous %}
            <span class="button previous" style="background: transparent;">
            <a href="/post/{{previous.id}}">
                <span class="button__icon">←</span>
                <span class="button__text">{{previous.title}}</span>
            </a>
         </span>
            {% endif %}

            {% if next %}
            <span class="button next" style="background: transparent;">
            <a href="/post/{{next.id}}">
                <span class="button__text">{{next.title}}</span>
                <span class="button__icon">→</span>
            </a>
            </span>
            {% endif %}
        </div>
    </div>
    {% endif %}

    <div class="comments">
        <div class="comments-divider">
            <h3>评论（{{comments.count}}）</h3>
        </div>

        {% for comment in comments.list %}
        <div class="comment">
            <img class="comment-avatar"
                 src="{{comment.creator.img if comment.creator.img else '/public/img/default_avatar.png'}}">
            <div>
                <div>
                    <span class="comment-name">{{comment.creator.name}}</span>&nbsp;
                    <span class="comment-datetime">{{comment.create_date}}</span>
                </div>

                <div class="comment-content">
                    {{comment.content}}
                </div>
            </div>
        </div>

        {% else %}

        <div style="text-align: center;">暂无评论</div>

        {% endfor %}


        {% if post.open_comment %}
        <div class="">
            <div class="comments-divider">
                <h3>发表评论</h3>
                （电子邮件地址不会被公开）
            </div>

            <form action="{{'/post/'+post.id}}" method="post">

                <div>
                    <label>评论内容
                        <span class="required">*</span>
                    </label>
                </div>

                <textarea rows="8" name="content" class="comments-textarea"></textarea>

                <div>
                    <div class="comments-label">
                        <label>你的名称
                            <span class="required">*</span>
                        </label>
                    </div>
                    <input class="comments-input" name="name" size="30">
                </div>

                <div>
                    <div class="comments-label">
                        <label>电子邮箱
                            <span class="required">*</span>
                        </label>
                    </div>
                    <input class="comments-input" size="30" name="email">
                </div>

                <div>
                    <div class="comments-label">
                        <label>个人站点</label>
                    </div>
                    <input class="comments-input" size="30" name="host">
                </div>

                <input class="comments-submit" type="submit" value="发表评论">

            </form>
        </div>
        {% else %}
        <div>**该文章禁止评论**</div>
        {% endif %}

    </div>

</div>

</div>
{% else %}

<h2 class="post-title">The Post Not Found.</h2>

{% endif %}
{% endblock %}
