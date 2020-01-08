SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0 THEN 'MDS to DWH data validation failed for d_global_wireless_compatibility_c.wlc_model_c_key' ELSE 'SUCCESS' END as Message 
 FROM (select count(1) as cnt from 
wpl_mdsdb.us_gwcm_global_wlc_inventory_final src
left join wpl_mdwdb.d_global_wireless_compatibility_c trgt
on concat(COALESCE(src.hostname,'UNSPECIFIED'),'~',COALESCE(src.version,'UNSPECIFIED'))=trgt.row_id and src.sourceinstance=trgt.source_id
join wpl_mdwdb.d_lov lkp on COALESCE( CONCAT('WLC_MODEL~GLOBAL_WLC~',src.wlcmodel),'UNSPECIFIED') =lkp.row_id and src.sourceinstance=lkp.source_id
where src.cdctype<>'D' and coalesce(lkp.row_key,case when src.wlcmodel is null then 0 else -1 end)<>trgt.wlc_model_c_key)ma
;
