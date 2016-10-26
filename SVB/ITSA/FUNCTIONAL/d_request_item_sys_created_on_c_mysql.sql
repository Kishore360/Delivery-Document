
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
SELECT  count(1) cnt 
	FROM  svb_mdsdb.sc_req_item_final b 
	LEFT JOIN svb_mdsdb.sc_cat_item_final LKP
ON b.cat_item = LKP.sys_id
AND b.sourceinstance = LKP.sourceinstance
left JOIN svb_mdwdb.d_request_item d
on 
b.sys_id=d.row_id AND b.sourceinstance=d.source_id
LEFT JOIN  
(
	SELECT SRC1.sysapproval,SRC2.last_update,SRC1.state,SRC1.sys_created_on,SRC1.sys_updated_on,SRC1.sourceinstance 
	FROM svb_mdsdb.sysapproval_approver_final SRC1
	JOIN (
			SELECT sysapproval,max(CONCAT((convert(sys_updated_on , signed)),(convert(sys_created_on , signed)))) as last_update FROM svb_mdsdb.sysapproval_approver_final LKP1
			GROUP BY 1
		) SRC2
	ON SRC1.sysapproval = SRC2.sysapproval
	AND CONCAT((convert(SRC1.sys_updated_on , signed)),(convert(SRC1.sys_created_on , signed))) = SRC2.last_update
) LKP1
ON LKP1.sysapproval = d.row_id
AND LKP1.sourceinstance = d.source_id
where
CASE WHEN UPPER(LKP.short_description) = 'VIRTUAL SERVER' THEN CONVERT_TZ(LKP1.sys_created_on,'GMT','America/Los_Angeles')
					ELSE NULL 
					END<>d.sys_created_on_c)b