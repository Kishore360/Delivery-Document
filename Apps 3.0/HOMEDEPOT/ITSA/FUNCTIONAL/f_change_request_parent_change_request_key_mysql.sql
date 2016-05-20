
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(*) cnt from
homedepot_mdwdb.f_change_request TRGT
join
homedepot_mdsdb.change_request_final SRC
on TRGT.row_id = SRC.sys_id and TRGT.source_id= SRC.sourceinstance
join
homedepot_mdwdb.d_change_request LKP
on (COALESCE(SRC.u_parent_change,'UNSPECIFIED') = LKP.row_id and TRGT.source_id= LKP.source_id)
where coalesce(LKP.row_key,case when SRC.u_parent_change IS NULL THEN 0 else -1 end ) <> TRGT.parent_change_request_key)a