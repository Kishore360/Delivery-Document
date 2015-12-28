SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) cnt   from 
(
	SELECT SRC2.sysapproval,SRC2.sys_id sys_id,SRC1.sourceinstance,SRC1.state state
	FROM svb_mdsdb.sysapproval_approver_final SRC1
	JOIN (
			SELECT sys_id,sysapproval,max(sys_created_on ) as created_date 
FROM  svb_mdsdb.sysapproval_approver_final LKP1 #where sysapproval='0005ecc54f63c280ca59cb4e0210c755'
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
on CONCAT('APPROVAL~SYSAPPROVAL_APPROVER','~~~',a.state)= c.ROW_ID 
AND c.source_id = a.sourceinstance

where e.short_description='Virtual Server' and  #c.row_key=17276
case when a.state is null then 0  
when  CONCAT('APPROVAL~SYSAPPROVAL_APPROVER',a.state) is not null and c.row_key is null then -1
 else
c.row_key end<>d.approval_state_c_key)X


