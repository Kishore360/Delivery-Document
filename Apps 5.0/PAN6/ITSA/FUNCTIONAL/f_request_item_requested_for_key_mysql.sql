SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN count(1) > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM  pan6_mdsdb.sc_req_item_final sri
Left join pan6_mdsdb.sc_request_final scr on sri.request = scr.sys_id and scr.sourceinstance=sri.sourceinstance
LEFT JOIN pan6_mdwdb.d_internal_contact dio on concat('INTERNAL_CONTACT~',scr.requested_for) = dio.row_id
LEFT join pan6_mdwdb.f_request_item f
on sri.sys_id = f.row_id and sri.sourceinstance = f.source_id
where coalesce(dio.row_key,case when scr.requested_for is null then 0 else -1 end) <> f.requested_for_key ;


