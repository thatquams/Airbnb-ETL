{% macro date_formatting(date_column) %}
    TO_DATE({{ date_column }})
{% endmacro %}
