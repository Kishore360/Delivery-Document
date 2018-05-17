 select CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_incident.age' ELSE 'SUCCESS' END as Message from (select count(1) cnt 
 FROM (select sys_id,sourceinstance,opened_at from ( SELECT * FROM mcdonalds_mdsdb.incident_final WHERE CDCTYPE<>'D') where opened_at < coalesce(resolved_at,closed_at)) SRC 
  join mcdonalds_mdwdb.f_incident f ON (SRC.sys_id =f.row_id  
 AND SRC.sourceinstance= f.source_id and f.soft_deleted_flag='N' )

JOIN mcdonalds_mdwdb.d_lov_map br ON f.state_src_key = br.src_key
AND br.dimension_wh_code = 'OPEN' and br.dimension_class = 'STATE~INCIDENT'

WHERE TIMESTAMPDIFF(SECOND,SRC.opened_at,(SELECT CONVERT_TZ(max(lastupdated),'US/Central','GMT') AS lastupdated FROM mcdonalds_mdwdb.d_o_data_freshness WHERE sourcename like 'ServiceNow%' and etl_run_number=f.etl_run_number))<> f.age

 )A