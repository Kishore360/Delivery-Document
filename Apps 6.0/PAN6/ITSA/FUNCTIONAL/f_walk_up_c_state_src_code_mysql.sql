
 
  SELECT 
 CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_walk_up_c.state_src_code' ELSE 'SUCCESS' END as Message 
 FROM 
 (Select count(1) as cnt
 FROM pan6_mdsdb.u_walk_up_final SRC 
 LEFT JOIN pan6_mdwdb.f_walk_up_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE(SRC.state,'UNSPECIFIED')<>TRGT.state_src_code)temp;
 
 
 