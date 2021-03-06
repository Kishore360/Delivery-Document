

select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident_asc_c.due_on_key' ELSE 'SUCCESS' END as Message
 FROM nbcu_mdsdb.sc_req_item_final src
left join  nbcu_mdwdb.d_calendar_date lkp on
  date_format(convert_tz(coalesce(src.u_fulfilled_at,src.closed_at),'GMT','America/New_York'),'%Y%m%d')=lkp.row_id --  and lkp.source_id=src.sourceinstance
left join nbcu_mdwdb.f_request_item f 
on  f.row_id=src.sys_id and f.source_id=src.sourceinstance
where coalesce(lkp.row_key,case when date_format(convert_tz(coalesce(src.u_fulfilled_at,src.closed_at),'GMT','America/New_York'),'%Y%m%d') is null then 0 else -1 end )
<>f.fulfilled_on_c_key;