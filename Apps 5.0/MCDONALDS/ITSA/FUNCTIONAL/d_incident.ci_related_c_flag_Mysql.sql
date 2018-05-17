
SELECT 
CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as RESULT,
CASE WHEN cnt > 0 THEN 'MDS to DWH data validation failed for d_incident.ci_related_c_flag' ELSE 'SUCCESS' END as MESSAGE
FROM 
(
SELECT count(1) as cnt
FROM ( SELECT * FROM mcdonalds_mdsdb.incident_final where  CDCTYPE<>'D') a 
LEFT JOIN mcdonalds_mdwdb.d_incident b ON a.sys_id=b.row_id and a.sourceinstance=b.source_id
left join (select source_id,max(lastupdated) as lastupdated from mcdonalds_mdwdb.d_o_data_freshness group by source_id) f1 on (f1.source_id = SRC.sourceinstance)
where (SRC.cdctime<=f1.lastupdated) and CASE WHEN a.cmdb_ci is NULL THEN 'N' ELSE 'Y' END <>b.ci_related_c_flag
)a 