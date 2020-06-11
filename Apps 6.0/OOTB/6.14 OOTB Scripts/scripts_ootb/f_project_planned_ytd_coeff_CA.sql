SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_project.PLANNED_YTD_COEFF' ELSE 'SUCCESS' END as Message
FROM (select * from   #MDS_TABLE_SCHEMA.inv_investments_final  where  cdctype<>'D') SRC 
INNER JOIN(select * from  #MDS_TABLE_SCHEMA.inv_projects_final where IS_PROGRAM=0 and IS_TEMPLATE = 0 and cdctype<>'D')SRC1
on SRC.ID=SRC1.PRID
LEFT JOIN (select * from   #DWH_TABLE_SCHEMA.f_project)TRGT   
ON SRC.id =TRGT.row_id 	and SRC.sourceinstance=TRGT.source_id
inner join(select * from  #DWH_TABLE_SCHEMA.d_calendar_date) CD
on CD.year_start_date between TRGT.planned_start_on and TRGT.planned_end_on
OR CD. year_end_date between TRGT.planned_start_on and TRGT.planned_end_on
OR CD.year_start_date between TRGT.actual_start_on and TRGT.actual_end_on
OR TRGT.planned_start_on between CD.year_start_date and CD.year_end_date
OR CD.year_end_date between TRGT.actual_start_on and TRGT.actual_end_on
OR TRGT.actual_start_on between CD.year_start_date and CD.year_end_date
OR coalesce(TRGT.actual_end_on,'')
and TRGT.source_id=CD.source_id
inner join(select max(lastupdated) as refresh_date,source_id from  #DWH_TABLE_SCHEMA.d_o_data_freshness  group by source_id)refresh 
on refresh.refresh_date between CD.year_start_date and CD.year_end_date
and TRGT.source_id=refresh.source_id
left join(select * from  #DWH_TABLE_SCHEMA.d_lov_map)LKP
on TRGT.project_state_src_key=LKP.src_key
and TRGT.source_id=LKP.source_id
WHERE LKP.dimension_wh_code in ('OPEN') and TRGT.is_ytd_flag='Y'
and case when TRGT.planned_start_on >= CD.year_start_date 
AND TRGT.planned_end_on <= CD.year_end_date THEN 1 
WHEN( TRGT.planned_end_on < CD.year_start_date ) 
OR ( TRGT.planned_start_on > CD.year_end_date) THEN 0  
ELSE ROUND(DATEDIFF(LEAST(CD.year_end_date,TRGT.planned_end_on),
 GREATEST(CD.year_start_date,TRGT.planned_start_on ))/ DATEDIFF(TRGT.planned_end_on,TRGT.planned_start_on),4 ) END <> round(TRGT.PLANNED_YTD_COEFF,4)