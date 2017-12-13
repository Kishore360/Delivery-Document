SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_project.is_rolled_up' ELSE 'SUCCESS' END as Message
 FROM qualcomm_mdsdb.pm_project_final SRC
 LEFT JOIN qualcomm_mdwdb.d_project TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 WHERE CASE WHEN SRC.rollup =1 THEN 'Y' ELSE 'N' END <> COALESCE(TRGT.is_rolled_up_flag ,'')
