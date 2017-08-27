SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END as Message from (
select count(1) as cnt from
schneider_mdsdb.incident_final SRC 
JOIN   schneider_mdwdb.f_incident TRGT on SRC.sourceinstance = TRGT.source_id AND TRGT.row_id = SRC.incident_number
left join schneider_mdwdb.d_internal_organization LKP on 
CONCAT('GROUP~',SRC.u_resolved_by_group)= LKP.row_id  AND SRC.sourceinstance = TRGT.source_id 
WHERE  TGRT.resolved_by_group_key <> CASE WHEN SRC.u_resolved_by_group is null then 0 
WHEN (SRC.u_resolved_by_group is not null and TRGT.pivot_date is null) then -1 else LKP.row_key end)e; 

