

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_problem.opened_on' ELSE 'SUCCESS' END as Message
  FROM ( SELECT * FROM fidelity_mdsdb.problem_final WHERE CDCTYPE<>'D') SRC 
 LEFT JOIN fidelity_mdwdb.d_problem TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 WHERE convert_tz(SRC.opened_at,'UTC','US/Central') <> TRGT.opened_on 
