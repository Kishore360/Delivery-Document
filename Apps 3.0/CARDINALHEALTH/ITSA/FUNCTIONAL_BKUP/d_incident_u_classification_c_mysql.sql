SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from
cardinalhealth_mdsdb.incident_final a
left join cardinalhealth_mdwdb.d_incident b
on a.sys_id=b.row_id and b.source_id=a.sourceinstance
LEFT JOIN cardinalhealth_mdsdb.u_classification_final uc ON uc.sys_id=a.u_classification 
	AND uc.sourceinstance=a.sourceinstance 
where b.u_classification_c <> TRIM(REPLACE(REPLACE(uc.u_classification,'',''),'','')) ;