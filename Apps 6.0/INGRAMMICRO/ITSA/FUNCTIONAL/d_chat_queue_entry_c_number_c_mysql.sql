SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_chat_queue_entry_c.number_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT  count(1) as CNT
FROM ingrammicro_mdsdb.chat_queue_entry_final SRC 
LEFT JOIN ingrammicro_mdwdb.d_chat_queue_entry_c TRGT ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
WHERE COALESCE(SRC.number,'UNSPECIFIED')<>TRGT.number_c
AND SRC.cdctype='X' ) temp