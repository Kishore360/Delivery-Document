SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM(select count(*) as cnt from autotrader_workdb.dwh_f_request AA
INNER JOIN autotrader_mdsdb.sc_request_final BB ON AA.row_id COLLATE utf8_general_ci = BB.sys_id AND
AA.source_id=BB.sourceinstance
where state_src_code collate utf8_general_ci<>  BB.u_state) c