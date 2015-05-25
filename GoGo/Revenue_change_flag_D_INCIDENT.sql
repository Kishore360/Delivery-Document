SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM ( select count(*) as cnt from gogo_mdsdb.change_request_final a
inner join gogo_mdwdb.d_change_request  b on a.sys_id collate utf8_unicode_ci=b.row_id  #and b.row_key <100
where case when a.u_rescheduled_change='1' then 'Y' else 'N' end <> b.rescheduled_change_c_flag
) c;
 
