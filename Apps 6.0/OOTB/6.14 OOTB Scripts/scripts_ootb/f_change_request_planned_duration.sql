
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.planned_duration' ELSE 'SUCCESS' END as Message
 FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.change_request_final WHERE CDCTYPE<>'D') SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_change_request TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 
  
 left join #DWH_TABLE_SCHEMA.d_lov_map LKP 
on  SRC.state=LKP.dimension_code  
and LKP.dimension_class = 'STATE~CHANGE_REQUEST'

 WHERE 
 
 case when LKP.dimension_wh_code in ('CANCELED') then '' 
when SRC.start_date>SRC.end_date or TIMESTAMPDIFF(SECOND, SRC.start_date, SRC.end_date) >'214748364'
 then '' else
 COALESCE( TIMESTAMPDIFF(SECOND, SRC.start_date, SRC.end_date) ,'')end <> COALESCE(TRGT.planned_duration ,'')
