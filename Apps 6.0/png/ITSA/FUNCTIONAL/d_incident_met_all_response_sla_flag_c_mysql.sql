SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.met_all_response_sla_flag_c' ELSE 'SUCCESS' END as Message
 from 
(SELECT a.incident_key , sum(case when stage_src_code ='cancelled' THEN 1 ELSE 0 END) as can_count,
sum(case when  stage_src_code <> 'cancelled' THEN 1 ELSE 0 END) as non_can_count,
count(1) as tot_count,
sum(case when target_c = 'resolution' and  stage_src_code <> 'cancelled' and outcome_flag ='Y' THEN 1 ELSE 0 END) as resolution_non_can_breached_count,
sum(case when target_c = 'resolution' and  stage_src_code <> 'cancelled' THEN 1 ELSE 0 END) as resolution_non_can_count,
sum(case when target_c = 'response' and  stage_src_code <> 'cancelled' and outcome_flag ='Y' THEN 1 ELSE 0 END) as response_non_can_breached_count,
sum(case when target_c = 'response' and  stage_src_code <> 'cancelled' THEN 1 ELSE 0 END) as response_non_can_count,
sum(case when target_c = 'resolution' THEN 1 ELSE 0 END) as resolution_sla_count ,
sum(case when target_c = 'response' THEN 1 ELSE 0 END) as response_sla_count 
from png_mdwdb.f_incident a 
JOIN png_mdwdb.f_task_sla b 
ON a.incident_key = b.incident_key and a.source_id=b.source_id
join  png_mdwdb.d_task_sla dt on dt.row_key=b.sla_key
where b.task_type='INCIDENT'
group by 1) A
join png_mdwdb.d_incident B
on A.incident_key = B.row_key
where B.met_all_response_sla_flag_c <> case when A.response_non_can_count > 0 and A.response_non_can_breached_count > 0 then 'N'
when A.response_non_can_count > 0 and A.response_non_can_breached_count = 0 then 'Y'
when A.response_sla_count = 0 then 'X'
when A.response_sla_count > 0 and A.response_non_can_count = 0 then 'C' else 'X' end 