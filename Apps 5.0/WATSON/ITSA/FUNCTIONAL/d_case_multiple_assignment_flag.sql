SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.multiple_assignment_flag' ELSE 'SUCCESS' END as Message
 FROM watson_mdsdb.sn_customerservice_case_final SRC 
 LEFT JOIN watson_mdwdb.d_case TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 WHERE TRGT.row_key not in (0, -1) and 
COALESCE( CASE WHEN TRGT.reassignment_count_numerify >= 1 then 'Y' else 'N' END ,'')<> COALESCE(TRGT.multiple_assignment_flag ,'')
