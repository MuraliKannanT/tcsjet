{{ config(alias='int_customer_orders',group='groupA')}}
with tablenew as 
(select c.customer_id, 
sum(o.total_price) as price, 
count(o.order_id) as t_orders,
max(o.order_date) date 
from {{ref("stg_customers")}} c  join {{ref("stg_orders")}}  o on c.customer_id = o.customer_id
where c.customer_id <= 3000
group by 1)

select * from tablenew
