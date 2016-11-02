SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt from 
tivo_mdwdb.d_change_request a
JOIN tivo_mdsdb.change_request_final b ON a.row_id=b.sys_id
AND a.source_id=b.sourceinstance
where  msos_to_be_notified_count_c<>coalesce(length(b.u_companies)-length(replace(b.u_companies,',',''))+1,0)
 
)b


