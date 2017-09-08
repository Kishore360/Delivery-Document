-- The Query is verify if there are multiple Sys_id per incident This was found in Molina as source Data issue -- 

SELECT CASE WHEN cnt THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN cnt THEN 'MDS to DWH data validation failed for d_incident.created_on' ELSE 'SUCCESS' END as Message from (
select count(1) as cnt from 
(select sys_id,count(1) cnt   
FROM  molinahealth_mdsdb.task_final SRC  
 group by number having count(1)>1

)b)c

