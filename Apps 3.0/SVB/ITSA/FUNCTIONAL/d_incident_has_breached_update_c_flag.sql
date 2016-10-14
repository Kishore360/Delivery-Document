SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.has_breached_update_c_flag' ELSE 'SUCCESS' END as Message
 FROM(select a12.incident_key,group_concat(a12.outcome_flag) as src,has_breached_update_c_flag trgt from svb_mdwdb.d_incident  a11
join svb_mdwdb.f_task_sla a12
on a11.row_key = a12.incident_key
join svb_mdwdb.d_task_sla a13
on a12.sla_key = a13.row_key
join svb_mdwdb.d_lov_map a14
where a14.dimension_class = 'STAGE~TASK_SLA' 
and a14.dimension_wh_code <>'CANCELLED'
and a13.soft_deleted_flag='N'
and a13.sla_category ='TimeToUpdate'
and a13.type_c='OLA'
and a12.task_type='INCIDENT'
group by 1)  res
where CASE WHEN src like '%Y%'THEN 'Y' ELSE 'N'END<>trgt
