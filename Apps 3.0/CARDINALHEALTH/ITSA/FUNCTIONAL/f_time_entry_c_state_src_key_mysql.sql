SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
FROM (SELECT count(1) as CNT
 FROM cardinalhealth_mdsdb.time_card_final SRC 
 LEFT JOIN cardinalhealth_mdwdb.d_lov LKP
 on LKP.row_id = COALESCE(CONCAT('STATE','~','TIME_CARD','~','~','~',upper(SRC.state)),'UNSPECIFIED') and LKP.source_id  = SRC.sourceinstance
 LEFT JOIN cardinalhealth_mdwdb.f_time_entry_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE LKP.row_key <> TRGT.state_src_key)temp;
 