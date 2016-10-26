
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN count(1) > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM 
   tivo_mdwdb.f_request_item a11
 join tivo_mdsdb.sc_req_item_final a12
on a11.row_id=a12.sys_id and a11.source_id=a12.sourceinstance
LEFT JOIN tivo_mdsdb.task_final lkp ON a11.row_id=lkp.sys_id and a11.source_id = lkp.sourceinstance
left join tivo_mdwdb.d_internal_contact a13
on COALESCE(concat('INTERNAL_CONTACT~',a12.u_request_for),'UNSPECIFIED')=a13.row_id and a12.sourceinstance=a13.source_id
where coalesce(a13.row_key,case when a12.u_request_for is null then 0 else -1 end) <>a11.requested_for_key
 