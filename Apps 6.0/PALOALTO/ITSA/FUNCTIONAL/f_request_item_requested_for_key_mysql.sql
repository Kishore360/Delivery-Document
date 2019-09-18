SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN count(1) > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM  paloalto_mdsdb.sc_req_item_final sri
Left join paloalto_mdsdb.sc_request_final scr on sri.request = scr.sys_id and scr.sourceinstance=sri.sourceinstance
LEFT JOIN paloalto_mdwdb.d_internal_contact dio on concat('INTERNAL_CONTACT~',scr.opened_by) = dio.row_id
LEFT join paloalto_mdwdb.f_request_item f
on sri.sys_id = f.row_id and sri.sourceinstance = f.source_id
where coalesce(dio.row_key,case when scr.requested_for is null then 0 else -1 end) <> f.requested_for_key
and sri.CDCTYPE='X' and scr.CDCTYPE='X' and dio.soft_deleted_flag='N' ;


