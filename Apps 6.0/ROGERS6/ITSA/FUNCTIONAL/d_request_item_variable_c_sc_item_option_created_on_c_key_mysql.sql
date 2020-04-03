SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_request_item_variable_c.sc_item_option_created_on_c_key' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT  count(1) as CNT
FROM rogers6_mdsdb.sc_item_option_mtom_final SRC 
JOIN rogers6_mdwdb.d_request_item_variable_c TRGT ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)

WHERE    COALESCE(DATE_FORMAT(CONVERT_TZ(SRC.sys_created_on,'GMT', 'America/New_York'),'%Y%m%d'),'UNSPECIFIED')<>
 TRGT.sc_item_option_created_on_c_key
AND SRC.cdctype='X' ) temp; 