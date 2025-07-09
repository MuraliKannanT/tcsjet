{% test lesservalues(model, column_name, pk_name, threshold=100) %}
with ttable as (
    select * from {{ model }} )
 
select {{ pk_name }} id, sum({{column_name}}) total from ttable
group by 1
having (total<={{ threshold }})
{% endtest %}
