SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN count(1) > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM  tivo_mdsdb.sc_req_item_final sri
LEFT JOIN tivo_mdwdb.d_internal_contact dio on concat('INTERNAL_CONTACT~',sri.u_request_for) = dio.row_id
LEFT join tivo_mdwdb.f_request f
on sri.sys_id = f.row_id and sri.sourceinstance = f.source_id
where coalesce(dio.row_key,case when sri.u_request_for is null then 0 else -1 end) <> f.requested_for_key ;
