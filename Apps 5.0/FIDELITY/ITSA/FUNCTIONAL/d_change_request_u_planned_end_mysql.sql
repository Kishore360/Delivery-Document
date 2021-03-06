SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_change_request.planned_end_on' 
ELSE 'MDS to DWH data validation passed for d_change_request.planned_end_on' END as Message from 
(select count(1) cnt 
FROM fidelity_mdsdb.change_request_final SRC 
JOIN fidelity_mdwdb.d_change_request TRGT 
ON SRC.sys_id = TRGT.row_id 
and  SRC.sourceinstance = TRGT.source_id   and TRGT.soft_deleted_flag = 'N'
WHERE COALESCE( convert_tz(SRC.u_planned_end_date,'GMT','America/New_York'),'') <> COALESCE(TRGT.planned_end_on ,''))b





