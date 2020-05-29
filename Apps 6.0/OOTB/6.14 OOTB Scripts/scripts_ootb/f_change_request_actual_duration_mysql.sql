select 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_change_request.actual_duration' ELSE 'SUCCESS' END as Message
 FROM (SELECT count(1) as CNT
     from #MDS_TABLE_SCHEMA.change_request_final SRC left join
        #DWH_TABLE_SCHEMA.f_change_request fi on SRC.sys_id=fi.row_id and SRC.sourceinstance=fi.source_id
		    left join #DWH_TABLE_SCHEMA.d_lov_map lm 
		ON (lm.src_key = fi.state_src_key) and lm.dimension_wh_code in ('OPEN') 
     
	where case when lm.dimension_wh_code in ('OPEN') 
				then 0
                else  COALESCE(CASE WHEN  SRC.WORK_END <  SRC.WORK_START THEN NULL 
                                -- WHEN TIMESTAMPDIFF(SECOND,SRC.WORK_START, SRC.WORK_END) > 214748364 THEN NULL 
								ELSE TIMESTAMPDIFF(SECOND,SRC.WORK_START, SRC.WORK_END) end ,0)
            end  <> fi.actual_duration) temp;