SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'Failure' ELSE 'Data Matched' END as Message
FROM (SELECT count(1) as CNT
from cardinalhealth_mdwdb.d_outage_c d
JOIN cardinalhealth_mdsdb.cmdb_ci_outage_final i
on d.row_id=i.sys_id and d.source_id=i.sourceinstance
LEFT JOIN cardinalhealth_mdsdb.cmdb_ci_final c ON i.cmdb_ci  = c.sys_id 
where COALESCE(CONVERT_TZ(i.end,'GMT','America/New_York'),
CONVERT_TZ(i.sys_created_on,'GMT','America/New_York')) <> d.outage_end_date)temp;

;

