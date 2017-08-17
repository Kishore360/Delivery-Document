-- query which checks for single record, then use planned end time to set the flag in target --

SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (select count(1)cnt from (select d_inc.incident_number,aa.stage,aa.has_breached,
case when aa.stage not in ('Cancelled','in_progress') and has_breached =0 then 'Y'
when aa.stage not in ('Cancelled','in_progress') and has_breached =1 then 'N'
when aa.stage= 'Cancelled'  then 'X' 
when aa.stage ='in_progress' and has_breached in (1,0) then 'P'
when aa.stage= 'Paused' and has_breached =0 then 'Y'
when aa.stage= 'Paused' and has_breached =1 then 'N'
else 'X' end as met_resolution_sla_flag,d_inc.incident_met_resolution_sla_c_flag
FROM
(    select a.task task,stage,has_breached,sourceinstance,pet from  molinahealth_mdsdb.task_sla_final a  join
  (select task,max(a.planned_end_time) pet from  molinahealth_mdsdb.task_sla_final a
      join  molinahealth_mdsdb.task_final b on a.task=b.sys_id  and a.sourceinstance=b.sourceinstance    
   where -- task='421ee3ad0f8ff24056d942bce1050efe' and
   
   sys_class_name in ('incident','sc_req_item') 
   and a.stage not in ('cancelled') group by task having count(task)=1 ) b on a.task=b.task and b.pet=a.planned_end_time)aa
      join molinahealth_mdwdb.d_incident d_inc ON aa.task=d_inc.row_id and aa.sourceinstance=d_inc.source_id
JOIN molinahealth_mdwdb.f_incident TRGT ON TRGT.incident_key=d_inc.row_key
JOIN molinahealth_mdwdb.d_lov_map br  ON TRGT.state_src_key = br.src_key
   -- br.dimension_wh_code IN ('RESOLVED') -- Remove this condition later

 where stage not in ('cancelled')
)a -- where  incident_met_resolution_sla_c_flag  not in ('N') and -- Checks this condition in  query 2
   where met_resolution_sla_flag<>incident_met_resolution_sla_c_flag)a