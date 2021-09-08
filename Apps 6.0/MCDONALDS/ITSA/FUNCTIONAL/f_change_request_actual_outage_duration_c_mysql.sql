SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_change_request.actual_outage_duration_c' ELSE 'SUCCESS' END as Message 
FROM mcd_mdwdb.f_change_request trgt
RIGHT JOIN mcd_mdsdb.change_request_final src
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id
WHERE TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',src.u_actual_outage_duration) <>actual_outage_duration_c
;
