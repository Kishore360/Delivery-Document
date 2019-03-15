 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
 FROM cardinalhealth_mdsdb.time_card_final SRC 
 LEFT JOIN cardinalhealth_mdwdb.d_lov LKP
 on  COALESCE(CONCAT('STATE','~','TIME_CARD','~','~','~',upper(SRC.state)),'UNSPECIFIED')=LKP.row_id  
 and SRC.sourceinstance=LKP.source_id
 LEFT JOIN cardinalhealth_mdwdb.f_time_entry_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  AND SRC.sourceinstance= TRGT.source_id  )
 WHERE coalesce(LKP.row_key,case when SRC.state is null then 0 else -1 end) <> TRGT.state_src_key ;