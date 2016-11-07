SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message

from rei_mdsdb.pm_project_final a
inner join rei_mdwdb.f_project_c b
on a.sys_id=b.row_id and 
a.sourceinstance=b.source_id
where a.u_expense_budget<>b.itg_approved_expense