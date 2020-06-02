
-- compare result for historical
select
 curr.source_id  as source_id
,curr.calendar_code  as calendar_code
,curr.assignment_group_key
,curr.row_id  as row_id
,curr.configuration_item_key
,curr.category_src_key
,curr.opened_by_key
,curr.created_on  as changed_on
,curr.changed_on  as changed_on
,curr.created_by
,curr.cdctype  as cdctype
,curr.opened_by_department_key
,curr.incident_key
,curr.state_src_key
,curr.priority_src_key
,curr.soft_deleted_flag
,curr.n_key
,curr.n_date  as n_date
,curr.business_service_key
,curr.assigned_to_key
,curr.reopened_flag  as reopened_flag
,curr.age  as age
,curr.dormancy_age
,curr.age_key
,curr.dormancy_age_key
from  app_test.curr_snap_month curr
where curr.soft_deleted_flag='N'
UNION
select distinct
 hist.source_id 
,hist.calendar_code 
,hist.assignment_group_key
,hist.row_id 
,hist.configuration_item_key
,hist.category_src_key
,hist.opened_by_key
,hist.created_on 
,hist.changed_on 
,hist.created_by
,hist.cdctype 
,hist.opened_by_department_key
,hist.incident_key
,hist.state_src_key
,hist.priority_src_key
,hist.soft_deleted_flag
,hist.n_key
,hist.n_date 
,hist.business_service_key
,hist.assigned_to_key
,hist.reopened_flag 
 ,CASE when lm.dimension_wh_code in ('OPEN') 
			then TIMESTAMPDIFF(SECOND,convert_tz(date_format(hist.opened_on,'%Y-%m-%d'), '<<DW_TARGET_TIME_ZONE>>', '<<TENANT_SSI_TIME_ZONE>>')
            , convert_tz(date_format(hist.n_end_date,'%Y-%m-%d'), '<<DW_TARGET_TIME_ZONE>>', '<<TENANT_SSI_TIME_ZONE>>'))
			ELSE TIMESTAMPDIFF(SECOND,convert_tz(date_format(hist.opened_on,'%Y-%m-%d'), '<<DW_TARGET_TIME_ZONE>>', '<<TENANT_SSI_TIME_ZONE>>')
            , convert_tz(date_format(coalesce(hist.last_resolved_on,hist.closed_on),'%Y-%m-%d'), '<<DW_TARGET_TIME_ZONE>>', '<<TENANT_SSI_TIME_ZONE>>'))
            end  as age
/*,CASE when lm.dimension_wh_code in ('OPEN') 
			then TIMESTAMPDIFF(SECOND,convert_tz(date_format(hist.opened_on,'%Y-%m-%d'), '<<DW_TARGET_TIME_ZONE>>', '<<TENANT_SSI_TIME_ZONE>>')
            , convert_tz(date_format(hist.changed_on,'%Y-%m-%d'), '<<DW_TARGET_TIME_ZONE>>', '<<TENANT_SSI_TIME_ZONE>>'))
			ELSE 0
            end  as dormancy_age */
,dormancy_age        
,(select d.row_key from #DWH_TABLE_SCHEMA.d_lov d
	WHERE (CASE when lm.dimension_wh_code in ('OPEN') 
			then TIMESTAMPDIFF(SECOND,convert_tz(date_format(hist.opened_on,'%Y-%m-%d'), '<<DW_TARGET_TIME_ZONE>>', '<<TENANT_SSI_TIME_ZONE>>')
            , convert_tz(date_format(hist.n_end_date,'%Y-%m-%d'), '<<DW_TARGET_TIME_ZONE>>', '<<TENANT_SSI_TIME_ZONE>>'))
			ELSE TIMESTAMPDIFF(DAY,convert_tz(date_format(hist.opened_on,'%Y-%m-%d'), '<<DW_TARGET_TIME_ZONE>>', '<<TENANT_SSI_TIME_ZONE>>')
            , convert_tz(date_format(coalesce(hist.last_resolved_on,hist.closed_on),'%Y-%m-%d'), '<<DW_TARGET_TIME_ZONE>>', '<<TENANT_SSI_TIME_ZONE>>'))
            end )  
    BETWEEN d.lower_range_value AND d.upper_range_value AND d.dimension_class = 'WH_AGEBUCKET~INCIDENT'  
) as age_key

/*,(select d.row_key from #DWH_TABLE_SCHEMA.d_lov d
	WHERE (CASE when lm.dimension_wh_code in ('OPEN') 
			then TIMESTAMPDIFF(SECOND,convert_tz(date_format(hist.opened_on,'%Y-%m-%d'), '<<DW_TARGET_TIME_ZONE>>', '<<TENANT_SSI_TIME_ZONE>>')
            , convert_tz(date_format(hist.changed_on,'%Y-%m-%d'), '<<DW_TARGET_TIME_ZONE>>', '<<TENANT_SSI_TIME_ZONE>>'))
			ELSE 0
            end)
               BETWEEN d.lower_range_value AND d.upper_range_value AND d.dimension_class = 'WH_DORMANCYBUCKET~INCIDENT'
) as dormancy_age_key*/

,(select d.row_key from #DWH_TABLE_SCHEMA.d_lov d
	WHERE dormancy_age BETWEEN d.lower_range_value AND d.upper_range_value AND d.dimension_class = 'WH_DORMANCYBUCKET~INCIDENT'
) as dormancy_age_key

 
from  app_test.hist_snap_month hist
left join #DWH_TABLE_SCHEMA.d_lov_map lm
on(lm.src_key=hist.state_src_key and lm.dimension_class ='STATE~INCIDENT')
where hist.soft_deleted_flag='N'
ORDER BY row_id,n_key
