SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_change_failure.change_start_day_c' ELSE 'SUCCESS' END as Message 
FROM equifax_mdsdb.change_request_final SRC
JOIN equifax_mdwdb.d_change_failure TRGT  
ON (SRC.sys_id  = TRGT.row_id  
AND SRC.sourceinstance = TRGT.source_id ) and SRC.cdctype<>'D' and TRGT.current_flag='Y'
    INNER JOIN
        equifax_mdwdb.f_change_request f_change_request 
            ON TRGT.row_id=f_change_request.row_id  
            and TRGT.source_id=f_change_request.source_id  
INNER JOIN
        equifax_mdwdb.d_change_request d_change_request 
            ON f_change_request.change_request_key=d_change_request.row_key  
    LEFT OUTER JOIN
        equifax_mdwdb.d_lov_map d_lov_map 
            ON f_change_request.state_src_key=d_lov_map.src_key  
WHERE COALESCE(CASE 
            WHEN d_lov_map.dimension_wh_code='OPEN' then DAY(planned_start_on) 
            WHEN d_lov_map.dimension_wh_code='CLOSED' then DAY(work_start_on) 
        end ,
        -1) <>TRGT.change_start_day_c and SRC.cdctype<>'D';

