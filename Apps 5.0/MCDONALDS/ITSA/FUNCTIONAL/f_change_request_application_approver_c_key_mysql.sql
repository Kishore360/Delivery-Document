select number, u_approver,b.name,application_approver_c_key,d.row_key from  mcdonalds_mdsdb.change_request_final a
left join mcdonalds_mdsdb.sys_user_final b on a. u_approver=b.sys_id and a.sourceinstance=b.sourceinstance
left join mcdonalds_mdwdb.d_internal_contact d on concat('INTERNAL_CONTACT~',b.sys_id)=row_id 
left join mcdonalds_mdwdb.f_change_request f on a.sys_id=f.row_id and a.sourceinstance=f.source_id
left join  mcdonalds_mdwdb.f_change_request_application_approver_c f1 on f.change_request_key=f1.change_request_key

