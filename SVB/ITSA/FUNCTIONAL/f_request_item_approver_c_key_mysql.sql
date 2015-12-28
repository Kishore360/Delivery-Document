SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
SELECT count(1) cnt 
	FROM svb_mdsdb.sysapproval_approver_final a
INNER JOIN svb_mdsdb.sc_req_item_final b on
a.sysapproval=b.sys_id
inner join 
svb_mdsdb.sc_cat_item_final c
ON b.cat_item = c.sys_id
AND b.sourceinstance = c.sourceinstance
left JOIN svb_mdwdb.f_request_item d
on 
b.sys_id=d.row_id AND b.sourceinstance=d.source_id
LEFT  JOIN  svb_mdwdb.d_internal_contact e
on CONCAT('INTERNAL_CONTACT~',a.approver)= e.ROW_ID 
AND e.source_id = a.sourceinstance
where c.short_description='Virtual Server' AND
case when a.approver is null then 0
when  CONCAT('INTERNAL_CONTACT~',a.approver) is not null and e.row_key is null then -1
else 
 e.row_key end<>d.approver_c_key )b