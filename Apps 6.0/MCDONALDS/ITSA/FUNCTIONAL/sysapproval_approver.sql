select a.number,a.sys_id,b.document_id,b.approver,c.full_name from mcd_mdsdb.change_request_final a
left join   mcd_mdsdb.sysapproval_approver_final b  on a.sys_id=b.document_id
left join mcd_mdwdb.d_internal_contact c on concat('INTERNAL_CONTACT~',approver)=row_id 
where b.state='approved' and a.number='CHG9011477';