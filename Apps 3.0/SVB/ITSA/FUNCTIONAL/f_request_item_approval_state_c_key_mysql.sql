SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt  from (
select coalesce(c.row_key,case when a.state is null then 0 else -1  end),d.approval_state_c_key,
 upper(e.short_description), case when  upper(e.short_description)='Virtual Server'  then CONCAT('APPROVAL~SYSAPPROVAL_APPROVER','~~~',upper(a.state)) ELSE 'UNSPECIFIED' end 
, c.ROW_ID   from 

(
	SELECT SRC2.sysapproval,SRC2.sys_id sys_id,SRC1.sourceinstance,SRC1.state state
	FROM svb_mdsdb.sysapproval_approver_final SRC1
	JOIN (
			SELECT sys_id,sysapproval,max(sys_created_on ) as created_date 
FROM  svb_mdsdb.sysapproval_approver_final LKP1 
			GROUP BY 2,1 
		) SRC2
	ON SRC1.sys_id = SRC2.sys_id
	) a

INNER JOIN svb_mdsdb.sc_req_item_final b on
a.sysapproval=b.sys_id
inner join 
svb_mdsdb.sc_cat_item_final e
ON b.cat_item = e.sys_id
AND b.sourceinstance = e.sourceinstance
left JOIN svb_mdwdb.f_request_item d
on 
b.sys_id=d.row_id AND b.sourceinstance=d.source_id
LEFT  JOIN  svb_mdwdb.d_lov c
on case when  upper(e.short_description)='Virtual Server'  then CONCAT('APPROVAL~SYSAPPROVAL_APPROVER','~~~',upper(a.state)) ELSE 'UNSPECIFIED' end 
= c.ROW_ID 


where 
coalesce(c.row_key,case when a.state is null then 0 else -1  end)<>d.approval_state_c_key)a)b