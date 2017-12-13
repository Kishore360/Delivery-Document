
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) cnt from svb_mdsdb.sc_req_item_final a
left join svb_mdwdb.d_request_item b 
on a.sourceinstance=b.source_id and a.sys_id=b.row_id
where case when a.u_reclassify = 1 then 'Y' else 'N' end <>b.reclassify_flag_c

)i; 