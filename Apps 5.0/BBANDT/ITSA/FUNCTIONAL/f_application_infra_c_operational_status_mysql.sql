select case when count(1)>1 then 'FAILURE'  else 'SUCCESS'  END as result ,
CASE WHEN count(1)>1 then 'Data mismatch for f_application_infra_c.operational_status'  ELSE 'SUCCESS'  END as Message
from  bbandt_mdsdb.v_app_to_server_to_product_final a11
join bbandt_mdwdb.f_application_infra_c a12 on 
(concat(a11.app_id,'~',a11.app_name,'~',a11.infra_resource_name,'~',a11.source)=a12.row_id and a11.sourceinstance=a12.source_id)
where COALESCE(a11.operational_status,'UNSPECIFIED')<>a12.operational_status
and a11.cdctype='X';