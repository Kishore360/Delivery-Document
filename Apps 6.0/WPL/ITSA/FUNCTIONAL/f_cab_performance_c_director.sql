SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_cab_performance_c.director' ELSE 'SUCCESS' END as Message  
FROM 
(
SELECT count(1) as cnt 
FROM  wpl_mdsdb.us_CPDFN_sheet1_final  src
left join wpl_mdwdb.f_cab_performance_c trgt on  concat(coalesce(src.changenumber,'unspecified'),'~',coalesce(src.rflag,'unspecified'),'~',coalesce(src.director,'unspecified'),'~',coalesce(src.cabdate,'unspecified')) =trgt.row_id and src.sourceinstance=trgt.source_id
where src.cdctype<>'D' and   src.director <> trgt.director
) temp; 
