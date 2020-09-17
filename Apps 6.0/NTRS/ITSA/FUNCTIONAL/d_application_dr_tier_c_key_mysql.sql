	
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_application.dr_tier_c_key' ELSE 'SUCCESS' END as Message
FROM 
(Select count(1) CNT
FROM ntrust_mdsdb.cmdb_ci_appl_final SRC
left join  ntrust_mdwdb.d_application c on concat('APPLICATION~',ifnull(SRC.sys_id,''))=c.row_id and SRC.sourceinstance=c.source_id
left join ntrust_mdwdb.d_lov lov on COALESCE(CONCAT('DR_TIER_SRC_C~APPLICATION','~',UPPER(SRC.u_dr_tier)),'UNSPECIFIED')=lov.row_id 
where coalesce(lov.row_key,case when SRC.u_dr_tier is null then 0 else -1 end)<>c.dr_tier_c_key and SRC.cdctype<>'D')temp