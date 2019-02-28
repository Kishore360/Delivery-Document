select 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_configuration_item_c.ci_age_c_key' ELSE 'SUCCESS' END as Message 
FROM 
(
Select Count(1) as CNT 
FROM equifax_mdsdb.cmdb_ci_final SRC
LEFT JOIN equifax_mdwdb.f_configuration_item_c TRGT ON SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
LEFT JOIN equifax_mdwdb.d_lov LKP ON ceil(round((TRGT.age_c/(86400.00)))) BETWEEN (LKP.lower_range_value+0.1) AND LKP.upper_range_value
AND LKP.dimension_class='WH_AGEBUCKET~CMDB' 
WHERE COALESCE(LKP.row_key,CASE WHEN TRGT.age_c IS NULL THEN 0 ELSE -1 END)<>TRGT.ci_age_c_key
) temp;
