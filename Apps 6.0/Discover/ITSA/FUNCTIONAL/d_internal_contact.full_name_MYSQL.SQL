SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_internal_contact.full_name' ELSE 'SUCCESS' END as Message 
from discover_mdsdb.sys_user_final a
left join discover_mdwdb.d_internal_contact b
on b.row_id=CONCAT('INTERNAL_CONTACT~',a.sys_id) and b.source_id=a.sourceinstance
where b.full_name<>COALESCE(a.name,'UNSPECIFIED') and a.cdctype='X';