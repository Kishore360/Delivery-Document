SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0 THEN 'MDS to DWH data validation failed for d_global_palo_alto_fw_c.upgrade_complete_c_key' ELSE 'SUCCESS' END as Message 
 FROM (select count(1) as cnt from 
whirlpool_mdsdb.us_gpafi_consolidated_final src
left join whirlpool_mdwdb.d_global_palo_alto_fw_c trgt
on concat(COALESCE(src.hostname,'UNSPECIFIED'),'~',COALESCE(src.version,'UNSPECIFIED'))=trgt.row_id and src.sourceinstance=trgt.source_id 
join whirlpool_mdwdb.d_lov lkp
on COALESCE( CONCAT('GLOBAL_PALO_ALTO~UPGRADE~~~',src.upgradecomplete),'UNSPECIFIED') =lkp.row_id and src.sourceinstance=lkp.source_id
where coalesce(lkp.row_key,case when src.upgradecomplete is null then 0 else -1 end)<>trgt.upgrade_complete_c_key
)ma;

