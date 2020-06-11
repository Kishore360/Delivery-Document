SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_project.schedule_variance' ELSE 'SUCCESS' END as Message
FROM (select * from   #MDS_TABLE_SCHEMA.inv_investments_final  where  cdctype<>'D') SRC 
INNER JOIN(select * from  #MDS_TABLE_SCHEMA.inv_projects_final where IS_PROGRAM=0 and IS_TEMPLATE = 0 and cdctype<>'D')SRC1
on SRC.ID=SRC1.PRID
LEFT JOIN (select * from   #DWH_TABLE_SCHEMA.f_project)TRGT   
ON SRC.id =TRGT.row_id 	and SRC.sourceinstance=TRGT.source_id
inner join (select * from  #DWH_TABLE_SCHEMA.d_calendar_date) CD
on CD.year_start_date between TRGT.planned_start_on and TRGT.planned_end_on
OR CD. year_end_date between TRGT.planned_start_on and TRGT.planned_end_on
OR CD.year_start_date between TRGT.actual_start_on and TRGT.actual_end_on
OR TRGT.planned_start_on between CD.year_start_date and CD.year_end_date
OR CD.year_end_date between TRGT.actual_start_on and TRGT.actual_end_on
OR TRGT.actual_start_on between CD.year_start_date and CD.year_end_date
and TRGT.source_id=CD.source_id
inner join(select max(lastupdated) as refresh_date,source_id from  #DWH_TABLE_SCHEMA.d_o_data_freshness  group by source_id)refresh 
on refresh.refresh_date between CD.year_start_date and CD.year_end_date
and TRGT.source_id=refresh.source_id
WHERE COALESCE(CD.year_start_date,'')<> DATE_FORMAT((TRGT.current_year_start_date),'%Y-%m-%d')