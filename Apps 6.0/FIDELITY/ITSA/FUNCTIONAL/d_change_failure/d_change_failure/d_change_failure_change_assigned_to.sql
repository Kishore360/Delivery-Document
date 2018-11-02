select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_failure.change_assigned_to' ELSE 'SUCCESS' END as Message
from (SELECT * FROM fidelity_mdsdb.change_request_final WHERE CDCTYPE<>'D') SRC
left join (SELECT * FROM fidelity_mdwdb.d_change_failure where year(effective_to)=2999 
) TRGT 
 ON SRC.sys_id =TRGT.row_id 
 AND SRC.sourceinstance = TRGT.source_id  
 left join ( SELECT * FROM fidelity_mdwdb.d_internal_contact WHERE CDCTYPE<>'D') USR
on USR.row_id = concat('INTERNAL_CONTACT~',SRC.assigned_to) 
and SRC.sourceinstance = USR.source_id
where coalesce(full_name,'UNSPECIFIED') <> coalesce(TRGT.change_assigned_to,'')