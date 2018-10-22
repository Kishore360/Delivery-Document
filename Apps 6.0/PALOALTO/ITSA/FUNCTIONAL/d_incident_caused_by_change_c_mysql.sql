SELECT CASE WHEN cnt THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt THEN 'MDS to DWH data validation failed for d_incident.caused_by_change_flag' ELSE 'SUCCESS' END as Message from (select count(1) cnt 
 FROM (select * from paloalto_mdsdb.incident_final where cdctype<>'D') SRC 
  JOIN  paloalto_mdwdb.d_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
  where TRGT.soft_deleted_flag='N' and  CASE WHEN SRC.caused_by is not null then 'Y' else 'N' END<> (TRGT.caused_by_change_flag ))b
