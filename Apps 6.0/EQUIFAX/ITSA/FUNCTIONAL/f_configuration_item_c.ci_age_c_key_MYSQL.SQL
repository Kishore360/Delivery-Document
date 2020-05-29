select 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_configuration_item_c.ci_age_c_key' ELSE 'SUCCESS' END as Message 
FROM 
(
Select Count(1) as CNT 
FROM equifax_mdsdb.cmdb_ci_final SRC
LEFT JOIN equifax_mdwdb.f_configuration_item_c TRGT ON SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
LEFT OUTER JOIN equifax_mdwdb.d_lov x ON floor((TRGT.age_c/(86400.0*365)))+0.1 BETWEEN x.lower_range_value AND x.upper_range_value AND (x.dimension_class = 'WH_AGEBUCKET~CMDB')
WHERE TRGT.ci_age_c_key<>coalesce(x.row_key, -1) and SRC.cdctype<>'D'
) temp;
