
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_sid_master_c.sid_c' ELSE 'SUCCESS' END as Message  
FROM 
(
SELECT count(1) as cnt 
FROM  whirlpool_mdsdb.us_sid_master_final  src
left join whirlpool_mdwdb.d_sid_master_c trgt on src.row_id=trgt.row_id and src.sourceinstance=trgt.source_id
where coalesce(src.sid,'UNSPECIFIED')<>trgt.sid_c
) temp; 



	