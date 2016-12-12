
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request.assigned_to_key' ELSE 'SUCCESS' END as Message
FROM nbcu_mdwdb.f_incident a
JOIN nbcu_mdsdb.incident_final b ON a.row_id=b.sys_id AND a.source_id = b.sourceinstance
join nbcu_mdwdb.d_lov d
on COALESCE(concat('ROOT_CAUSE_CATEGORY_C~INCIDENT~~~',b.u_root_cause_category),'UNSPECIFIED')= d.row_id
where coalesce(d.row_key,case when b.u_root_cause_category is null then 0 else -1 end)<>a.root_cause_category_src_c_key