SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_time_sheet_c.description' ELSE 'SUCCESS' END as Message
FROM  fidelity_mdsdb.change_request_final SRC
left OUTER join
( SELECT
            COUNT(incident.sys_id) AS incident_count,
            incident.u_caused_by_change AS row_id,
            incident.sourceinstance AS source_id    
        FROM
            fidelity_mdsdb.incident_final incident         
        WHERE
            u_caused_by_change is not null    
        GROUP BY
            2,
            3)SRC1
            on SRC.sys_id = SRC1.row_id and SRC.sourceinstance=SRC1.source_id  
LEFT OUTER JOIN
                fidelity_mdsdb.us_change_request_map_final change_request_map 
                    ON CONCAT('CLOSE_CODE~CHANGE_REQUEST~',
                SRC.u_closure_code) = change_request_map.row_id 
                and SRC.sourceinstance = change_request_map.sourceinstance 
                and change_request_map.dimension_class = 'CLOSE_CODE~CHANGE_REQUEST' 
JOIN  fidelity_mdwdb.d_change_request TRGT 
ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance= TRGT.source_id)
WHERE case  
when change_request_map.dimension_wh_code = 'SUCCESSFUL'  and coalesce(SRC1.incident_count,
                    0) > 0 then 'Y' 
                    when change_request_map.dimension_wh_code = 'SUCCESSFUL' 
                    and coalesce(SRC1.incident_count,
                    0) <= 0 then 'N' 
                    when (change_request_map.dimension_wh_code = 'UNSUCCESSFUL' 
                    or change_request_map.dimension_wh_code = 'SUCCESSFUL_WITH_ISSUES') then 'Y' 
                    when (change_request_map.dimension_wh_code = 'CANCELED' 
                    or change_request_map.dimension_wh_code = 'Withdrawn / Cancelled') then 'N/A' 
                end <> TRGT.alternative_change_failure_c_flag and SRC.cdctype<>'D'; 