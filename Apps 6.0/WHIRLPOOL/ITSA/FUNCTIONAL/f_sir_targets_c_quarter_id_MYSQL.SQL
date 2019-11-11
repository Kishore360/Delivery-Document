
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_sir_targets_c.quarter_id' ELSE 'SUCCESS' END as Message  
FROM 
(
SELECT count(1) as cnt 
FROM  whirlpool_mdsdb.us_MATFN_SIRTargets_final  src
left join whirlpool_mdwdb.f_sir_targets_c trgt on concat(src.leader,outagecausedbychangetarget)=trgt.row_id and src.sourceinstance=trgt.source_id
where src.quarterid<>trgt.quarter_id and src.cdctype='X'
) temp; 



	