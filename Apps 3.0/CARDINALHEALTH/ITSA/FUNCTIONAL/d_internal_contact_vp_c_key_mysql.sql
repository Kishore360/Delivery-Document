SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'Failure' ELSE 'Data Matched' END as Message 
FROM (SELECT count(1) as CNT
from cardinalhealth_mdwdb.d_internal_contact a
JOIN cardinalhealth_mdsdb.sys_user_final b ON right(a.row_id,32)=b.sys_id AND a.source_id=b.sourceinstance 
LEFT JOIN cardinalhealth_mdwdb.d_internal_contact e 
ON e.row_id= COALESCE(concat('INTERNAL_CONTACT~',b.u_vp),'UNSPECIFIED')AND e.source_id=b.sourceinstance
AND DATE_FORMAT(e.pivot_date, '%Y-%m-%d %H:%i:%s') BETWEEN e.effective_from AND e.effective_to
where a.vp_c_key<>case when b.u_vp is null then 0  ELSE (e.row_key) END)temp;
