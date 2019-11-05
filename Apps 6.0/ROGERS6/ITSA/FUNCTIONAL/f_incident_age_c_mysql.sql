 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_incident.age_c' ELSE 'SUCCESS' END as Message from (
 select count(1) as cnt 
  FROM rogers6_mdwdb.d_incident di
 JOIN rogers6_mdwdb.f_incident fi ON di.row_key = fi.incident_key AND fi.source_id=di.source_id
  JOIN rogers6_mdwdb.d_lov_map dlm ON fi.state_src_key = dlm.src_key  	
  where dlm.dimension_class = 'STATE~INCIDENT'
  AND  ( timestampdiff(second,di.created_on, (SELECT MAX(lastupdated) AS lastupdated
FROM rogers6_mdwdb.d_o_data_freshness WHERE sourcename like 'ServiceNow%'))) <> fi.age_c)a; 