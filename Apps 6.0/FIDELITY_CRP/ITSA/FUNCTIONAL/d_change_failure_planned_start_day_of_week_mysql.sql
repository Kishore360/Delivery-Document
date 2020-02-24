
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.planned_start_day_of_week' ELSE 'SUCCESS' END as Message
FROM ( SELECT sys_id,sourceinstance,work_start,start_date FROM fidelity_mdsdb.change_request_final WHERE CDCTYPE<>'D'  and coalesce(work_start,start_date,closed_at)>'2019-01-01'
                and u_environment='Production' ) SRC
left join (SELECT row_id,source_id,change_state_src_key,planned_start_day_of_week FROM fidelity_mdwdb.d_change_failure where year(effective_to)=2999) TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 
left outer JOIN fidelity_mdwdb.d_lov_map LM
 on LM.src_key=TRGT.change_state_src_key 

LEFT JOIN fidelity_mdwdb.d_calendar_date LKP 
on (LKP.row_id  = (Case when LM.dimension_wh_code='OPEN' then date_format(convert_tz(SRC.start_date, 'GMT','America/New_York'),'%Y%m%d') 
when LM.dimension_wh_code='CLOSED' THEN date_format(convert_tz(SRC.work_start, 'GMT','America/New_York'),'%Y%m%d') end) and LKP.source_id=0)
 
WHERE CASE WHEN (LM.dimension_wh_code='CLOSED' and SRC.work_start is null) THEN 'UNSPECIFIED'
when (LM.dimension_wh_code='CLOSED' and SRC.work_start is not null) then LKP.day_name
when (LM.dimension_wh_code='OPEN' and SRC.start_date is null) then 'UNSPECIFIED'
when (LM.dimension_wh_code='OPEN' and SRC.start_date is not null) then LKP.day_name
when LM.dimension_wh_code='CANCELED' then 'UNSPECIFIED' else 'UNSPECIFIED' end <> COALESCE(TRGT.planned_start_day_of_week,'');