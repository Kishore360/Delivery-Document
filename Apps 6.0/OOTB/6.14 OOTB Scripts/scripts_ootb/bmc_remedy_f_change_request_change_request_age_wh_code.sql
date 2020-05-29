-- Raised jira ITSM-5481 & resolved as not a bug--
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
  FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.hlx_chg_infrastructure_change_final WHERE CDCTYPE<>'D') SRC 
 LEFT JOIN   #DWH_TABLE_SCHEMA.f_change_request f
 ON (SRC.infrastructure_change_id=f.row_id 
 AND SRC.sourceinstance=f.source_id )
LEFT JOIN   #DWH_TABLE_SCHEMA.d_lov L  
ON L.row_key=f.change_request_age_key
WHERE coalesce(L.dimension_code,'')<>coalesce(f.change_request_age_wh_code,'')
