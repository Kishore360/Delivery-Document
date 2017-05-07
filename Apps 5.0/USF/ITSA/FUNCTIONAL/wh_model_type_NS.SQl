 select case when count(1) > 0 then 'Failure' else 'Success'  end as Result , 
 CASE WHEN count(1) >0 THEN 'Unknown and Unspecifiedd records for d_product_model doesnt have Non-Standard' ELSE 'SUCCESS' END as Message
from usf_mdsdb.cmdb_model_final a
 left join 
usf_mdwdb.d_product_model b
on a.sys_id=b.row_id and a.sourceinstance=b.source_id
where wh_model_type <>'Standard'

