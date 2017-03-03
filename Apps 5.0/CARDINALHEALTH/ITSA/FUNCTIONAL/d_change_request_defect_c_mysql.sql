SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'Failure' ELSE 'Data Matched' END as Message
FROM (SELECT count(1) as CNT 
from
cardinalhealth_mdwdb.d_change_request c
JOIN cardinalhealth_mdsdb.change_request_final a on c.row_id = a.sys_id and c.source_id= a.sourceinstance
LEFT JOIN cardinalhealth_mdsdb.rm_defect_final b on a.u_defect=b.sys_id and a.sourceinstance=b.sourceinstance
where c.defect_c <> b.number)temp;
