SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.dormant_flag' ELSE 'SUCCESS' END as Message
from rei_mdsdb.pm_portfolio_final s
left join rei_mdwdb.d_portfolio_c   t
on s.sys_id=t.row_id and s.sourceinstance=t.source_id
left join rei_mdwdb.d_internal_contact l
on  COALESCE(CONCAT('INTERNAL_CONTACT~',u_portfolio_owner),'UNSPECIFIED')= l.row_id
 and s.sourceinstance=l.source_id
 and t.changed_on between l.effective_from and l.effective_to
WHERE t.portfolio_owner_key <> l.row_key
