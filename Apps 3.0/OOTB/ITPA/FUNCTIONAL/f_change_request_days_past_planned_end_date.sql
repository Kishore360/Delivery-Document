       
select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.day_past_planned_end_date' ELSE 'SUCCESS' END as Message
 
 FROM <<tenant>>_mdsdb.change_request_final SRC 
 LEFT JOIN  <<tenant>>_mdwdb.f_change_request TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 
 LEFT JOIN  app_test.lsm_ls_source_timezone L 
ON (SRC.sourceinstance   = L.sourceid )  

 left join <<tenant>>_mdwdb.d_lov_map LKP 
on  SRC.state=LKP.dimension_code  
and LKP.dimension_class = 'STATE~CHANGE_REQUEST'
  
 LEFT JOIN 
 (select source_id,max(lastupdated) as lastupdated from  <<tenant>>_mdwdb.d_o_data_freshness
 group by source_id 
 ) df 
  ON TRGT.source_id = df.source_id
  -- AND TRGT.etl_run_number = df.etl_run_number)
 
	where  case when LKP.dimension_wh_code in ('OPEN') 
			then case when TIMESTAMPDIFF(DAY,coalesce(SRC.end_date,0), convert_tz(df.lastupdated, L.source_time_zone, L.target_time_zone)) > 0 
				then TIMESTAMPDIFF(DAY,coalesce(SRC.end_date,0), , convert_tz(df.lastupdated, L.target_time_zone, L.source_time_zone)) 
				else 0 end
		else case when TIMESTAMPDIFF(DAY,coalesce(SRC.end_date,0),coalesce(SRC.work_end,SRC.closed_at,0)) > 0 
				then TIMESTAMPDIFF(DAY,coalesce(SRC.end_date,0), coalesce(SRC.work_end,SRC.closed_at,0))
				else 0 end
		end  <> TRGT.days_past_planned_end_date
		
		
