 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_problem.close_notes' ELSE 'SUCCESS' END as Message
 FROM ( SELECT * FROM tjxco_mdsdb.problem_final WHERE CDCTYPE<>'D') SRC 
 LEFT JOIN tjxco_mdwdb.d_problem TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 WHERE COALESCE( SRC.u_root_cause_analysis ,'')<> TRGT.u_root_cause_analysis_c;