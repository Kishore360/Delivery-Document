

SELECT CASE WHEN cnt THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt THEN 'MDS to DWH data validation failed for d_incident.multiple_assignment_flag' ELSE 'SUCCESS' END as Message from (select count(1) cnt  from
  #MDS_TABLE_SCHEMA.incident_final SRC 
  JOIN #DWH_TABLE_SCHEMA.d_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE ( CASE WHEN SRC.reassignment_count >= 1 then 'Y' else 'N' END)<> (TRGT.multiple_assignment_flag )
)b