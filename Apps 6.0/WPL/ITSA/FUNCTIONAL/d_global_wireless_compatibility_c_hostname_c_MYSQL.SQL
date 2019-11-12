SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0 THEN 'MDS to DWH data validation failed for d_global_wireless_compatibility_c.hostname_c' ELSE 'SUCCESS' END as Message 
 FROM (select count(1) as cnt from 
wpl_mdsdb.us_gwcm_global_wlc_inventory_final src
left join wpl_mdwdb.d_global_wireless_compatibility_c trgt
on concat(COALESCE(src.hostname,'UNSPECIFIED'),'~',COALESCE(src.version,'UNSPECIFIED'))=trgt.row_id and src.sourceinstance=trgt.source_id 
where src.hostname<>trgt.hostname_c and src.CDCTYPE='X')ma

