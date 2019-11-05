SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_configuration_item_c.created_on_key' ELSE 'SUCCESS' END as Message 
/* select DATE_FORMAT(CONVERT_TZ (SRC1.sys_created_on,
                'GMT',
                'America/New_York'),
                '%Y%m%d') 
,TRGT.created_on_key */
FROM rogers_mdsdb.cmdb_ci_final SRC1
JOIN rogers_mdwdb.f_configuration_item_c TRGT 
ON (SRC1.sys_id = TRGT.row_id AND SRC1.sourceinstance = TRGT.source_id )  
where (DATE_FORMAT(CONVERT_TZ (SRC1.sys_created_on,
                'GMT',
                'America/New_York'),
                '%Y%m%d'))<>(TRGT.created_on_key) 
and SRC1.CDCTYPE='X';