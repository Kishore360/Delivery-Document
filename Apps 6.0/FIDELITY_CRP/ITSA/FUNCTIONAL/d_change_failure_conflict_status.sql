
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_failure.conflict_status' ELSE 'SUCCESS' END as Message
from (SELECT sys_id,sourceinstance,conflict_status FROM fidelity_mdsdb.change_request_final WHERE CDCTYPE<>'D') SRC
left join (SELECT row_id,source_id,conflict_status FROM fidelity_mdwdb.d_change_failure where year(effective_to)=2999) TRGT 
ON (SRC.sys_id =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
WHERE COALESCE(SRC.conflict_status,'UNSPECIFIED') <> COALESCE(TRGT.conflict_status,'')
