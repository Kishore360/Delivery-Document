select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for primary_duration' ELSE 'SUCCESS' END as Message
from <<tenant>>_mdwdb.f_incident_activity FP
join <<tenant>>_mdwdb.f_incident_activity FN
on(FP.task_key=FN.task_key
and FP.task_attribute_wh_name=FN.task_attribute_wh_name
and FN.task_attribute_wh_name = 'state'
and FP.primary_sequence_id + 1=FN.primary_sequence_id)
join d_o_data_freshness O
on(O.source_id=FN.source_id)
join f_incident F
on(F.incident_key=FN.task_key)
 join d_incident D
 on(F.incident_key=D.row_key)
left join d_lov_map DLM
on(DLM.src_key=FP.state_key
and DLM.dimension_class='STATE~INCIDENT')
where coalesce(FP.primary_duration,0)<>
case when coalesce(timestampdiff(SECOND,FP.created_on
                ,CASE WHEN DLM.dimension_wh_code ='CLOSED' 
                THEN coalesce(D.closed_on,D.last_resolved_on) 
                ELSE coalesce(FN.created_on,O.lastupdated )
                END ),0)<0 
then 0 
else coalesce(timestampdiff(SECOND,FP.created_on
                ,CASE WHEN DLM.dimension_wh_code ='CLOSED' 
                THEN coalesce(D.closed_on,D.last_resolved_on) 
                ELSE coalesce(FN.created_on,O.lastupdated )
                END ),0) end

