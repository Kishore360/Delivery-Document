SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_outage.degraded_duration' ELSE 'SUCCESS' END as Message 
 FROM
                intuit_mdsdb.cmdb_ci_outage_final cmdb_ci_outage   
join intuit_mdwdb.f_outage d on d.row_id = cmdb_ci_outage.sys_id  AND d.source_id = cmdb_ci_outage.sourceinstance				
            LEFT OUTER JOIN
                intuit_mdsdb.incident_final incident 
                    ON cmdb_ci_outage.task_number = incident.sys_id 
                    AND cmdb_ci_outage.sourceinstance = incident.sourceinstance  
            LEFT OUTER JOIN
                intuit_mdsdb.task_final task 
                    ON cmdb_ci_outage.sourceinstance = task.sourceinstance 
                    AND cmdb_ci_outage.task_number = task.sys_id  
            LEFT OUTER JOIN
                intuit_mdsdb.cmdb_ci_final cmdb_ci 
                    ON cmdb_ci_outage.sourceinstance = cmdb_ci.sourceinstance 
                    AND cmdb_ci_outage.cmdb_ci = cmdb_ci.sys_id
where (CASE   
                WHEN cmdb_ci_outage.type='degradation' THEN (cmdb_ci_outage.u_percent_of_impact * TIMESTAMPDIFF(SECOND,
                '1970-01-01 00:00:00',
                cmdb_ci_outage.duration)/100)     
                ELSE TIMESTAMPDIFF(SECOND,
                '1970-01-01 00:00:00',
                cmdb_ci_outage.duration) end ) <>d.degraded_duration ; 

