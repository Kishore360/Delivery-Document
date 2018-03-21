SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (

select count(1) cnt  from 				
  wow_mdsdb.sc_req_item_final src 
  left join wow_mdwdb.d_request_item trgt
	ON trgt.row_id = src.sys_id
	AND trgt.source_id = src.sourceinstance
left JOIN wow_mdsdb.sc_req_item_ext_final sre
ON src.sys_id = sre.record_id
where trgt.need_more_c <>sre.need_more)a;


