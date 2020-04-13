SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_request_item_variable_c.variable_table_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT  count(1) as CNT
FROM rogers6_mdsdb.sc_item_option_mtom_final SRC 
JOIN   rogers6_mdwdb.d_request_item_variable_c TRGT ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
left join rogers6_mdsdb.sc_item_option_final SRC1 on SRC1.sys_id=SRC.sc_item_option
and SRC1.sourceinstance=SRC.sourceinstance
left join  rogers6_mdsdb.item_option_new_final SRC2 on SRC2.sys_id=SRC1.item_option_new
and SRC1.sourceinstance=SRC2.sourceinstance

WHERE    coalesce(SRC2.reference,'UNSPECIFIED')<>
 TRGT.variable_table_c
AND SRC.cdctype='X' ) temp; 