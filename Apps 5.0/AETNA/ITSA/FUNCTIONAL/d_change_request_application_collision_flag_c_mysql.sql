SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_change_request.application_collision_flag_c' ELSE 'SUCCESS' END as Message 
FROM
(select sys_id, sourceinstance, number from aetna_mdsdb.change_request_final where CDCTYPE<>'D') src
left join aetna_mdwdb.d_change_request trgt on 
src.sys_id=trgt.row_id and src.sourceinstance=trgt.source_id 
 left join
aetna_mdwdb.tmp_mdw_application_collision_final_flag_c lkp on trgt.row_id=lkp.row_id and trgt.source_id=lkp.source_id
where coalesce(lkp.flag, case when lkp.row_id is null then 'N' else 'Y' end )<>trgt.application_collision_flag_c;
