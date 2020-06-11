select D.incident_number as "Incident"
       ,to_char(D.opened_on, 'DD/MM/YYYY HH12:MI:SS') as "Opened Date"
    ,to_char(D.closed_on, 'DD/MM/YYYY HH12:MI:SS') as "Closed Date"
    ,to_char(D.last_resolved_on, 'DD/MM/YYYY HH12:MI:SS') as "Resolved Date"
       ,LS.dimension_name as "Current State"
       , LP.dimension_name as "Task Priority (Source)"
       , ICN.full_name as "New Assignee"
       , ICO.full_name as "Old Assignee"
    , T.created_on as "Activity Date"
    , TA.assignee_cnt as "#  of Handoffs(Assignee)"
    , ROUND(T.primary_duration/3600 , 2)as "Avg Duration for Assignee"    
       from  #DWH_TABLE_SCHEMA.f_t_task_activity T
       left join #DWH_TABLE_SCHEMA.d_incident D
       on (T.task_key= D.row_key
       and T.task_wh_type='incident'
    and T.task_attribute_wh_name ='assigned_to'
    -- and T.primary_sequence_id<>0 
       )
    
    left join #DWH_TABLE_SCHEMA.f_incident F
       on (F.incident_key= D.row_key)
       
       left join #DWH_TABLE_SCHEMA.d_internal_contact ICN
on T.task_attribute_wh_new_value_key= ICN.row_key
left join #DWH_TABLE_SCHEMA.d_internal_contact ICO
on T.task_attribute_wh_old_value_key= ICO.row_key
    
    
    left join (select D.row_id, 
       sum(case when T.task_attribute_wh_new_value is null or T.task_attribute_wh_old_value is null  then 0 else 1 end) as assignee_cnt 
     from  #DWH_TABLE_SCHEMA.f_t_task_activity T
              join #DWH_TABLE_SCHEMA.d_incident D
              on (T.task_key= D.row_key
              and T.task_wh_type='incident'
              and T.task_attribute_wh_name ='assigned_to'
              -- and T.primary_sequence_id<>0
              )
        group by D.row_id
    )TA
    on (TA.row_id=D.row_id)
       left join #DWH_TABLE_SCHEMA.d_lov LS
    on (LS.dimension_class='STATE~INCIDENT'
    and LS.row_key=D.state_src_key)
       left join #DWH_TABLE_SCHEMA.d_lov LP
    on (LP.dimension_class='PRIORITY~TASK'
    and LP.row_key=F.priority_src_key)
       where D.incident_number = 'INC0012203'
       group by d.incident_number,D.opened_on,D.closed_on
       ,D.last_resolved_on,LS.dimension_name,LP.dimension_name,
       ICN.full_name,ICO.full_name , T.created_on,TA.assignee_cnt
       ,T.task_attribute_wh_new_value,T.task_attribute_wh_old_value
       ,T.primary_duration
       
    
    
    
    
