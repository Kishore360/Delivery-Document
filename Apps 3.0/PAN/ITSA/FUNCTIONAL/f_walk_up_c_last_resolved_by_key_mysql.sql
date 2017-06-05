
 
 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_walk_up_c.closed_by_key' ELSE 'SUCCESS' END as Message
 FROM pan_mdsdb.u_walk_up_final SRC
 LEFT JOIN pan_mdwdb.f_walk_up_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  ) LEFT JOIN pan_mdwdb.d_internal_contact LKP 
on (LKP.row_id = COALESCE(CONCAT('INTERNAL_CONTACT~',SRC.u_resolved_by),'UNSPECIFIED')) 
 WHERE COALESCE(LKP.row_key,case when SRC.u_resolved_by is null then 0 else -1 end )<>(TRGT.last_resolved_by_key)
 
 
 