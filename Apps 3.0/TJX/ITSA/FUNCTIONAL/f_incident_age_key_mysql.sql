select 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN  CNT >0 THEN 'MDS to DWH data validation failed for f_incident.age_key' ELSE 'SUCCESS' END as Message
FROM (SELECT count(1) as CNT
 FROM (select source_id,max(lastupdated) as lastupdated from tjx_mdwdb.d_o_data_freshness where source_id = 2)    df
INNER JOIN tjx_mdwdb.f_incident a ON a.row_id=a.row_id and  a.source_id = df.source_id
LEFT OUTER JOIN tjx_mdwdb.d_lov x 
ON     
TIMESTAMPDIFF(DAY,a.opened_on_key,CASE WHEN a.last_resolved_on_key > 0 THEN a.last_resolved_on_key
									WHEN a.closed_on_key > 0 THEN a.closed_on_key
									ELSE DATE_FORMAT(df.lastupdated,'%Y%m%d') END) 
BETWEEN x.lower_range_value AND x.upper_range_value 
	
WHERE x.dimension_class = 'AGEBUCKET_WH~INCIDENT' and  coalesce(x.row_key,case when age is null then 0 else -1 end )  <> a.age_key)temp;
