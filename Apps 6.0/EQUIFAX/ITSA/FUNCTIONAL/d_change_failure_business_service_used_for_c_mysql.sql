SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_change_failure.business_service_used_for_c' ELSE 'SUCCESS' END as Message 
FROM equifax_mdsdb.change_request_final SRC
JOIN equifax_mdwdb.d_change_failure TRGT  
ON (SRC.sys_id  = TRGT.row_id  
AND SRC.sourceinstance = TRGT.source_id ) and SRC.cdctype<>'D' and TRGT.current_flag='Y'
    INNER JOIN
        equifax_mdwdb.f_change_request f_change_request 
            ON TRGT.row_id=f_change_request.row_id  
            and TRGT.source_id=f_change_request.source_id  
    LEFT OUTER JOIN
        equifax_mdwdb.d_service d_service 
            ON f_change_request.business_service_key=d_service.row_key  
    LEFT OUTER JOIN
        equifax_mdwdb.d_lov d_lov 
            ON d_service.used_for_src_key=d_lov.row_key  
WHERE d_lov.dimension_name<>TRGT.business_service_used_for_c and SRC.cdctype<>'D';
