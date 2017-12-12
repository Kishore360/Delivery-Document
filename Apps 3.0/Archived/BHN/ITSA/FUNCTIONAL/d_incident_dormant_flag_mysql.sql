 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_incident.dormant_flag' ELSE 'SUCCESS' END as Message from (
 select count(1) as cnt 
  FROM 
bhn_mdwdb.d_incident di
  JOIN bhn_mdwdb.f_incident fi ON di.row_key = fi.incident_key
  JOIN bhn_mdwdb.d_lov_map dlm ON fi.state_src_key = dlm.src_key  							
  where dlm.dimension_class = 'STATE~INCIDENT'
  AND dlm.dimension_wh_code = 'OPEN'
  AND  (CASE WHEN timestampdiff(DAY,di.changed_on, (SELECT MAX(lastupdated) AS lastupdated
FROM bhn_mdwdb.d_o_data_freshness WHERE sourcename like 'ServiceNow%'))>=14 THEN 'Y' ELSE 'N' END) <> di.dormant_flag)a;
  
