SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_request_item_variable_c.variable_answer_date_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT  count(1) as CNT
FROM rogers6_mdsdb.sc_item_option_mtom_final SRC 
JOIN rogers6_mdwdb.d_request_item_variable_c TRGT ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
left join rogers6_mdsdb.sc_item_option_final SRC1 on SRC1.sys_id=SRC.sc_item_option
and SRC1.sourceinstance=SRC.sourceinstance

WHERE    CONVERT_TZ(SRC1.sys_created_on, 'GMT','America/New_York')<>TRGT.variable_answer_date_c
AND SRC.cdctype='X' ) temp; 