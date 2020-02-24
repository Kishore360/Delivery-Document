SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
  CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_incidnet.closed_by_key' ELSE 'SUCCESS' END as Message from(
  select count(1) cnt from wpl_mdsdb.incident_final incident
left join wpl_mdwdb.f_incident f on incident.sys_id= f.row_id and incident.sourceinstance=f.source_id
join wpl_mdwdb.d_lov_map lv on f.state_src_key=lv.src_key and lv.dimension_wh_code in  ('RESOLVED','CLOSED')
join wpl_mdwdb.d_internal_contact di on di.row_id = concat('INTERNAL_CONTACT~',incident.closed_by)

where(case when incident.closed_by is null then 0 else di.row_key end) <>    f.last_resolved_by_key and incident.cdctype<>'D'
        

 
)a;