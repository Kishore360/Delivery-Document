
			
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message 
from  mcd_mdsdb.cmdb_ci_final ci
			left join mcd_mdwdb.d_calendar_date d 
on 			DATE_FORMAT(CONVERT_TZ(ci.sys_created_on,'GMT','US/Central'),'%Y%m%d')=d.row_id
			join mcd_mdwdb.f_ci_related_application_component_c d1
			on ci.sys_id=d1.row_id
			where coalesce(d.row_key,case when ci.sys_created_on is null then 0 else -1 end )<>created_on_key
			
			