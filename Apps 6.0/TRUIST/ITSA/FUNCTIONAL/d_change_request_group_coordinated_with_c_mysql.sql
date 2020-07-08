SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_request.group_coordinated_with_c' ELSE 'SUCCESS' END as Message 
 from truist_mdwdb.d_change_request d_change_request   
    LEFT OUTER JOIN
        (SELECT
            f_group_coordinated_with_c.change_request_key AS change_request_key,
            group_concat(distinct d_internal_organization.organization_name) AS res,
            f_group_coordinated_with_c.etl_run_number AS etl_run_number        
        FROM
            truist_mdwdb.f_group_coordinated_with_c f_group_coordinated_with_c      
        LEFT OUTER JOIN
            truist_mdwdb.d_internal_organization d_internal_organization 
                ON f_group_coordinated_with_c.group_coordinated_with_c_key = d_internal_organization.row_key 
                and f_group_coordinated_with_c.pivot_date between d_internal_organization.effective_from and d_internal_organization.effective_to    
        group by
            f_group_coordinated_with_c.change_request_key  ) t_group_coordinated_with_c 
            ON d_change_request.row_key = t_group_coordinated_with_c.change_request_key 
where d_change_request.group_coordinated_with_c <> LEFT(COALESCE(t_group_coordinated_with_c.res,'UNSPECIFIED'),4000);