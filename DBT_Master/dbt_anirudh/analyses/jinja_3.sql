{% set bikes = ["Yezdi","Jawa", "Bajaj", "Hero", "Yamaha"] %}

{% for i in bikes %}
    {% if i != "Jawa" %}
        {{i}}
    {% else %}
        I have {{i}}
    {% endif %}
{% endfor %}