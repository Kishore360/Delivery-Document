


 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
 FROM cardinalhealth_mdsdb.cmdb_ci_outage_final SRC 
 LEFT JOIN cardinalhealth_mdwdb.f_outage_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
join cardinalhealth_mdwdb.d_lov lkp
on lkp.row_id=UPPER(CONCAT('TYPE~CMDB_CI_OUTAGE','~','','~','','~',COALESCE(SRC.type,''))) and SRC.sourceinstance=lkp.source_id
where COALESCE(lkp.row_key,CASE WHEN SRC.type IS NULL THEN 0 else -1 end) <> TRGT.outage_type_src_code_key










