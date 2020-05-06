 SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_service.name' 
ELSE 'SUCCESS' END as Message 
from equifax_mdsdb.u_maintenance_window_final src
 left join equifax_mdwdb.d_maintenance_window_c t on src.sys_id=t.row_id and src.sourceinstance=t.source_id
where coalesce(src.u_business_service,'UNSPECIFIED')<>t.business_service_c and src.cdctype<>'D'
;


