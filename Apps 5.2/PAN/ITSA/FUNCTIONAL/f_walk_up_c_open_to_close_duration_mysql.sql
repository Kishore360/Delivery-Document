SELECT CASE WHEN cnt THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt THEN 'MDS to DWH data validation failed for f_walk_up_c.open_to_resolve_duration' ELSE 'SUCCESS' END as
 Message from (select count(1) cnt 
 FROM pan_mdsdb.u_walk_up_final SRC
  JOIN pan_mdwdb.f_walk_up_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
JOIN pan_mdwdb.d_walk_up_c LKP 
 ON (SRC.sys_id =LKP.row_id  
 AND SRC.sourceinstance= LKP.source_id  )
 AND TIMESTAMPDIFF(SECOND,LKP.opened_on,LKP.closed_on)  <> TRGT.open_to_close_duration)b
 
 
 