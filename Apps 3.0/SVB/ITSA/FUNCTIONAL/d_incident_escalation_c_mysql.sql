SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select  count(1) cnt from
(select a.escalation,
	case	WHEN a.escalation = 'y'
							OR a.escalation = 'Y'
							OR a.escalation = 'Yes'
							OR a.escalation = 'YES'
							OR a.escalation = '1' THEN 'Y'
							WHEN a.escalation = 'n'
							OR a.escalation = 'N'
							OR a.escalation = 'No'
							OR a.escalation = 'NO'
							OR a.escalation = '0'
					OR a.escalation IS NULL THEN 'N'
							ELSE 'N' END AS  src,b.escalation_c trgt

from
svb_mdsdb.incident_final a join
 svb_mdwdb.d_incident b
on a.sys_id=b.row_id
and a.sourceinstance=b.source_id)a
where src<>trgt)b;





