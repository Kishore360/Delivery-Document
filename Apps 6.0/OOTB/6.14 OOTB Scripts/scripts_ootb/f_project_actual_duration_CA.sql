SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_project.actual_duration' ELSE 'SUCCESS' END as Message
FROM (select * from   #MDS_TABLE_SCHEMA.inv_investments_final  where  cdctype<>'D') SRC 
INNER JOIN(select * from  #MDS_TABLE_SCHEMA.inv_projects_final where IS_PROGRAM=0 and IS_TEMPLATE = 0 and cdctype<>'D')SRC1
on SRC.ID=SRC1.PRID
left join
(select TRGT.row_id,CD.week_day_flag,TRGT.project_state_src_key,LKP.src_key
, TRGT.source_id,CD.calendar_date,TRGT.actual_start_on,REF.refstamp,TRGT.actual_end_on,LKP.dimension_wh_code,TRGT.actual_duration,
DATEDIFF(COALESCE(TRGT.actual_end_on,REF.refstamp),COALESCE(TRGT.actual_start_on)),COALESCE(TRGT.actual_duration,'') as diff
from
(select * from   #DWH_TABLE_SCHEMA.f_project)TRGT
left join(select * from   #DWH_TABLE_SCHEMA.d_lov_map)LKP
on TRGT.project_state_src_key=LKP.src_key
and TRGT.source_id=LKP.source_id
inner join(select max(lastupdated) as refstamp, source_id from   #DWH_TABLE_SCHEMA.d_o_data_freshness group by source_id)REF
on REF.source_id=TRGT.source_id
left join(select * from   #DWH_TABLE_SCHEMA.d_calendar_date where  calendar_code = 0)CD
on CD.calendar_date between TRGT.actual_start_on and REF.refstamp 
OR CD.calendar_date between TRGT.actual_start_on and TRGT.actual_end_on
WHERE LKP.dimension_wh_code not in ('CLOSED') and CD.week_day_flag = 'Y'
group by 1)QA
on SRC.id=QA.row_id
and SRC.sourceinstance=QA.source_id
WHERE QA.week_day_flag='Y' and COALESCE(QA.diff,'')<>COALESCE(QA.actual_duration,'')