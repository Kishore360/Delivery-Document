
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_failure.conflict_status_src_key' ELSE 'SUCCESS' END as Message
from (SELECT sys_id,sourceinstance,conflict_status FROM fidelity_mdsdb.change_request_final WHERE CDCTYPE<>'D'
  and coalesce(work_start,start_date,closed_at)>'2019-01-01'
                and u_environment='Production' ) SRC
left join (SELECT row_id,source_id,conflict_status_src_key FROM fidelity_mdwdb.d_change_failure where year(effective_to)=2999) TRGT 
ON (SRC.sys_id =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
 LEFT JOIN fidelity_mdwdb.d_lov LKP 
 ON ( CONCAT('CONFLICT_STATUS~CHANGE_REQUEST','~',UPPER(SRC.conflict_status)) = LKP.src_rowid 
 
AND SRC.sourceinstance = LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.conflict_status IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.conflict_status_src_key,'')
