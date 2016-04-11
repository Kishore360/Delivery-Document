/*This query will pass only in APPS 3.0 version since this was fixed as part of defect 1984 APPS JIRA*/
 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.closed_by_key' ELSE 'SUCCESS' END as Message
  FROM 
(select * from molinahealth_mdsdb.change_request_final where opened_at < closed_at) SRC 
  join molinahealth_mdwdb.f_change_request f ON (SRC.sys_id =f.row_id  
 AND SRC.sourceinstance= f.source_id and f.soft_deleted_flag='N' )

JOIN molinahealth_mdwdb.d_lov_map br ON f.state_src_key = br.src_key
AND br.dimension_wh_code = 'OPEN' and br.dimension_class = 'STATE~CHANGE_REQUEST'
JOIN molinahealth_mdwdb.d_change_request a ON a.row_key = f.change_request_key
AND f.source_id = a.source_id 

WHERE TIMESTAMPDIFF(DAY,SRC.opened_at,(SELECT CONVERT_TZ(MAX(lastupdated),<<DW_TARGET_TIME_ZONE>>,<<TENANT_SSI_TIME_ZONE>>) AS lastupdated

FROM molinahealth_mdwdb.d_o_data_freshness WHERE sourcename like 'ServiceNow%'))<> f.change_request_age

 