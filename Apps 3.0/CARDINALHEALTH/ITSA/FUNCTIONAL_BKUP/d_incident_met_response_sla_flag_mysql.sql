SELECT CASE WHEN cnt > 0 THEN 'FaILURE' ELSE 'SUCCESS' END aS Result
,CaSE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END aS Message 
FROM (
select count(1) as cnt  from
cardinalhealth_mdwdb.d_incident d_inc 
left join (
			select a.incident_key,max(case when a.sla_category='Resolution' then a.outcome_flag end) as resolution,
			max(case when a.sla_category='Response' then a.outcome_flag  end  ) as response 
			from (SELECT f_sla.incident_key,d_sla.sla_category, group_concat(f_sla.outcome_flag) as outcome_flag  
					FROM cardinalhealth_mdwdb.f_task_sla f_sla
					join (select distinct incident_key as incident_key from cardinalhealth_mdwdb.f_task_sla 
							where task_type='incident' ) tt 
					on tt.incident_key=f_sla.incident_key
					join cardinalhealth_mdwdb.d_task_sla d_sla 
					on d_sla.row_key=f_sla.sla_key 
					and d_sla.soft_deleted_flag='N' 
					and f_sla.task_type='incident'
					group by f_sla.incident_key,d_sla.sla_category) a group by incident_key) tmp 
	 on d_inc.row_key=tmp.incident_key 
	 join (select distinct incident_key as incident_key from cardinalhealth_mdwdb.f_task_sla where task_type='incident') tmp1
	 on tmp1.incident_key=d_inc.row_key
where d_inc.met_response_sla_flag<>coalesce(case when tmp.response like '%Y%' then 'N' else 'Y' end,'Y'))c