
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_incident.age' 
ELSE 'MDS to DWH data validation passed for f_incident.age' END as Message from 
(select count(1) cnt 
FROM schneider_mdsdb.hpd_help_desk_final SRC 
JOIN schneider_mdwdb.f_incident TRGT 
ON SRC.entry_id = TRGT.row_id and  SRC.sourceinstance = TRGT.source_id  and TRGT.soft_deleted_flag='N'
join schneider_mdwdb.d_incident TRGT1
on TRGT1.row_key = TRGT.incident_key
AND TRGT.source_id = TRGT1.source_id
JOIN schneider_mdwdb.d_lov_map LKP ON TRGT.state_src_key = LKP.src_key
AND LKP.dimension_wh_code IN ('OPEN') and LKP.dimension_class = 'STATE~INCIDENT'
JOIN (
select source_id,max(lastupdated) as lastupdated from  schneider_mdwdb.d_o_data_freshness
group by source_id
) df ON TRGT.source_id = df.source_id
WHERE TIMESTAMPDIFF(SECOND, convert_tz(TRGT1.opened_on,'GMT','America/Los_Angeles') , CONVERT_TZ(lastupdated, 'GMT','America/Los_Angeles')  <> TRGT.age))a; 