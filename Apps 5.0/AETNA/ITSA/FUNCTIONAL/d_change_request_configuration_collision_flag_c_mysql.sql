SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_change_request.configuration_collision_flag_c' ELSE 'SUCCESS' END as Message 
FROM
(select sys_id, sourceinstance, number from aetna_mdsdb.change_request_final where CDCTYPE<>'D') src
left join aetna_mdwdb.d_change_request trgt on 
src.sys_id=trgt.row_id and src.sourceinstance=trgt.source_id 
left join
(SELECT row_id,group_concat(distinct coll_num) as num FROM  aetna_mdwdb.tmp_mdw_collision_group_by_config 
        group by row_id) lkp on trgt.row_id=lkp.row_id
where  case when lkp.num is null then 'N' else 'Y' end <> trgt.configuration_collision_flag_c;