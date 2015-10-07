SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message 
from cardinalhealth_mdwdb.d_internal_contact a
JOIN cardinalhealth_mdsdb.sys_user_final b ON right(a.row_id,32)=b.sys_id AND a.source_id=b.sourceinstance 
LEFT JOIN cardinalhealth_mdwdb.d_internal_contact e 
ON e.row_id= COALESCE(concat('INTERNAL_CONTACT~',b.manager),'UNSPECIFIED')AND e.source_id=b.sourceinstance
where a.manager_c_key<> case when b.manager is null then 0  ELSE (e.row_key) END;