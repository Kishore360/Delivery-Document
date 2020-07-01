SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
FROM (select count(1) as cnt  from truist_mdsdb.incident_final SRC 
 LEFT JOIN truist_mdwdb.d_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE ( CASE WHEN SRC.rfc is not null then 'Y' else 'N' END)<> TRGT.change_flag
 and SRC.CDCTYPE<>'D' and TRGT.soft_deleted_flag='N')ma