SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM ( select count(*) as cnt from gogo_mdsdb.change_request_final s
inner join gogo_mdwdb.f_change_request i on s.sys_id collate utf8_unicode_ci=i.row_id 
and s.sourceinstance = i.source_id
where coalesce(s.u_level_3 collate utf8_unicode_ci ,' ')<>coalesce(i.level_3_src_code_c ,' ')
) c;