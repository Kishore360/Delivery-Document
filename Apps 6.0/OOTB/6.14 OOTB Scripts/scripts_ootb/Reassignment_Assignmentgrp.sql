select D.incident_number as `Incident` 
	-- ,D.source_url as `Incident` 
    ,D.reopened_flag as `Reopened`    
	,D.opened_on as `Opened Date`
    ,D.closed_on as `Closed Date`
	,D.opened_on as `Resolved Date`
	,LS.dimension_name as `Current State`
	, LP.dimension_name `Task Priority (Source)`
	,coalesce(CG.organization_name, case when D.assignment_group_key is NULL then 'UNSPECIFIED' else 'UNKNOWN' end)  as `Current Group`
	, coalesce(ICN.organization_name, case when T.task_attribute_wh_new_value is NULL then 'UNSPECIFIED' else 'UNKNOWN' end) as `New Assignment Group` 
	, coalesce(ICO.organization_name , case when T.task_attribute_wh_old_value is NULL then 'UNSPECIFIED' else 'UNKNOWN' end) as `Old Assignment Group`
    -- , DATE(T.created_on) as `Activity Date`
    , T.created_on as `Activity Date`
    , TA.assignment_cnt as `#  of Reassignments(Group)`
    , ROUND(T.primary_duration/3600 , 2)as `Avg Duration for Assignment Group`
    
	from  #DWH_TABLE_SCHEMA.f_t_task_activity T
	join #DWH_TABLE_SCHEMA.d_incident D
	on (T.task_key= D.row_key
	and T.task_wh_type='incident'
    and T.task_attribute_wh_name ='assignment_group'
    -- and T.primary_sequence_id<>0 
	)
    
    join #DWH_TABLE_SCHEMA.f_incident F
	on (F.incident_key= D.row_key)
    
    left join #DWH_TABLE_SCHEMA.d_internal_organization ICN
    on (ICN.row_id=concat('GROUP~',T.task_attribute_wh_new_value))
	left join #DWH_TABLE_SCHEMA.d_internal_organization ICO
    on (ICO.row_id=concat('GROUP~',T.task_attribute_wh_old_value))
    left join (select D.row_id, 
		sum(case when T.task_attribute_wh_new_value is null or T.task_attribute_wh_old_value is null  then 0 else 1 end) as assignment_cnt	
        from  #DWH_TABLE_SCHEMA.f_t_task_activity T
		join #DWH_TABLE_SCHEMA.d_incident D
		on (T.task_key= D.row_key
		and T.task_wh_type='incident'
		and T.task_attribute_wh_name ='assignment_group'
		and T.primary_sequence_id<>0
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
    
    