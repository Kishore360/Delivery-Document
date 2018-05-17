
 select CASE WHEN cnt THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt THEN 'MDS to DWH data validation failed for f_incident.age_key' ELSE 'SUCCESS' END as Message from (select count(1) cnt 
from ( SELECT * FROM mcdonalds_mdsdb.incident_final where CDCTYPE<>'D' and  opened_at < coalesce(resolved_at,closed_at)) SRC 
join mcdonalds_mdwdb.f_incident f  ON sys_id=row_id and sourceinstance=source_id
LEFT JOIN mcdonalds_mdwdb.d_lov L  
ON ((f.age div 86400 BETWEEN L.lower_range_value AND L.upper_range_value)
	AND L.dimension_class = 'AGEBUCKET_WH~INCIDENT' )
	 left join (select source_id,max(lastupdated) as lastupdated from mcdonalds_mdwdb.d_o_data_freshness group by source_id) f1 on (f1.source_id = SRC.sourceinstance)
where (SRC.cdctime<=f1.lastupdated) and (L.row_key )  <> f.age_key)b
