 CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message 
 from (select count(1) from whirlpool_mdwdb.f_incident a
LEFT OUTER JOIN whirlpool_mdwdb.d_lov x 
ON (a.open_to_resolve_duration/(3600*24)) BETWEEN x.lower_range_value AND x.upper_range_value
WHERE (a.mttr_c_key <> x.row_key
       OR a.mttr_c_key IS NULL) AND (x.dimension_class = 'MTTRBUCKET_WH~INCIDENT' OR x.row_key in (0,-1)))ma; 
      