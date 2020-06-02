 select case when count(1) > 0 then 'Failure' else 'Success'  end as Result , 
 CASE WHEN count(1) >0 THEN 'Unknown and Unspecifiedd records for d_product_model doesnt have Non-Standard' ELSE 'SUCCESS' END as Message
from(select
 wh_model_type from #DWH_TABLE_SCHEMA.d_product_model
where row_key in (0 ,-1) and wh_model_type Not in ('Non-Standard')
) a