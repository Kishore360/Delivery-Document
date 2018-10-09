
 
 
 
 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_walk_up_c.closed_by_key' ELSE 'SUCCESS' END as Message
 FROM pan6_mdsdb.u_walk_up_final SRC
  JOIN pan6_mdwdb.f_walk_up_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  ) LEFT JOIN pan6_mdwdb.d_internal_contact LKP 
on (LKP.row_id = concat('INTERNAL_CONTACT~',coalesce(SRC.closed_by,sys_updated_by)) )
 WHERE length(LKP.row_id)>=49  and    COALESCE(LKP.row_key)<>(TRGT.closed_by_key)