SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_project.row_id' ELSE 'SUCCESS' END as Message
FROM (select * from     itpa_l_dev_mdsdb.inv_investments_final  where  cdctype<>'D') SRC 
INNER JOIN(select * from    itpa_l_dev_mdsdb.inv_projects_final where IS_PROGRAM=0 and IS_TEMPLATE = 0 and cdctype<>'D')SRC1
on SRC.ID=SRC1.PRID
LEFT JOIN (select * from  itpa_l_dev_mdwdb.f_project)TRGT   
ON SRC.id =TRGT.row_id 	and SRC.sourceinstance=TRGT.source_id
and TRGT.source_id = SRC.sourceinstance
left join
(select count(*) as weekdaycount,TRGT1.row_id, TRGT1.week_day_count
 from (select * from  itpa_l_dev_mdwdb.f_project)TRGT1
LEFT JOIN (
 select source_id,max(lastupdated) as refresh from   itpa_l_dev_mdwdb.d_o_data_freshness
 group by source_id
 ) df 
  ON (TRGT1.source_id = df.source_id )
inner join(select * from  itpa_l_dev_mdwdb.d_calendar_date)LKP
on LKP.calendar_date between (CASE WHEN DATE_FORMAT(COALESCE(TRGT1.actual_start_on,TRGT1.planned_start_on), '%H-%i-%s') < '17-00-00' THEN 
  CAST(COALESCE(TRGT1.actual_start_on,TRGT1.planned_start_on) AS DATE)
 ELSE 
  CAST(DATE_ADD(COALESCE(TRGT1.actual_start_on,TRGT1.planned_start_on), INTERVAL 1 DAY) AS DATE) 
 END ) and df.refresh
and LKP.week_day_flag = 'Y' AND LKP.calendar_code = 0
group by TRGT1.row_key)SRC10
on TRGT.row_id=SRC10.row_id
WHERE COALESCE(SRC10.weekdaycount,0)<>COALESCE(TRGT.week_day_count,0)