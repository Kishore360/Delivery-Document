select a.number,a.sys_id,b.document_id,b.approver,c.full_name from mcdonalds_mdsdb.change_request_final a
left join   mcdonalds_mdsdb.sysapproval_approver_final b  on a.sys_id=b.document_id
left join mcdonalds_mdwdb.d_internal_contact c on concat('INTERNAL_CONTACT~',approver)=row_id 