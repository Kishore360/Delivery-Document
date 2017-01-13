SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.dormant_flag' ELSE 'SUCCESS' END as Message
FROM nbcu_mdsdb.incident_final SRC 
  JOIN nbcu_mdwdb.d_lov LKP 
  ON COALESCE(CONCAT('TIER_4_C~INCIDENT~~~',UPPER(SRC.u_tier_4)),'UNSPECIFIED') =LKP.row_id  AND SRC.sourceinstance= LKP.source_id 
  JOIN nbcu_mdwdb.f_incident TRGT 
  ON (SRC.sys_id=TRGT.row_id  AND SRC.sourceinstance= TRGT.source_id) 
  where TRGT.time_in_seconds_c <>coalesce(LKP.row_key,case WHEN SRC.u_tier_4 is null then 0 else -1 end)
  AND DATE_FORMAT(TRGT.pivot_date, '%Y-%m-%d %H:%i:%s') BETWEEN effective_from AND effective_to
  
  