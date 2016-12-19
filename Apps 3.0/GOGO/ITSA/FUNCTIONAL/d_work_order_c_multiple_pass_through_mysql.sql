SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.opened_by_key' ELSE 'SUCCESS' END as Message
 FROM 
FROM gogo_mdsdb.wm_order_final i
join gogo_mdwdb.d_work_order_c d on sys_id=row_id and sourceinstance=source_id where
CONVERT_TZ(i.due_date,'GMT','America/Chicago') <> DUE_ON
CONVERT_TZ(i.expected_start,'GMT','America/Chicago') <>  EXPECTED_START_ON
case when (i.u_preventative_maintenance = 1 then 'Y' else 'N' end   <> PREVENTATIVE_MAINTENANCE_FLAG