SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM(
select count(*) as cnt from incomm_mdwdb.f_incident dfi 
 join (SELECT sys_id, sourceinstance, u_resolved_on as closed_at, u_resolved_by as closed_by from incomm_mdsdb.incident_final) incf 
 on dfi.row_id collate utf8_general_ci = incf.sys_id and dfi.source_id= incf.sourceinstance 
 and dfi.last_resolved_on_key = COALESCE(DATE_FORMAT(CONVERT_TZ(incf.closed_at,'@#TENANT_SSI_TIME_ZONE@#','@#DW_TARGET_TIME_ZONE@#'),'%Y%m%d'),'UNSPECIFIED') and dfi.last_resolved_by_key = case when incf.closed_by is null then 'UNSPECIFIED' else concat('INTERNAL_CONTACT~',incf.closed_by) end )c; 
