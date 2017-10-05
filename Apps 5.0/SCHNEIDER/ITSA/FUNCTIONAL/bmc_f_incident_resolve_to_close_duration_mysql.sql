
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_incident.resolve_to_close_duration' 
ELSE 'MDS to DWH data validation passed for f_incident.resolve_to_close_duration' END as Message from 
(select count(1) cnt 
FROM schneider_mdsdb.hpd_help_desk_final SRC 
JOIN schneider_mdwdb.f_incident TRGT 
ON SRC.entry_id = TRGT.row_id 
and  SRC.sourceinstance = TRGT.source_id   and TRGT.soft_deleted_flag = 'N'
LEFT JOIN schneider_mdwdb.d_lov_map LKP 
 ON TRGT.state_src_key = LKP.src_key
WHERE   LKP.dimension_wh_code IN ('CLOSED') 
AND  TIMESTAMPDIFF(SECOND,convert_tz(convert_tz( SRC.last_resolved_date,'GMT','America/Los_Angeles'),
'America/Los_Angeles','GMT'), 
convert_tz(convert_tz(SRC.closed_date,'GMT','America/Los_Angeles'),'America/Los_Angeles','GMT'))
<> TRGT.resolve_to_close_duration)b