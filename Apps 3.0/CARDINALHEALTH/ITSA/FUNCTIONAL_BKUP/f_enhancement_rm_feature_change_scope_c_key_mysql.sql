SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select Count(1) as cnt
FROM cardinalhealth_mdsdb.rm_enhancement_final i 
JOIN cardinalhealth_mdwdb.f_enhancement_rm f 
ON i.sys_id=f.row_id 	AND i.sourceinstance=f.source_id 
join
cardinalhealth_mdsdb.rm_feature_final l ON i.sys_id=l.sys_id 
and i.sourceinstance=l.sourceinstance
join cardinalhealth_mdwdb.d_lov d
on COALESCE(CONCAT('CHANGE_SCOPE_C~RM_FEATURE~~~',UPPER(l.u_change_scope)),'UNSPECIFIED') =d.row_id      --  AND i.sourceinstance=d.source_id 
where coalesce(d.row_key,case when l.u_change_scope is null then 0 else -1 end)<>f.feature_change_scope_c_key)a