{{ config(pre_hook = "alter session set query_tag = 'tag_test'" ) }}


with
    tablename as (
        select 
        r_regionkey as region_id, 
        r_name as name, 
        r_comment as comment
        from {{ source("src","regions") }}  )

select * from tablename
