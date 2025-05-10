{% macro date_formatting(date_column) %}
  (CAST({{ date_column }} AS DATE))
{% endmacro %}
