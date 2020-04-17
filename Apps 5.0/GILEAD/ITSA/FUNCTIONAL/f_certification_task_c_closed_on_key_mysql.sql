SELECT CASE WHEN CNT >0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_certification_task_c.closed_on_key' ELSE 'SUCCESS' END as Message 
FROM (
select count(1) as CNT from gilead_mdsdb.cert_task_final SRC
LEFT JOIN  gilead_mdwdb.f_certification_task_c trgt
on SRC.sys_id = trgt.row_id and SRC.sourceinstance = trgt.source_id
left join gilead_mdwdb.d_lov_map map on map.src_key=trgt.state_src_key
LEFT JOIN gilead_mdwdb.d_calendar_date LKP 
on (LKP.row_id = COALESCE(date_format(convert_tz(SRC.closed_at,'GMT','America/New_York'),'%Y%m%d'), 'UNSPECIFIED') and LKP.source_id=0
) WHERE case when map.dimension_wh_code<>'CLOSED' then 0 else LKP.row_key end <> (trgt.closed_on_key) and SRC.cdctype='X'
)t 

;