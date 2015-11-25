 select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.actual_duration' ELSE 'SUCCESS' END as Message
     from rei_mdsdb.change_request_final SRC left join
        rei_mdwdb.f_change_request fi on SRC.sys_id=fi.row_id and SRC.sourceinstance=fi.source_id
      left join rei_mdwdb.d_lov_map lm   ON (lm.src_key = fi.state_src_key) and lm.dimension_wh_code in ('OPEN') 
  where CASE WHEN  SRC.u_qa_deployment_date <  SRC.u_work_start_date THEN NULL 
WHEN TIMESTAMPDIFF(SECOND,SRC.u_work_start_date, SRC.u_qa_deployment_date) > 214748364 THEN NULL 
WHEN lm.dimension_wh_code='OPEN' THEN 0
ELSE TIMESTAMPDIFF(SECOND,SRC.u_work_start_date, SRC.u_qa_deployment_date
) end <> fi.actual_duration