select a.number,b.name,c.name,b1.name,c1.name dept_head,c2.name dept_head2,c3.name dept_head3,c4.name dept_head4,c5.name dept_head5
from aetna_mdsdb.incident_final a
left join aetna_mdsdb.sys_user_group_final b on a.assignment_group=b.sys_id and a.sourceinstance=b.sourceinstance
left join aetna_mdsdb.sys_user_final c on b.manager=c.sys_id and a.sourceinstance=c.sourceinstance
left join aetna_mdsdb.cmn_department_final b1 on c.department=b1.sys_id and c.sourceinstance=b1.sourceinstance
left join aetna_mdsdb.sys_user_final c1 on b1.dept_head=c1.sys_id and b1.sourceinstance=c1.sourceinstance
left join aetna_mdsdb.sys_user_final c2 on c1.manager=c2.sys_id and c1.sourceinstance=c2.sourceinstance
left join aetna_mdsdb.sys_user_final c3 on c2.manager=c3.sys_id and c3.sourceinstance=c2.sourceinstance
left join aetna_mdsdb.sys_user_final c4 on c3.manager=c4.sys_id and c3.sourceinstance=c4.sourceinstance
left join aetna_mdsdb.sys_user_final c5 on c4.manager=c5.sys_id and c3.sourceinstance=c5.sourceinstance
where b.name like '%EDI Vendor-Optum%' and c.name like '%Karen Fountain%' and a.number='INC3685187';