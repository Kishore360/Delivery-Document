SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_software_c.short_description' ELSE 'SUCCESS' END as Message
 FROM (select count(1) as cnt from bbandt_mdsdb.cmdb_ci_spkg_final SRC 
 LEFT JOIN bbandt_mdwdb.d_software_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( SRC.short_description,'UNSPECIFIED')<> TRGT.short_description
 and SRC.CDCTYPE<>'D' and TRGT.soft_deleted_flag='N')ma