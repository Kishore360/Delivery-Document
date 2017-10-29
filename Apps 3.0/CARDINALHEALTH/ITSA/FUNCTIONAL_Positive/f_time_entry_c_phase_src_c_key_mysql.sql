SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
FROM (SELECT count(1) as CNT
 FROM cardinalhealth_mdsdb.time_card_final SRC 
  JOIN cardinalhealth_mdwdb.f_time_entry_c TRGT 
 ON (SRC.sys_id =LEFT(TRGT.row_id, 32)  
 AND SRC.sourceinstance= TRGT.source_id  )
 join cardinalhealth_mdsdb.u_pm_project_phase_final c ON SRC.u_phase = c.sys_id
	AND SRC.sourceinstance = c.sourceinstance
LEFT JOIN cardinalhealth_mdwdb.d_lov LKP 
 ON COALESCE(CONCAT('PHASE~TIME_ENTRY~~~',c.short_description),'UNSPECIFIED')= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id 
 WHERE COALESCE(LKP.row_key,CASE WHEN c.short_description IS NULL THEN 0 else -1 end)<> (TRGT.phase_src_c_key))temp;
 