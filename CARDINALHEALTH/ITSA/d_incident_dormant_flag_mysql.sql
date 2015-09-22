SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.dormancy_age' ELSE 'SUCCESS' END as Message
  FROM cardinalhealth_mdwdb.d_incident di
  JOIN cardinalhealth_mdwdb.f_incident fi ON di.row_key = fi.incident_key
  JOIN cardinalhealth_mdwdb.d_lov_map dlm ON fi.state_src_key = dlm.src_key
  JOIN (
 SELECT lastupdated,source_id
FROM cardinalhealth_mdwdb.d_o_data_freshness
WHERE etl_run_number in (select max(etl_run_number) from cardinalhealth_mdwdb.d_o_data_freshness)
 ) df ON di.source_id = df.source_id
  where dlm.dimension_class = 'STATE~INCIDENT'
  AND dlm.dimension_wh_code = 'OPEN'
  AND (CASE WHEN timestampdiff(DAY,di.changed_on, df.lastupdated)>30 THEN 'Y' ELSE 'N' END) <> di.dormant_flag;
