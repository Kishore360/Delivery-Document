SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed ' ELSE 'SUCCESS' END as Message
from truist_mdwdb.f_change_request f_change_request   
    INNER JOIN
        (SELECT
            SUM(CASE 
                WHEN TIMESTAMPDIFF(SECOND,
                t_temp_inc_count_1_temp2_c.work_end_on,
                t_list_of_incidents_1c.opened_on) BETWEEN 0 AND 7776000 THEN 1 
                ELSE 0 
            END) AS nine_d,
            t_temp_inc_count_1_temp2_c.change_request_key AS change_request_key,
            SUM(CASE 
                WHEN TIMESTAMPDIFF(SECOND,
                t_temp_inc_count_1_temp2_c.work_end_on,
                t_list_of_incidents_1c.opened_on) BETWEEN 0 AND 432000 THEN 1 
                ELSE 0 
            END) AS five_d,
            MAX(t_temp_inc_count_1_temp2_c.etl_run_number) AS etl_run_number    
        FROM
            (SELECT
            t_temp_inc_count_1_temp1_c.configuration_item_key AS configuration_item_key,
            t_all_cis_to_consider_1_c.change_request_key AS change_request_key,
            d_change_request.work_end_on AS work_end_on,
            t_all_cis_to_consider_1_c.etl_run_number AS etl_run_number        
        FROM
            ( SELECT
            t_temp_chg_req_ci_3_c.change_request_key AS change_request_key,
            t_all_cis_to_consider_1_temp_c.affected_ci_c_key AS all_ci,
            t_all_cis_to_consider_1_temp_c.etl_run_number AS etl_run_number        
        FROM
           (SELECT
            f_workload_ci_hier_c.workload_ci_c_key AS workload_ci_c_key,
            f_workload_ci_hier_c.affected_ci_c_key AS affected_ci_c_key,
            f_workload_ci_hier_c.etl_run_number AS etl_run_number        
        FROM
            truist_mdwdb.f_workload_ci_hier_c f_workload_ci_hier_c      
        INNER JOIN
            (SELECT
            f_incident.configuration_item_key AS configuration_item_key,
            f_incident.etl_run_number AS etl_run_number        
        FROM
            truist_mdwdb.f_incident f_incident      
        INNER JOIN
            truist_mdwdb.d_incident d_incident 
                ON f_incident.incident_key=d_incident.row_key 
        INNER JOIN
            truist_mdwdb.d_lov_map d_lov_map 
                ON d_lov_map.dimension_class ='PRIORITY~INCIDENT' 
                and d_lov_map.dimension_wh_code <> 'LOW' 
                AND d_incident.priority_src_key = d_lov_map.src_key    
        WHERE
            f_incident.soft_deleted_flag ='N' 
            and f_incident.exclude_incident_c_flag='N' 
        group by
            1,
            2     ) t_all_incident_cis_only_c 
                ON f_workload_ci_hier_c.affected_ci_c_key = t_all_incident_cis_only_c.configuration_item_key 
        INNER JOIN
            truist_mdwdb.f_workload_ci_hier_c f_workload_ci_hier_c1 
                ON f_workload_ci_hier_c.workload_ci_c_key = f_workload_ci_hier_c1.workload_ci_c_key    
        WHERE
            1=1 
        group by
            1,
            2,
            3) t_all_cis_to_consider_1_temp_c      
        INNER JOIN
            ( SELECT
            t_temp_chg_req_ci_1_c.configuration_item_key AS configuration_item_key,
            t_temp_chg_req_ci_1_c.change_request_key AS change_request_key,
            t_temp_chg_req_ci_1_c.etl_run_number AS etl_run_number        
        FROM
            (SELECT
            f_change_request.configuration_item_key AS configuration_item_key,
            f_change_request.change_request_key AS change_request_key,
            f_change_request.etl_run_number AS etl_run_number        
        FROM
            truist_mdwdb.f_change_request f_change_request      
        INNER JOIN
            truist_mdwdb.d_change_request d_change_request 
                ON f_change_request.change_request_key=d_change_request.row_key 
        INNER JOIN
            truist_mdwdb.d_lov_map d_lov_map 
                ON f_change_request.state_src_key = d_lov_map.src_key 
                AND d_lov_map.dimension_wh_code IN(
                    'CLOSED',
                'UNSPECIFIED') 
                AND d_lov_map.DIMENSION_CLASS IN('STATE~CHANGE_REQUEST',
                'UNSPECIFIED') 
            INNER JOIN
                truist_mdwdb.d_lov_map d_lov_map1 
                    ON d_change_request.change_request_status_c_key = d_lov_map1.src_key 
                    AND d_lov_map1.dimension_wh_code IN(
                        'SUCCESSFUL',
                    'UNSPECIFIED') 
                    AND d_lov_map1.DIMENSION_CLASS IN('STATUS_C~CHANGE_REQUEST',
                    'UNSPECIFIED')    
                WHERE
                    f_change_request.change_request_key  NOT IN (
                        0,-1
                    ) 
                    AND d_change_request.failure_flag ='N'  ) t_temp_chg_req_ci_1_c                     
        UNION
        SELECT
            t_temp_chg_req_ci_1_c.configuration_item_key AS configuration_item_key,
            t_temp_chg_req_ci_1_c.change_request_key AS change_request_key,
            t_temp_chg_req_ci_1_c.etl_run_number AS etl_run_number        
        FROM
            (SELECT
            f_affected_ci.configuration_item_key AS configuration_item_key,
            f_affected_ci.change_request_key AS change_request_key,
            f_affected_ci.etl_run_number AS etl_run_number        
        FROM
            truist_mdwdb.f_affected_ci f_affected_ci      
        LEFT OUTER JOIN
            (SELECT
            f_change_request.configuration_item_key AS configuration_item_key,
            f_change_request.change_request_key AS change_request_key,
            f_change_request.etl_run_number AS etl_run_number        
        FROM
            truist_mdwdb.f_change_request f_change_request      
        INNER JOIN
            truist_mdwdb.d_change_request d_change_request 
                ON f_change_request.change_request_key=d_change_request.row_key 
        INNER JOIN
            truist_mdwdb.d_lov_map d_lov_map 
                ON f_change_request.state_src_key = d_lov_map.src_key 
                AND d_lov_map.dimension_wh_code IN(
                    'CLOSED',
                'UNSPECIFIED') 
                AND d_lov_map.DIMENSION_CLASS IN('STATE~CHANGE_REQUEST',
                'UNSPECIFIED') 
            INNER JOIN
                truist_mdwdb.d_lov_map d_lov_map1 
                    ON d_change_request.change_request_status_c_key = d_lov_map1.src_key 
                    AND d_lov_map1.dimension_wh_code IN(
                        'SUCCESSFUL',
                    'UNSPECIFIED') 
                    AND d_lov_map1.DIMENSION_CLASS IN('STATUS_C~CHANGE_REQUEST',
                    'UNSPECIFIED')    
                WHERE
                    f_change_request.change_request_key  NOT IN (
                        0,-1
                    ) 
                    AND d_change_request.failure_flag ='N'  ) t_temp_chg_req_ci_1_c 
                ON f_affected_ci.configuration_item_key=t_temp_chg_req_ci_1_c.configuration_item_key 
                and f_affected_ci.change_request_key=t_temp_chg_req_ci_1_c.change_request_key    
        WHERE
            f_affected_ci.change_request_key not in(
                0,-1             
            )              
            and (
                t_temp_chg_req_ci_1_c.change_request_key is null                  
                and  t_temp_chg_req_ci_1_c.configuration_item_key is null             
            )          
        group by
            f_affected_ci.change_request_key,
            f_affected_ci.configuration_item_key ) t_temp_chg_req_ci_1_c ) t_temp_chg_req_ci_3_c 
                ON t_all_cis_to_consider_1_temp_c.affected_ci_c_key=t_temp_chg_req_ci_3_c.configuration_item_key    
        WHERE
            1=1 
        group by
            1,
            2,
            3    ) t_all_cis_to_consider_1_c      
        INNER JOIN
            truist_mdwdb.d_change_request d_change_request 
                ON t_all_cis_to_consider_1_c.change_request_key=d_change_request.row_key 
        INNER JOIN
            (SELECT
            t_list_of_incidents_1c.configuration_item_key AS configuration_item_key,
            t_list_of_incidents_1c.etl_run_number AS etl_run_number        
        FROM
            ( SELECT
            f_incident.incident_key AS incident_key,
            f_incident.configuration_item_key AS configuration_item_key,
            d_incident.opened_on AS opened_on,
            f_incident.etl_run_number AS etl_run_number        
        FROM
            truist_mdwdb.f_incident f_incident      
        INNER JOIN
            truist_mdwdb.d_incident d_incident 
                ON f_incident.incident_key=d_incident.row_key 
        INNER JOIN
            truist_mdwdb.d_lov_map d_lov_map 
                ON d_lov_map.dimension_class ='PRIORITY~INCIDENT' 
                and d_lov_map.dimension_wh_code <> 'LOW' 
                AND d_incident.priority_src_key = d_lov_map.src_key 
        INNER JOIN
            (SELECT
            t_all_cis_to_consider_1_c.all_ci AS all_ci,
            t_all_cis_to_consider_1_c.etl_run_number AS etl_run_number        
        FROM
            ( SELECT
            t_temp_chg_req_ci_3_c.change_request_key AS change_request_key,
            t_all_cis_to_consider_1_temp_c.affected_ci_c_key AS all_ci,
            t_all_cis_to_consider_1_temp_c.etl_run_number AS etl_run_number        
        FROM
            (SELECT
            f_workload_ci_hier_c.workload_ci_c_key AS workload_ci_c_key,
            f_workload_ci_hier_c.affected_ci_c_key AS affected_ci_c_key,
            f_workload_ci_hier_c.etl_run_number AS etl_run_number        
        FROM
            truist_mdwdb.f_workload_ci_hier_c f_workload_ci_hier_c      
        INNER JOIN
            (SELECT
            f_incident.configuration_item_key AS configuration_item_key,
            f_incident.etl_run_number AS etl_run_number        
        FROM
            truist_mdwdb.f_incident f_incident      
        INNER JOIN
            truist_mdwdb.d_incident d_incident 
                ON f_incident.incident_key=d_incident.row_key 
        INNER JOIN
            truist_mdwdb.d_lov_map d_lov_map 
                ON d_lov_map.dimension_class ='PRIORITY~INCIDENT' 
                and d_lov_map.dimension_wh_code <> 'LOW' 
                AND d_incident.priority_src_key = d_lov_map.src_key    
        WHERE
            f_incident.soft_deleted_flag ='N' 
            and f_incident.exclude_incident_c_flag='N' 
        group by
            1,
            2 ) t_all_incident_cis_only_c 
                ON f_workload_ci_hier_c.affected_ci_c_key = t_all_incident_cis_only_c.configuration_item_key 
        INNER JOIN
            truist_mdwdb.f_workload_ci_hier_c f_workload_ci_hier_c1 
                ON f_workload_ci_hier_c.workload_ci_c_key = f_workload_ci_hier_c1.workload_ci_c_key    
        WHERE
            1=1 
        group by
            1,
            2,
            3 ) t_all_cis_to_consider_1_temp_c      
        INNER JOIN
            ( SELECT
            t_temp_chg_req_ci_1_c.configuration_item_key AS configuration_item_key,
            t_temp_chg_req_ci_1_c.change_request_key AS change_request_key,
            t_temp_chg_req_ci_1_c.etl_run_number AS etl_run_number        
        FROM
            ( SELECT
            f_change_request.configuration_item_key AS configuration_item_key,
            f_change_request.change_request_key AS change_request_key,
            f_change_request.etl_run_number AS etl_run_number        
        FROM
            truist_mdwdb.f_change_request f_change_request      
        INNER JOIN
            truist_mdwdb.d_change_request d_change_request 
                ON f_change_request.change_request_key=d_change_request.row_key 
        INNER JOIN
            truist_mdwdb.d_lov_map d_lov_map 
                ON f_change_request.state_src_key = d_lov_map.src_key 
                AND d_lov_map.dimension_wh_code IN(
                    'CLOSED',
                'UNSPECIFIED') 
                AND d_lov_map.DIMENSION_CLASS IN('STATE~CHANGE_REQUEST',
                'UNSPECIFIED') 
            INNER JOIN
                truist_mdwdb.d_lov_map d_lov_map1 
                    ON d_change_request.change_request_status_c_key = d_lov_map1.src_key 
                    AND d_lov_map1.dimension_wh_code IN(
                        'SUCCESSFUL',
                    'UNSPECIFIED') 
                    AND d_lov_map1.DIMENSION_CLASS IN('STATUS_C~CHANGE_REQUEST',
                    'UNSPECIFIED')    
                WHERE
                    f_change_request.change_request_key  NOT IN (
                        0,-1
                    ) 
                    AND d_change_request.failure_flag ='N'    ) t_temp_chg_req_ci_1_c                     
        UNION
        SELECT
            t_temp_chg_req_ci_1_c.configuration_item_key AS configuration_item_key,
            t_temp_chg_req_ci_1_c.change_request_key AS change_request_key,
            t_temp_chg_req_ci_1_c.etl_run_number AS etl_run_number        
        FROM
            ( SELECT
            f_affected_ci.configuration_item_key AS configuration_item_key,
            f_affected_ci.change_request_key AS change_request_key,
            f_affected_ci.etl_run_number AS etl_run_number        
        FROM
            truist_mdwdb.f_affected_ci f_affected_ci      
        LEFT OUTER JOIN
            ( SELECT
            f_change_request.configuration_item_key AS configuration_item_key,
            f_change_request.change_request_key AS change_request_key,
            f_change_request.etl_run_number AS etl_run_number        
        FROM
            truist_mdwdb.f_change_request f_change_request      
        INNER JOIN
            truist_mdwdb.d_change_request d_change_request 
                ON f_change_request.change_request_key=d_change_request.row_key 
        INNER JOIN
            truist_mdwdb.d_lov_map d_lov_map 
                ON f_change_request.state_src_key = d_lov_map.src_key 
                AND d_lov_map.dimension_wh_code IN(
                    'CLOSED',
                'UNSPECIFIED') 
                AND d_lov_map.DIMENSION_CLASS IN('STATE~CHANGE_REQUEST',
                'UNSPECIFIED') 
            INNER JOIN
                truist_mdwdb.d_lov_map d_lov_map1 
                    ON d_change_request.change_request_status_c_key = d_lov_map1.src_key 
                    AND d_lov_map1.dimension_wh_code IN(
                        'SUCCESSFUL',
                    'UNSPECIFIED') 
                    AND d_lov_map1.DIMENSION_CLASS IN('STATUS_C~CHANGE_REQUEST',
                    'UNSPECIFIED')    
                WHERE
                    f_change_request.change_request_key  NOT IN (
                        0,-1
                    ) 
                    AND d_change_request.failure_flag ='N'  ) t_temp_chg_req_ci_1_c 
                ON f_affected_ci.configuration_item_key=t_temp_chg_req_ci_1_c.configuration_item_key 
                and f_affected_ci.change_request_key=t_temp_chg_req_ci_1_c.change_request_key    
        WHERE
            f_affected_ci.change_request_key not in(
                0,-1             
            )              
            and (
                t_temp_chg_req_ci_1_c.change_request_key is null                  
                and  t_temp_chg_req_ci_1_c.configuration_item_key is null             
            )          
        group by
            f_affected_ci.change_request_key,
            f_affected_ci.configuration_item_key) t_temp_chg_req_ci_1_c ) t_temp_chg_req_ci_3_c 
                ON t_all_cis_to_consider_1_temp_c.affected_ci_c_key=t_temp_chg_req_ci_3_c.configuration_item_key    
        WHERE
            1=1 
        group by
            1,
            2,
            3) t_all_cis_to_consider_1_c         
        WHERE
            1=1 
        group by
            1,
            2  ) t_list_of_incidents_1c_temp 
                ON f_incident.configuration_item_key=t_list_of_incidents_1c_temp.all_ci    
        WHERE
            f_incident.soft_deleted_flag ='N' 
            and f_incident.exclude_incident_c_flag='N'   ) t_list_of_incidents_1c         
        WHERE
            1=1 
        group by
            1,
            2   ) t_temp_inc_count_1_temp1_c 
                ON t_all_cis_to_consider_1_c.all_ci=t_temp_inc_count_1_temp1_c.configuration_item_key ) t_temp_inc_count_1_temp2_c      
        INNER JOIN
            (SELECT
            f_incident.incident_key AS incident_key,
            f_incident.configuration_item_key AS configuration_item_key,
            d_incident.opened_on AS opened_on,
            f_incident.etl_run_number AS etl_run_number        
        FROM
            truist_mdwdb.f_incident f_incident      
        INNER JOIN
            truist_mdwdb.d_incident d_incident 
                ON f_incident.incident_key=d_incident.row_key 
        INNER JOIN
            truist_mdwdb.d_lov_map d_lov_map 
                ON d_lov_map.dimension_class ='PRIORITY~INCIDENT' 
                and d_lov_map.dimension_wh_code <> 'LOW' 
                AND d_incident.priority_src_key = d_lov_map.src_key 
        INNER JOIN
            ( SELECT
            t_all_cis_to_consider_1_c.all_ci AS all_ci,
            t_all_cis_to_consider_1_c.etl_run_number AS etl_run_number        
        FROM
            (SELECT
            t_temp_chg_req_ci_3_c.change_request_key AS change_request_key,
            t_all_cis_to_consider_1_temp_c.affected_ci_c_key AS all_ci,
            t_all_cis_to_consider_1_temp_c.etl_run_number AS etl_run_number        
        FROM
            ( SELECT
            f_workload_ci_hier_c.workload_ci_c_key AS workload_ci_c_key,
            f_workload_ci_hier_c.affected_ci_c_key AS affected_ci_c_key,
            f_workload_ci_hier_c.etl_run_number AS etl_run_number        
        FROM
            truist_mdwdb.f_workload_ci_hier_c f_workload_ci_hier_c      
        INNER JOIN
            ( SELECT
            f_incident.configuration_item_key AS configuration_item_key,
            f_incident.etl_run_number AS etl_run_number        
        FROM
            truist_mdwdb.f_incident f_incident      
        INNER JOIN
            truist_mdwdb.d_incident d_incident 
                ON f_incident.incident_key=d_incident.row_key 
        INNER JOIN
            truist_mdwdb.d_lov_map d_lov_map 
                ON d_lov_map.dimension_class ='PRIORITY~INCIDENT' 
                and d_lov_map.dimension_wh_code <> 'LOW' 
                AND d_incident.priority_src_key = d_lov_map.src_key    
        WHERE
            f_incident.soft_deleted_flag ='N' 
            and f_incident.exclude_incident_c_flag='N' 
        group by
            1,
            2 ) t_all_incident_cis_only_c 
                ON f_workload_ci_hier_c.affected_ci_c_key = t_all_incident_cis_only_c.configuration_item_key 
        INNER JOIN
            truist_mdwdb.f_workload_ci_hier_c f_workload_ci_hier_c1 
                ON f_workload_ci_hier_c.workload_ci_c_key = f_workload_ci_hier_c1.workload_ci_c_key    
        WHERE
            1=1 
        group by
            1,
            2,
            3 ) t_all_cis_to_consider_1_temp_c      
        INNER JOIN
           (SELECT
            t_temp_chg_req_ci_1_c.configuration_item_key AS configuration_item_key,
            t_temp_chg_req_ci_1_c.change_request_key AS change_request_key,
            t_temp_chg_req_ci_1_c.etl_run_number AS etl_run_number        
        FROM
            (SELECT
            f_change_request.configuration_item_key AS configuration_item_key,
            f_change_request.change_request_key AS change_request_key,
            f_change_request.etl_run_number AS etl_run_number        
        FROM
            truist_mdwdb.f_change_request f_change_request      
        INNER JOIN
            truist_mdwdb.d_change_request d_change_request 
                ON f_change_request.change_request_key=d_change_request.row_key 
        INNER JOIN
            truist_mdwdb.d_lov_map d_lov_map 
                ON f_change_request.state_src_key = d_lov_map.src_key 
                AND d_lov_map.dimension_wh_code IN(
                    'CLOSED',
                'UNSPECIFIED') 
                AND d_lov_map.DIMENSION_CLASS IN('STATE~CHANGE_REQUEST',
                'UNSPECIFIED') 
            INNER JOIN
                truist_mdwdb.d_lov_map d_lov_map1 
                    ON d_change_request.change_request_status_c_key = d_lov_map1.src_key 
                    AND d_lov_map1.dimension_wh_code IN(
                        'SUCCESSFUL',
                    'UNSPECIFIED') 
                    AND d_lov_map1.DIMENSION_CLASS IN('STATUS_C~CHANGE_REQUEST',
                    'UNSPECIFIED')    
                WHERE
                    f_change_request.change_request_key  NOT IN (
                        0,-1
                    ) 
                    AND d_change_request.failure_flag ='N'   ) t_temp_chg_req_ci_1_c                     
        UNION
        SELECT
            t_temp_chg_req_ci_1_c.configuration_item_key AS configuration_item_key,
            t_temp_chg_req_ci_1_c.change_request_key AS change_request_key,
            t_temp_chg_req_ci_1_c.etl_run_number AS etl_run_number        
        FROM
            (SELECT
            f_affected_ci.configuration_item_key AS configuration_item_key,
            f_affected_ci.change_request_key AS change_request_key,
            f_affected_ci.etl_run_number AS etl_run_number        
        FROM
            truist_mdwdb.f_affected_ci f_affected_ci      
        LEFT OUTER JOIN
            (SELECT
            f_change_request.configuration_item_key AS configuration_item_key,
            f_change_request.change_request_key AS change_request_key,
            f_change_request.etl_run_number AS etl_run_number        
        FROM
            truist_mdwdb.f_change_request f_change_request      
        INNER JOIN
            truist_mdwdb.d_change_request d_change_request 
                ON f_change_request.change_request_key=d_change_request.row_key 
        INNER JOIN
            truist_mdwdb.d_lov_map d_lov_map 
                ON f_change_request.state_src_key = d_lov_map.src_key 
                AND d_lov_map.dimension_wh_code IN(
                    'CLOSED',
                'UNSPECIFIED') 
                AND d_lov_map.DIMENSION_CLASS IN('STATE~CHANGE_REQUEST',
                'UNSPECIFIED') 
            INNER JOIN
                truist_mdwdb.d_lov_map d_lov_map1 
                    ON d_change_request.change_request_status_c_key = d_lov_map1.src_key 
                    AND d_lov_map1.dimension_wh_code IN(
                        'SUCCESSFUL',
                    'UNSPECIFIED') 
                    AND d_lov_map1.DIMENSION_CLASS IN('STATUS_C~CHANGE_REQUEST',
                    'UNSPECIFIED')    
                WHERE
                    f_change_request.change_request_key  NOT IN (
                        0,-1
                    ) 
                    AND d_change_request.failure_flag ='N'   ) t_temp_chg_req_ci_1_c 
                ON f_affected_ci.configuration_item_key=t_temp_chg_req_ci_1_c.configuration_item_key 
                and f_affected_ci.change_request_key=t_temp_chg_req_ci_1_c.change_request_key    
        WHERE
            f_affected_ci.change_request_key not in(
                0,-1             
            )              
            and (
                t_temp_chg_req_ci_1_c.change_request_key is null                  
                and  t_temp_chg_req_ci_1_c.configuration_item_key is null             
            )          
        group by
            f_affected_ci.change_request_key,
            f_affected_ci.configuration_item_key   ) t_temp_chg_req_ci_1_c ) t_temp_chg_req_ci_3_c 
                ON t_all_cis_to_consider_1_temp_c.affected_ci_c_key=t_temp_chg_req_ci_3_c.configuration_item_key    
        WHERE
            1=1 
        group by
            1,
            2,
            3 ) t_all_cis_to_consider_1_c         
        WHERE
            1=1 
        group by
            1,
            2      ) t_list_of_incidents_1c_temp 
                ON f_incident.configuration_item_key=t_list_of_incidents_1c_temp.all_ci    
        WHERE
            f_incident.soft_deleted_flag ='N' 
            and f_incident.exclude_incident_c_flag='N') t_list_of_incidents_1c 
                ON t_temp_inc_count_1_temp2_c.configuration_item_key=t_list_of_incidents_1c.configuration_item_key        
        GROUP BY
            2 ) t_temp_inc_count_1_c 
            ON f_change_request.change_request_key=t_temp_inc_count_1_c.change_request_key  
    where
        f_change_request.ninety_day_ci_c <> t_temp_inc_count_1_c.nine_d