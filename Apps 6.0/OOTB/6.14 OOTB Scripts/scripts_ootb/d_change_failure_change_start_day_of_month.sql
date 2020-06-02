
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.change_start_day_of_month' ELSE 'SUCCESS' END as Message
FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.change_request_final WHERE CDCTYPE<>'D') SRC
left join (SELECT * FROM #DWH_TABLE_SCHEMA.d_change_failure where year(effective_to)=2999) TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 
left outer JOIN #DWH_TABLE_SCHEMA.d_lov_map LM
 on LM.src_key=TRGT.change_state_src_key 

LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date LKP 
on (LKP.row_id  = (Case when LM.dimension_wh_code='OPEN' then date_format(convert_tz(SRC.start_date, '<<TENANT_SSI_TIME_ZONE>>', '<<DW_TARGET_TIME_ZONE>>'),'%Y%m%d') 
when LM.dimension_wh_code='CLOSED' THEN date_format(convert_tz(SRC.work_start, '<<TENANT_SSI_TIME_ZONE>>', '<<DW_TARGET_TIME_ZONE>>'),'%Y%m%d') end) and LKP.source_id=0)
 
WHERE CASE WHEN (LM.dimension_wh_code='CLOSED' and SRC.work_start is null) THEN -1
when (LM.dimension_wh_code='CLOSED' and SRC.work_start is not null) then LKP.day_of_month
when (LM.dimension_wh_code='OPEN' and SRC.start_date is null) then -1
when (LM.dimension_wh_code='OPEN' and SRC.start_date is not null) then LKP.day_of_month
when LM.dimension_wh_code='CANCELED' then -1 else -1 end <> COALESCE(TRGT.change_start_day_of_month,'');