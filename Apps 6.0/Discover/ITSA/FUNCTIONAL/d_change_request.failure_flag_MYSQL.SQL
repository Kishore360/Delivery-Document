SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_change_request.failure_flag' ELSE 'SUCCESS' END as Message 
  from
discover_mdwdb.d_change_request d
                                                JOIN 
          discover_mdsdb.change_request_final change_request 
                                                ON d.row_id=change_request.sys_id and d.source_id=change_request.sourceinstance   
                                                                LEFT OUTER JOIN
                discover_mdsdb.std_change_producer_version_final std_change_producer_version 
                    ON change_request.std_change_producer_version=std_change_producer_version.sys_id                      
                    and change_request.sourceinstance=std_change_producer_version.sourceinstance  
            LEFT OUTER JOIN
                discover_mdsdb.std_change_record_producer_final std_change_record_producer 
                    ON std_change_producer_version.std_change_producer=std_change_record_producer.sys_id                      
                    and std_change_producer_version.sourceinstance=std_change_record_producer.sourceinstance 
                    LEFT OUTER JOIN
                ( select sys_id as row_id, sourceinstance as source_id,  t_problem_caused_by_change_relationship.row_id AS rel_id   FROM
            discover_mdsdb.change_request_final t_change_request_temp      
        INNER JOIN
            (SELECT
            change_request.sourceinstance AS source_id,
            change_request.sys_id AS row_id,
            COUNT(change_request.sys_id) AS cnt    
        FROM
            discover_mds_viewdb.problem_final problem      
        INNER JOIN
            discover_mds_viewdb.task_rel_task_final task_rel_task 
                ON problem.sys_id=task_rel_task.parent 
                and problem.sourceinstance=task_rel_task.sourceinstance 
                and problem.u_problem_caused_by_change='yes' 
        INNER JOIN
            discover_mds_viewdb.task_rel_type_final task_rel_type 
                ON task_rel_task.type=task_rel_type.sys_id 
                and task_rel_task.sourceinstance=task_rel_type.sourceinstance 
                and task_rel_type.sys_name='Caused by::Causes' 
        INNER JOIN
            discover_mds_viewdb.change_request_final change_request 
                ON task_rel_task.child=change_request.sys_id 
                and task_rel_task.sourceinstance=change_request.sourceinstance        
        GROUP BY
            1,
            2     ) t_problem_caused_by_change_relationship 
                ON t_change_request_temp.sys_id=t_problem_caused_by_change_relationship.row_id 
                and t_change_request_temp.sourceinstance=t_problem_caused_by_change_relationship.source_id ) t_change_rel 
                    ON change_request.sys_id=t_change_rel.row_id 
                    and change_request.sourceinstance=t_change_rel.source_id 
            WHERE
                (std_change_record_producer.sys_name<>'Chef Client Runs'              
                or change_request.std_change_producer_version is null     
                or std_change_producer_version.std_change_producer is null ) and failure_flag <>         
                                                                CASE 
                    when COALESCE((SELECT
                        dimension_wh_code 
                    FROM
                        discover_mdwdb.d_lov_map 
                    WHERE
                        d_lov_map.dimension_class = 'STATE~CHANGE_REQUEST' 
                        AND d_lov_map.dimension_code = change_request.state 
                        AND d_lov_map.source_id = change_request.sourceinstance),
                    'UNKNOWN') <> 'CLOSED' then 'X' 
                    when t_change_rel.rel_id is not null 
                    or change_request.u_completion_code not in ('SLABREACH',
                    'successful') 
                    or change_request.u_caused_problem='Yes'  then 'Y' 
                    else 'N' 
                end
