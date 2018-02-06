
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt>0 THEN 'MDS to DWH data validation failed for f_incident.impact_src_code' 
ELSE 'MDS to DWH data validation passed for f_incident.impact_src_code' END as Message from 
(select count(1) cnt 
FROM gilead_mdsdb.change_request_final SRC 
JOIN gilead_mdwdb.d_change_request TRGT 
ON SRC.sys_id = TRGT.row_id 
and  SRC.sourceinstance = TRGT.source_id   and TRGT.soft_deleted_flag = 'N'
WHERE COALESCE( SRC.u_outcome_notes,'UNSPECIFIED') <> COALESCE(TRGT. u_outcome_notes_c ,''))b





