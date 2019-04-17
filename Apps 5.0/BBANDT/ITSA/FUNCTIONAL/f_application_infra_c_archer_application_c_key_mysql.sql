select case when count(1)>1 then 'FAILURE'  else 'SUCCESS'  END as result ,
CASE WHEN count(1)>1 then 'Data mismatch for f_application_infra_c.archer_application_c_key'  ELSE 'SUCCESS'  END as Message
from  bbandt_mdsdb.v_app_to_server_to_product_final a11
join bbandt_mdwdb.f_application_infra_c a12 on 
(concat(a11.app_id,'~',a11.infra_resource_name,'~',a11.source)=a12.row_id and a11.sourceinstance=a12.source_id)
join bbandt_mdwdb.d_archer_application_c a13
on (a11.app_id=a13.row_id )
where coalesce(a13.row_key, case when a11.app_name is null then 0 else -1 end)<>a12.archer_application_c_key;