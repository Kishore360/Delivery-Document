


 SELECT 
 CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_incident.met_sla_flag' ELSE 'SUCCESS' END as Message
 FROM 
 (
 SELECT count(1) as CNT
FROM wpl_mdwdb.d_incident TRGT 
JOIN 
(
SELECT inc.sys_id,inc.sourceinstance,SUM(b.has_breached) as has_breached,CASE WHEN SUM(b.has_breached) > 0 THEN 'N' ELSE 'Y'END as MET_SLA_Flag
FROM wpl_mdsdb.incident_final inc
join
(
select case  when upper(task.sys_class_name)  ='INCIDENT' then COALESCE(task_sla.task, 'UNSPECIFIED') 
                    else 'UNSPECIFIED'  END AS incident_id, task_sla.has_breached
                    from
                wpl_mdsdb.task_sla_final task_sla                  
            LEFT OUTER JOIN
                wpl_mdsdb.task_final task 
                    ON task.sys_id=task_sla.task 
                    and task.sourceinstance=task_sla.sourceinstance     ) b
                    on inc.sys_id =b.incident_id
where inc.cdctype<>'D'
Group by 1,2
) SRC 
ON (TRGT.row_id=SRC.sys_id AND TRGT.source_id=SRC.sourceinstance)
WHERE SRC.MET_SLA_Flag<>TRGT.met_sla_flag --  and SRC.sys_id in ('c8165b9b1b091494ec362f066e4bcbe1' , 'f262689b1b01d85471de2fcdee4bcbc0')
 ) temp;
 
