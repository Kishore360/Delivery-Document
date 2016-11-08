SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
SELECT  count(1) cnt from
(SELECT b.number,d.request_item_number, d.sys_created_on_c trgt, CASE WHEN UPPER(c.short_description) = 'VIRTUAL SERVER' THEN 
                CONVERT_TZ(a.sys_created_on,'GMT','America/Los_Angeles')ELSE NULL  end as src
FROM (SELECT SRC1.sysapproval,SRC2.last_update,SRC1.state,SRC1.approver,SRC1.sys_created_on,SRC1.sys_updated_on,SRC1.sourceinstance 
                FROM svb_mdsdb.sysapproval_approver_final SRC1
                JOIN (
                                                SELECT sysapproval,max(CONCAT((convert(sys_updated_on , signed)),(convert(sys_created_on , signed)))) as last_update FROM svb_mdsdb.sysapproval_approver_final LKP1
                                                GROUP BY 1
                                ) SRC2
                ON SRC1.sysapproval = SRC2.sysapproval
                AND CONCAT((convert(SRC1.sys_updated_on , signed)),(convert(SRC1.sys_created_on , signed))) = SRC2.last_update) a
INNER JOIN svb_mdsdb.sc_req_item_final b on a.sysapproval=b.sys_id
inner join svb_mdsdb.sc_cat_item_final c ON b.cat_item = c.sys_id AND b.sourceinstance = c.sourceinstance
left JOIN svb_mdwdb.d_request_item d on b.sys_id=d.row_id AND b.sourceinstance=d.source_id)a
where src<>trgt)b;