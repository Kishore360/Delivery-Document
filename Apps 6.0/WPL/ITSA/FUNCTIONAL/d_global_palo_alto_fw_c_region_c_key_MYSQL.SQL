SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0 THEN 'MDS to DWH data validation failed for d_global_palo_alto_fw_c.region_c_key' ELSE 'SUCCESS' END as Message 
 FROM (select count(1) as cnt from 
wpl_mdsdb.us_gpafi_consolidated_final src
left join wpl_mdwdb.d_global_palo_alto_fw_c trgt
on concat(COALESCE(src.hostname,'UNSPECIFIED'),'~',COALESCE(src.version,'UNSPECIFIED'))=trgt.row_id and src.sourceinstance=trgt.source_id 
join wpl_mdwdb.d_lov lkp
on COALESCE( CONCAT('REGION~GLOBAL_PALO_ALTO~',src.region),'UNSPECIFIED')=lkp.row_id and src.sourceinstance=lkp.source_id
where src.cdctype='X' and coalesce(lkp.row_key,case when src.region is null then 0 else -1 end)<>trgt.region_c_key
)ma;

