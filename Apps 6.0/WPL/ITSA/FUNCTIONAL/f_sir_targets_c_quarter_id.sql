SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_sir_targets_c.quarter_key' ELSE 'SUCCESS' END as Message  
FROM 
(
SELECT count(1) as cnt 
FROM  wpl_mdsdb.us_MATFN_SIRTargets_final  src
left join wpl_mdwdb.f_sir_targets_c trgt on concat(COALESCE(src.leader, 'UNSPECIFIED'),'~',COALESCE(src.quarterid,'UNSPECIFIED')) =trgt.row_id and src.sourceinstance=trgt.source_id
where src.cdctype<>'D' and   src.quarterid <> trgt.quarter_id
) temp; 
