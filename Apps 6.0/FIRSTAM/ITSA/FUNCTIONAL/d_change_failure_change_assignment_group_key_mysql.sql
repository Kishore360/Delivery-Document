SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_failure.change_assignment_group_key' ELSE 'SUCCESS' END as Message
from (SELECT * FROM firstam_mdsdb.change_request_final WHERE CDCTYPE<>'D') SRC
left join (SELECT * FROM firstam_mdwdb.d_change_failure where year(effective_to)=2999 
) TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 LEFT JOIN firstam_mdwdb.d_internal_organization LKP 
 ON ( CONCAT('GROUP~', SRC.assignment_group) = LKP.row_id 
 
AND SRC.sourceinstance = LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.assignment_group IS NULL THEN 0 else '-1' end)<> TRGT.change_assignment_group_key
