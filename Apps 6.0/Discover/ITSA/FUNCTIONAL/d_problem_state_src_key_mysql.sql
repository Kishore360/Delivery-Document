SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_problem.change_state_c_key' ELSE 'SUCCESS' END as Message 
FROM discover_mdsdb.problem_final  SRC left 
JOIN discover_mdwdb.d_problem TRGT ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id )  
LEFT JOIN discover_mdwdb.d_lov LKP
 ON ( concat( 'STATE~problem~' ,upper( SRC.state)) = LKP.row_id AND SRC.sourceinstance = LKP.source_id ) 
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.state IS NULL THEN 0 else -1 end)<> (TRGT.state_src_key)  and SRC.cdctype='X';
 
 
