SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
from(select count(1) as cnt 
from pgi_mdsdb.incident_final a 

inner join pgi_mdwdb.f_incident b  

on a.sys_id=b.row_id and 

a.sourceinstance=b.source_id 
LEFT JOIN (
SELECT SUM(CASE 
			WHEN told.u_support_tier_type = 'N/A'
				 AND tnew.u_support_tier_type IN ('Tier 1','Tier 2','Tier 3','Tier 4') THEN 1 
			WHEN told.u_support_tier_type = 'Tier 1'
				 AND tnew.u_support_tier_type IN ('Tier 2','Tier 3','Tier 4') THEN 1
			WHEN told.u_support_tier_type = 'Tier 2'
				 AND tnew.u_support_tier_type IN ('Tier 3','Tier 4') THEN 1
			WHEN told.u_support_tier_type = 'Tier 3'
				 AND tnew.u_support_tier_type = 'Tier 4' THEN 1
		   ELSE 0
		   END) AS support_tier_escalated_c,documentkey 
FROM pgi_mdsdb.sys_audit_final d
JOIN pgi_mdsdb.sys_user_group_final tnew ON tnew.sys_id=d.newvalue
JOIN pgi_mdsdb.sys_user_group_final told ON told.sys_id=d.oldvalue
WHERE d.tablename LIKE '%incident%' AND d.fieldname ='assignment_group' 
GROUP BY documentkey)lkp ON lkp.documentkey =b.row_id
WHERE COALESCE(lkp.support_tier_escalated_c, case when b.support_tier_escalated_c is null or b.support_tier_escalated_c = 0 THEN 0 else b.support_tier_escalated_c end )
<>  b.support_tier_escalated_c )e
