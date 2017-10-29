SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_time_entry_c.state_src_key' ELSE 'SUCCESS' END as Message
 FROM cardinalhealth_mdsdb.time_card_final SRC
LEFT JOIN cardinalhealth_mdwdb.d_lov LKP 
 ON LKP.dimension_class like '%STATE~TIME_CARD%' and 
( concat('STATE~TIME_CARD~~~',upper(state))= LKP.src_rowid 
AND SRC.sourceinstance= LKP.source_id ) 
 LEFT JOIN cardinalhealth_mdwdb.f_time_entry_c TRGT 
 ON (SRC.sys_id =LEFT(TRGT.row_id,32 )  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.state IS NULL THEN 0 else -1 end)<> COALESCE(TRGT.state_src_key)