{{ config( materialized='incremental', unique_key='customer_id',group='groupA' ) }}

with customer as (
select
        customer_id,
        nation_id,
        name,
        address,
        phone_number,
        account_balance,
        market_segment,
        comment
from {{ ref('stg_customers') }}

{% if is_incremental() %}

    where customer_id <= {{var('cid')}}

{% endif %}

)

select * from customer