SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_outage.mean_time_to_detect_c' ELSE 'SUCCESS' END as Message FROM 
 discover_mdwdb.f_outage f_outage   
    INNER JOIN
        discover_mdwdb.d_problem d_problem 
            ON f_outage.problem_key=d_problem.row_key  
    INNER JOIN
        discover_mdwdb.d_incident d_incident 
            ON d_problem.problem_enterprise_incident_c_key=d_incident.row_key  
    where
        f_outage.mean_time_to_detect_c <> case                           
            when d_problem.u_incident_start_c>d_incident.opened_on then 0                           
            else timestampdiff(second,
            d_problem.u_incident_start_c,
            d_incident.opened_on)                   
        end
    
