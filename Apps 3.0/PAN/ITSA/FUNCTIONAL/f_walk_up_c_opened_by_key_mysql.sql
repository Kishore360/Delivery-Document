 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_walk_up_c.opened_by_key' ELSE 'SUCCESS' END as Message
 FROM pan_mdsdb.u_walk_up_final SRC
 JOIN pan_mdwdb.f_walk_up_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  ) 
LEFT JOIN pan_mdwdb.d_internal_contact LKP 
on LKP.row_id = concat('INTERNAL_CONTACT~',SRC.opened_by) and LKP.source_id=SRC.sourceinstance
 WHERE COALESCE(LKP.row_key,case when SRC.opened_by is null then 0 else -1 end ) <> (TRGT.opened_by_key)
 