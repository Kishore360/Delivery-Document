SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select Count(1) as cnt
FROM cardinalhealth_mdsdb.rm_enhancement_final i 
JOIN cardinalhealth_mdwdb.f_enhancement_rm f 
ON i.sys_id=f.row_id 	AND i.sourceinstance=f.source_id 
join cardinalhealth_mdwdb.d_enhancement_rm_c d
on COALESCE(i.parent,'UNSPECIFIED') =d.row_id      --  AND i.sourceinstance=d.source_id 
where coalesce(d.row_key,case when i.parent is null then 0 else -1 end)<>f.enhancement_parent_c_key)a