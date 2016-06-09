SELECT CASE WHEN cnt> 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_incident_asc_c.last_resolved_on' ELSE 'data matched' END as
 Message  from (
select count(1) as cnt  FROM mercuryins_mdsdb.u_asc_ticket_final SRC  LEFT JOIN mercuryins_mdwdb.d_incident_asc_c TRGT  
ON (SRC.sys_id =TRGT.row_id   AND SRC.sourceinstance= TRGT.source_id  )
left join mercuryins_mdwdb.f_incident_asc_c f on f.incident_key=TRGT.row_key
JOIN mercuryins_mdwdb.d_lov_map dlm 
ON f.state_src_key = dlm.src_key
 WHERE 
case when
 dlm.dimension_wh_code = 'RESOLVED' then 
 convert_tz(SRC.u_resolved,'GMT','America/Los_Angeles') else null end 
<> TRGT.last_resolved_on)x
