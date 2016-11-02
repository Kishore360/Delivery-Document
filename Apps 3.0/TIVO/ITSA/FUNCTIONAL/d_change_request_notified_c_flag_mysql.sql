SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt from 
tivo_mdwdb.d_change_request a
JOIN tivo_mdsdb.change_request_final b ON a.row_id=b.sys_id
AND a.source_id=b.sourceinstance
where  a.notified_c_flag <>case when b.u_notified = 1 then 'Y' ELSE 'N' END
 
)b





