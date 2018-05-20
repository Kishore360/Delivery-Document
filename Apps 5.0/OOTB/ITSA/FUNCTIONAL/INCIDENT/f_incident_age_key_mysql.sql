
 select CASE WHEN cnt THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt THEN 'MDS to DWH data validation failed for f_incident.age_key' ELSE 'SUCCESS' END as Message from (select count(1) cnt 
FROM (select * from <<tenant>>_mdsdb.incident_final where cdctype<>'D') SRC 
join <<tenant>>_mdwdb.f_incident f  on sys_id=row_id and sourceinstance=source_id
LEFT JOIN <<tenant>>_mdwdb.d_lov L  
ON ((f.age div 86400.0 BETWEEN L.lower_range_value AND L.upper_range_value)
	AND L.dimension_class = 'AGEBUCKET_WH~INCIDENT' )
	left join (select source_id,max(lastupdated) as lastupdated from <<tenant>>_mdwdb.d_o_data_freshness group by source_id) f1 on (f1.source_id = kb.sourceinstance)
where (SRC.cdctime<=f1.lastupdated) and coalesce(L.row_key, case when age is null then 0 else -1 end  )  <> f.age_key)b
