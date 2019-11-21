SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.dormant_flag' ELSE 'SUCCESS' END as Message
FROM wpl_mdsdb.incident_final SRC 
  JOIN wpl_mdwdb.d_lov LKP 
  ON COALESCE( CONCAT('CONTACT_TYPE','~','INCIDENT','~',upper(SRC.contact_type)),'UNSPECIFIED') =LKP.row_id  AND SRC.sourceinstance= LKP.source_id 
  JOIN wpl_mdwdb.f_incident TRGT 
  ON (SRC.sys_id=TRGT.row_id  AND SRC.sourceinstance= TRGT.source_id )
  where TRGT.reported_type_src_key <>coalesce(LKP.row_key,case WHEN SRC.contact_type is null then 0 else -1 end)
  AND DATE_FORMAT(TRGT.pivot_date, '%Y-%m-%d %H:%i:%s') BETWEEN effective_from AND effective_to and SRC.cdctype='X'