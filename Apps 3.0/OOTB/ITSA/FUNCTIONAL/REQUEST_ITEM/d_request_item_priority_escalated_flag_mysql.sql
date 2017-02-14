SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for d_request_item.priority_escalated_flag' ELSE 'SUCCESS' END as Message from (
	 FROM (SELECT count(1) as CNT 
	select case when locate('Y',b.res)>0 then 'Y' else 'N' end as priority_escalation,c.sys_id,
	d.priority_escalated_flag as target from (
	select group_concat(a.flag) as res,a.documentkey from (
	select case when newvalue<oldvalue then 'Y' else 'N' end as flag,documentkey from <<tenant>>_mdsdb.sys_audit_final 
	 where
	tablename = 'sc_req_item' 
	AND fieldname =  'priority' and oldvalue is not null and newvalue is not null
	)a group by a.documentkey
	)b
	 join <<tenant>>_mdsdb.sc_req_item_final c on b.documentkey=c.sys_id
	join <<tenant>>_mdwdb.d_request_item d on c.sys_id = d.row_id and c.sourceinstance = d. source_id
	) e where priority_escalation<>target;
	

