SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_change_failure.cmdb_ci_sub_category_c' ELSE 'SUCCESS' END as Message 
FROM equifax_mdsdb.change_request_final SRC
JOIN equifax_mdwdb.d_change_failure TRGT  
ON (SRC.sys_id  = TRGT.row_id  
AND SRC.sourceinstance = TRGT.source_id ) and SRC.cdctype<>'D' and TRGT.current_flag='Y'
    INNER JOIN
        equifax_mdwdb.f_change_request f_change_request 
            ON TRGT.row_id=f_change_request.row_id  
            and TRGT.source_id=f_change_request.source_id  
   LEFT OUTER JOIN
        equifax_mdwdb.d_configuration_item d_configuration_item 
            ON f_change_request.configuration_item_key=d_configuration_item.row_key  
WHERE d_configuration_item.subcategory<>TRGT.cmdb_ci_sub_category_c and SRC.cdctype<>'D';
