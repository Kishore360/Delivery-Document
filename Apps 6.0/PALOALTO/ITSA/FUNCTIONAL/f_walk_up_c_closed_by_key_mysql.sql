 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_walk_up_c.closed_by_key' ELSE 'SUCCESS' END as Message
 FROM paloalto_mdsdb.u_walk_up_final SRC
  JOIN paloalto_mdwdb.f_walk_up_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  ) LEFT JOIN paloalto_mdwdb.d_internal_contact LKP 
on (LKP.row_id = concat('INTERNAL_CONTACT~',coalesce(SRC.closed_by,sys_updated_by,'UNSPECIFIED'),'UNSPECIFIED') AND LKP.source_id=SRC.sourceinstance) 
 WHERE COALESCE(LKP.row_key,case when SRC.closed_by is null then 0 else -1 end)<>(TRGT.closed_by_key)
and SRC.cdctype='X'