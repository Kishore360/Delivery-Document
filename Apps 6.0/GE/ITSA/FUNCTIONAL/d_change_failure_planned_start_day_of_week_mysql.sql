
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.planned_start_day_of_week' ELSE 'SUCCESS' END as Message
FROM ( SELECT * FROM ge_mdsdb.change_request_final WHERE CDCTYPE<>'D') SRC
left join (SELECT * FROM ge_mdwdb.d_change_failure where year(effective_to)=2999) TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 
left outer JOIN ge_mdwdb.d_lov_map LM
 on LM.src_key=TRGT.change_state_src_key 

LEFT JOIN ge_mdwdb.d_calendar_date LKP 
on (LKP.row_id  = (Case when LM.dimension_wh_code='OPEN' then date_format(convert_tz(SRC.start_date, '<<TENANT_SSI_TIME_ZONE>>', '<<DW_TARGET_TIME_ZONE>>'),'%Y%m%d') 
when LM.dimension_wh_code='CLOSED' THEN date_format(convert_tz(SRC.work_start, '<<TENANT_SSI_TIME_ZONE>>', '<<DW_TARGET_TIME_ZONE>>'),'%Y%m%d') end) and LKP.source_id=0)
 
WHERE CASE WHEN (LM.dimension_wh_code='CLOSED' and SRC.work_start is null) THEN 'UNSPECIFIED'
when (LM.dimension_wh_code='CLOSED' and SRC.work_start is not null) then LKP.day_name
when (LM.dimension_wh_code='OPEN' and SRC.start_date is null) then 'UNSPECIFIED'
when (LM.dimension_wh_code='OPEN' and SRC.start_date is not null) then LKP.day_name
when LM.dimension_wh_code='CANCELED' then 'UNSPECIFIED' else 'UNSPECIFIED' end <> COALESCE(TRGT.planned_start_day_of_week,'');