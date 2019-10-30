SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_change_failure.business_unit_dept_c' ELSE 'SUCCESS' END as Message 
FROM equifax_mdsdb.change_request_final SRC
JOIN equifax_mdwdb.d_change_failure TRGT  
ON (SRC.sys_id  = TRGT.row_id  
AND SRC.sourceinstance = TRGT.source_id ) and SRC.cdctype<>'D' and TRGT.current_flag='Y'
    INNER JOIN
        equifax_mdwdb.f_change_request f_change_request 
            ON TRGT.row_id=f_change_request.row_id  
            and TRGT.source_id=f_change_request.source_id  
LEFT OUTER JOIN
        equifax_mdwdb.d_internal_organization d_internal_organization 
            ON f_change_request.assignment_group_key=d_internal_organization.row_key  
    LEFT OUTER JOIN
        equifax_mdwdb.d_internal_organization d_internal_organization1 
            ON d_internal_organization.group_bu_c_key=d_internal_organization1.row_key  
WHERE d_internal_organization1.organization_name<>TRGT.business_unit_dept_c;
