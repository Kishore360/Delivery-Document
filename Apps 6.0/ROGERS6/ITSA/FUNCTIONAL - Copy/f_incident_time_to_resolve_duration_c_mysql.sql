SELECT 
CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message from (
select count(1) cnt
        FROM rogers_mdwdb.f_incident f
JOIN  rogers_mdsdb.incident_final a ON f.row_id = a.sys_id and f.source_id =a.sourceinstance
where  f.time_to_resolve_duration_c <> 
TIMESTAMPDIFF(SECOND,CONVERT_TZ(a.sys_created_on,'GMT','America/New_York'),CASE WHEN length(a.u_resolved_time)=19 THEN CAST(a.u_resolved_time AS datetime)
ELSE NULL END)
and a.CDCTYPE='X'
)a