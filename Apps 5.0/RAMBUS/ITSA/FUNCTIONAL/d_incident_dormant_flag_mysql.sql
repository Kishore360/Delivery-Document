
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for d_incident.dormancy_flag' ELSE 'SUCCESS' END as Message
FROM (SELECT count(1) as CNT
FROM rambus_mdwdb.d_incident di
JOIN rambus_mdwdb.f_incident fi ON di.row_key = fi.incident_key
JOIN rambus_mdwdb.d_lov_map d_lov_map ON fi.state_src_key = d_lov_map.src_key
where d_lov_map.dimension_class = 'STATE~INCIDENT' 
AND d_lov_map.dimension_wh_code = 'OPEN'
AND fi.soft_deleted_flag='Y'
 AND (CASE WHEN timestampdiff(second,di.changed_on, (SELECT MAX(lastupdated) AS lastupdated
FROM rambus_mdwdb.d_o_data_freshness WHERE sourcename like 'ServiceNow%'))>86400 THEN 'Y' ELSE 'N' END) <> di.dormant_flag)temp;



