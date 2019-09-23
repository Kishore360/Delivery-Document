SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.dormant_flag' ELSE 'SUCCESS' END as Message
FROM rogers_mdsdb.problem_final SRC 
  JOIN rogers_mdwdb.d_lov LKP 
  ON COALESCE( CONCAT('CONTACT_TYPE','~','PROBLEM','~','~','~',upper(SRC.contact_type)),'UNSPECIFIED') =LKP.row_id  AND SRC.sourceinstance= LKP.source_id 
  JOIN  rogers_mdwdb.f_problem TRGT 
  ON (SRC.sys_id=TRGT.row_id  AND SRC.sourceinstance= TRGT.source_id )
  where TRGT.reported_type_src_key <>coalesce(LKP.row_key,case WHEN SRC.contact_type is null then 0 else -1 end)
and SRC.CDCTYPE='X' and  LKP.soft_deleted_flag='N'
  
  
  