SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'Failure' ELSE 'Data Matched' END as Message
FROM (SELECT count(1) as CNT
from cardinalhealth_mdwdb.d_internal_organization a
JOIN cardinalhealth_mdsdb.sys_user_group_final b
 ON a.row_id=CONCAT('GROUP~',b.sys_id) AND a.source_id=b.sourceinstance
 where COALESCE(b.u_segment,'UNSPECIFIED')<> a.segment_c)temp;
 