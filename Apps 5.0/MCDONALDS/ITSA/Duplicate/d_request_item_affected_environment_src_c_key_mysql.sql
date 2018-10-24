SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_request_item.affected_environment_src_c_key' ELSE 'SUCCESS' END as Message 
FROM mcdonalds_mdwdb.d_request_item trgt
RIGHT JOIN (select * from mcdonalds_mdsdb.sc_req_item_final where cdctype<>'D') src
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id
LEFT JOIN mcdonalds_mdwdb.d_lov lkp
ON COALESCE(CONCAT('AFFECTED_ENVIRONMENT_C~REQUEST_ITEM~~~',u_affected_environment),'UNSPECIFIED') =lkp.row_id and src.sourceinstance = lkp.source_id
left join (select source_id,max(lastupdated) as lastupdated from mcdonalds_mdwdb.d_o_data_freshness group by source_id) f1 on (f1.source_id = src.sourceinstance)
where (src.cdctime<=f1.lastupdated) and COALESCE(lkp.row_key,CASE WHEN src.u_affected_environment IS NULL THEN 0 else -1 end)<> trgt.affected_environment_src_c_key
;