SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.caused_by_change_key' ELSE 'SUCCESS' END as Message
 FROM (select count(1) as cnt from bbandt_mdsdb.incident_final SRC 
  JOIN bbandt_mdwdb.f_incident TRGT ON (SRC.sys_id =TRGT.row_id AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN bbandt_mdwdb.d_change_request LKP ON ( SRC.u_caused_by_change_number= LKP.row_id AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_caused_by_change_number IS NULL THEN 0 else -1 end)<> TRGT.caused_by_change_key and SRC.CDCTYPE<>'D' and TRGT.soft_deleted_flag='N')ma;