SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.opened_by_key' ELSE 'SUCCESS' END as Message
  
FROM gogo_mdsdb.wm_order_final i
join gogo_mdwdb.d_work_order_c d on sys_id=row_id and sourceinstance=source_id where
CONVERT_TZ(i.due_date,'GMT','America/Chicago') <> DUE_ON or 
CONVERT_TZ(i.expected_start,'GMT','America/Chicago') <>  EXPECTED_START_ON or 
case when i.u_preventative_maintenance = 1 then 'Y' else 'N' end   <> PREVENTATIVE_MAINTENANCE_FLAG or
CREATED_BY	<>	sys_created_by	or
CHANGED_BY	<>	sys_updated_by	or
CREATED_ON	<>	convert_tz(sys_created_on,'GMT','America/Chicago')	or
CHANGED_ON	<>	convert_tz(sys_updated_on,'GMT','America/Chicago')	or
CDCTYPE	<>	CDCTYPE	