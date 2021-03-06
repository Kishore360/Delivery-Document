 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_task.business_service_c_key' ELSE 'SUCCESS' END as Message
from
 rambus_mdwdb.f_request_task a
join rambus_mdsdb.sc_task_final b
on a.row_id=b.sys_id and a.source_id=b.sourceinstance
join rambus_mdwdb.d_application stg
							on stg.row_id = coalesce(b.u_business_service,'UNSPECIFIED')

where business_service_c_key<>case when b.u_business_service is null then 0 else stg.row_key end;