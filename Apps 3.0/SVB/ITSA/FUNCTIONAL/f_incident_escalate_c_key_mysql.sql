SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN count(1) > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM  svb_mdsdb.incident_final a
left join svb_mdwdb.d_lov c
on concat('ESCALATION~INCIDENT~~~',a.escalation)=c.row_id
and a.sourceinstance=c.source_id
 left JOIN  
  svb_mdwdb.f_incident b on b.source_id=a.sourceinstance AND  b.row_id=a.sys_id
where b.escalate_c_key<>c.row_key