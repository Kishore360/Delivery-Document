
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.age' 
ELSE 'MDS to DWH data validation passed for f_incident.age' END as Message from 
(select count(1) cnt 
FROM schneider_mdsdb.hp_help_desk_final SRC 
JOIN schneider_mdwdb.f_incident TRGT 
ON SRC.incident_number = TRGT.row_id and  SRC.sourceinstance = TRGT.source_id  and TRGT.soft_deleted_flag='N'
JOIN schneider_mdwdb.d_lov_map LKP ON TRGT.state_src_key = LKP.src_key
AND LKP.dimension_wh_code IN ('RESOLVED','CLOSED') and LKP.dimension_class = 'STATE~INCIDENT'
WHERE TIMESTAMPDIFF(SECOND, convert_tz(convert_tz(SRC.reported_date,'GMT','America/Los_Angeles'),'America/Los_Angeles','GMT'), 
coalesce(convert_tz(convert_tz(SRC.last_resolved_date,'GMT','America/Los_Angeles'),'America/Los_Angeles','GMT'), 
convert_tz(convert_tz(SRC.closed_date,'GMT','America/Los_Angeles'),'America/Los_Angeles','GMT'))) <> TRGT.age) a; 