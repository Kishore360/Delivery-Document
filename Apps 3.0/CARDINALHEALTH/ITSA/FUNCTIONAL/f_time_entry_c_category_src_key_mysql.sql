SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
 FROM cardinalhealth_mdsdb.time_card_final SRC 
  JOIN cardinalhealth_mdwdb.f_time_entry_c TRGT 
 ON (SRC.sys_id =LEFT(TRGT.row_id, 32)  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN cardinalhealth_mdwdb.d_lov LKP 
 ON COALESCE(CONCAT('CATEGORY','~','TIME_CARD','~','~','~',upper(SRC.category)),'UNSPECIFIED')= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id 
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.category IS NULL THEN 0 else -1 end)<> (TRGT.category_src_key)
 