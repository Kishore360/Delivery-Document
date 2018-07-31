SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message 
from (select sys_id,sourceinstance,u_change_manager from pdchs_mdsdb.change_request_final where CDCTYPE<>'D') b
left JOIN  pdchs_mdwdb.d_change_request trgt
on b.sys_id = trgt.row_id and b.sourceinstance = trgt.source_id
LEFT JOIN pdchs_mdwdb.d_internal_contact e 
ON e.row_id= COALESCE(concat('INTERNAL_CONTACT~',b.u_change_manager),'UNSPECIFIED')
AND e.source_id=b.sourceinstance
where trgt.change_manager_c_key <> COALESCE(e.row_key,case when b.u_change_manager is null then 0  ELSE -1 END);


