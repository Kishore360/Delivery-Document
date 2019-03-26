SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_time_entry_c.state_src_key' ELSE 'SUCCESS' END as Message
 FROM (select count(1) cnt
 FROM cardinalhealth_mdsdb.time_card_final SRC
LEFT JOIN cardinalhealth_mdwdb.d_lov LKP 
 ON  
( upper(state)= substring(row_id,19,length(row_id)) 
AND SRC.sourceinstance= LKP.source_id ) 
  JOIN cardinalhealth_mdwdb.f_time_entry_c TRGT 
 ON (SRC.sys_id =LEFT(TRGT.row_id,32 )  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE LKP.soft_deleted_flag='N' and TRGT.soft_deleted_flag='N'
 and LKP.dimension_class = 'STATE~TIME_CARD' and  COALESCE(LKP.row_key,CASE WHEN SRC.state IS NULL THEN 0 else -1 end)<> COALESCE(TRGT.state_src_key))a