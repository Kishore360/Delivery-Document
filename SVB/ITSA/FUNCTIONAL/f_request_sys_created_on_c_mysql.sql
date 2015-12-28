SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
SELECT  count(1) cnt 
	FROM svb_mdsdb.sysapproval_approver_final a
INNER JOIN svb_mdsdb.sc_req_item_final b on
a.sysapproval=b.sys_id
inner join 
svb_mdsdb.sc_cat_item_final c
ON b.cat_item = c.sys_id
AND b.sourceinstance = c.sourceinstance
left JOIN svb_mdwdb.d_request_item d
on 
b.sys_id=d.row_id AND b.sourceinstance=d.source_id
where
  c.short_description='Virtual Server' and  #a.sys_created_on=d.sys_created_on_c

CONVERT_TZ(a.sys_created_on,'GMT','US/Mountain')<>d.sys_created_on_c)b