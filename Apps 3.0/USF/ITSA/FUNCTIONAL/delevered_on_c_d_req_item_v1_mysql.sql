 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM(select count(*) as cnt from usf_mdwdb.d_request_item a left join
 usf_mdsdb.sc_req_item_final b on a.row_id=b.sys_id and a.source_id=b.sourceinstance
where a.delevered_on_c <> CONVERT_TZ(b.u_delivered_at,'GMT','America/New_York'))c;
 