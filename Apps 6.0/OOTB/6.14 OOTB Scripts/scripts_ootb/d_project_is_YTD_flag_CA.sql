SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_project.is_active_flag' ELSE 'SUCCESS' END as Message
 FROM (select * from  #MDS_TABLE_SCHEMA.inv_investments_final  where odf_object_code='project' and cdctype<>'D') SRC 
 INNER JOIN(select * from  #MDS_TABLE_SCHEMA.inv_projects_final where IS_PROGRAM=0 and IS_TEMPLATE = 0 and cdctype<>'D')SRC1
on SRC.ID=SRC1.PRID
LEFT JOIN (select * from  #DWH_TABLE_SCHEMA.d_project)TRGT   
	ON SRC.id =TRGT.row_id 
	and SRC.sourceinstance=TRGT.source_id  
LEFT JOIN (select source_id , max(lastupdated) refresh_date from   #DWH_TABLE_SCHEMA.d_o_data_freshness group by 1) odf 
ON odf.source_id = TRGT.source_id
LEFT JOIN   #DWH_TABLE_SCHEMA.d_lov_map dlm ON TRGT.project_state_src_key = dlm.src_key AND TRGT.source_id = dlm.source_id 
JOIN ( select year_start_date, year_end_date from   #DWH_TABLE_SCHEMA.d_calendar_date where calendar_date=year_start_date and lagging_count_of_year=0 and calendar_code = 0) cal  
ON
			( (cal.year_start_date BETWEEN TRGT.planned_start_on AND TRGT.planned_end_on) 
					or (cal.year_end_date between TRGT.planned_start_on and TRGT.planned_end_on) 
					or (TRGT.planned_start_on between cal.year_start_date and cal.year_end_date)
					or (cal.year_start_date BETWEEN TRGT.actual_start_on AND TRGT.actual_end_on) 
					or (cal.year_end_date between TRGT.actual_start_on and TRGT.actual_end_on) 
					or (TRGT.actual_start_on between cal.year_start_date and cal.year_end_date) 
					or ( COALESCE(TRGT.actual_end_on, odf.refresh_date) between cal.year_start_date and cal.year_end_date) ) OR dlm.dimension_wh_code IN ('OPEN')
where case when cal.year_start_date BETWEEN TRGT.planned_start_on AND TRGT.planned_end_on then 'Y'
when cal.year_end_date between TRGT.planned_start_on and TRGT.planned_end_on then 'Y'
when TRGT.planned_start_on between cal.year_start_date and cal.year_end_date then 'Y'
when cal.year_start_date BETWEEN TRGT.actual_start_on AND TRGT.actual_end_on then 'Y'
when cal.year_end_date between TRGT.actual_start_on and TRGT.actual_end_on then 'Y'
when TRGT.actual_start_on between cal.year_start_date and cal.year_end_date then 'Y'
when COALESCE(TRGT.actual_end_on, odf.refresh_date) between cal.year_start_date and cal.year_end_date then 'Y'
when dlm.dimension_wh_code IN ('OPEN') then 'Y'
else 'N' end
<> COALESCE(TRGT.is_ytd_flag ,'')