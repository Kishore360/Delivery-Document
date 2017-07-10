SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message 
from wow_mdwdb.d_internal_contact a
JOIN wow_mdsdb.sys_user_final b ON right(a.row_id,32)=b.sys_id AND a.source_id=b.sourceinstance 
LEFT JOIN wow_mdwdb.d_internal_contact e 
ON e.row_id= COALESCE(CONCAT('GROUP~', b.u_primary_group), 'UNSPECIFIED')AND e.source_id=b.sourceinstance
where a.internal_organization_group_key<>case when  b.u_primary_group is null then 0  ELSE (e.row_key) END;


