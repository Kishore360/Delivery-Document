should be a final query

select  * from 
(select d_inc.incident_number,tsf.stage,has_breached,
case when tsf.stage not in ('Cancelled','in_progress') and has_breached =0 then 'Y'
when tsf.stage not in ('Cancelled','in_progress') and has_breached =1 then 'N'
when tsf.stage= 'Cancelled'  then 'X' 
when tsf.stage ='in_progress' and has_breached in (1,0) then 'P'
when tsf.stage= 'Paused' and has_breached =0 then 'Y'
when tsf.stage= 'Paused' and has_breached =1 then 'N'
else 'X' end as met_resolution_sla_flag,d_inc.incident_met_resolution_sla_c_flag
FROM  molinahealth_mdsdb.task_sla_final tsf  
JOIN
  (

  select a.task,a.sourceinstance,a.stage stage, 
  CASE  WHEN   count(distinct planned_end_time)=1 then max(a.sys_created_on)  
  /*when count(distinct planned_end_time)>1 then  (select sco from (
    select a.task,stage,sco from  molinahealth_mdsdb.task_sla_final a  join
  (select task,planned_end_time,max(a.sys_created_on) sco from  molinahealth_mdsdb.task_sla_final a
      join  molinahealth_mdsdb.task_final b on a.task=b.sys_id  and a.sourceinstance=b.sourceinstance    
   where task='421ee3ad0f8ff24056d942bce1050efe' and  sys_class_name in ('incident','sc_req_item') 
   and a.stage not in ('cancelled') group by task having count(distinct planned_end_time)>1 ) b on a.task=b.task and b.sco=a.sys_created_on)aa)   */
  
  else  max(planned_end_time)
      
   end as date_to_be_used
    FROM molinahealth_mdsdb.task_sla_final a
      join  molinahealth_mdsdb.task_final b on a.task=b.sys_id  and a.sourceinstance=b.sourceinstance    
   where sys_class_name in ('incident','sc_req_item') and a.stage not in ('cancelled')  --    and task='421ee3ad0f8ff24056d942bce1050efe'
   group by task

  
            ) AA ON tsf.TASK = AA.TASK and tsf.sourceinstance=AA.sourceinstance and tsf.stage=AA.stage
			and ((date_to_be_used=planned_end_time) or (date_to_be_used=sys_created_on))
join molinahealth_mdwdb.d_incident d_inc ON AA.task=d_inc.row_id and AA.sourceinstance=d_inc.source_id
JOIN molinahealth_mdwdb.f_incident TRGT ON TRGT.incident_key=d_inc.row_key
JOIN molinahealth_mdwdb.d_lov_map br  ON TRGT.state_src_key = br.src_key
 WHERE  tsf.stage not in ('cancelled')  -- br.dimension_wh_code IN ('RESOLVED') -- Remove this condition later
GROUP BY tsf.TASK)a 
where  -- incident_met_resolution_sla_c_flag  not in ('X') and -- Checks this condition in other query
  met_resolution_sla_flag<>incident_met_resolution_sla_c_flag
  
  
   
      select incident_number,row_id,incident_met_resolution_sla_c_flag from molinahealth_mdwdb.d_incident where incident_number='INC0067722';
      
      
 SELECT number,src2.sys_id,sla,TASK task,src1.sourceinstance sourceinstance,src1.stage,planned_end_time,src1.sys_created_on  
 FROM molinahealth_mdsdb.task_sla_final src1
 join molinahealth_mdsdb.incident_final src2 on src1.task=src2.sys_id and src1.sourceinstance=src2.sourceinstance
   where number='INC0067722';