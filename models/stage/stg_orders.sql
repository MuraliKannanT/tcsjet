with source as (

    select * from {{ source('src', 'orders') }}

),

changed as (

    select

        -- ids
        o_orderkey as order_id,
        o_custkey as customer_id,
        
        -- descriptions
        o_comment as comment,
        o_clerk as clerk_name,

        -- numbers
        o_totalprice{{money()}} as total_price,
        {{dol_eur('o_totalprice',3)}} as price_euros,
        -- statuses
        o_orderstatus as status_code,
        o_orderpriority as priority_code,
        o_shippriority as ship_priority,

        -- dates
        o_orderdate as order_date

    from source

)

select * from changed