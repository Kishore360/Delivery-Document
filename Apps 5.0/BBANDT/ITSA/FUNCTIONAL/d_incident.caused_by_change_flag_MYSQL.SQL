
SELECT CASE WHEN cnt> 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_incident.caused_by_change_flag' ELSE 'SUCCESS' END as Message
 FROM(select count(1) as cnt from  bbandt_mdsdb.incident_final SRC 
  JOIN bbandt_mdwdb.d_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE ( CASE WHEN SRC.u_caused_by_change_number is not null then 'Y' else 'N' END)<> TRGT.caused_by_change_flag
 and SRC.CDCTYPE<>'D' and TRGT.soft_deleted_flag='N')ma
