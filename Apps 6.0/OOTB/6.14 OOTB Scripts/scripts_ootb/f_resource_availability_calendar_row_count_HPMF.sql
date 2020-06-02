select (if(count(concat(SRC.USER_ID,'~',COALESCE(DATE_FORMAT(CONVERT_TZ(SRC3.WORKING_DAY_DATE,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),
'%Y%m%d'),'UNSPECIFIED') )) = count(TRGT.row_id),'Success','FAILURE'))
from  #MDS_TABLE_SCHEMA.hp_knta_users_final  SRC
left join #MDS_TABLE_SCHEMA.hp_kdrv_calendars_final SRC2
on SRC.CALENDAR_ID = SRC2.CALENDAR_ID 
and SRC.sourceinstance = SRC2.sourceinstance
left join #MDS_TABLE_SCHEMA.hp_kdrv_working_days_final SRC3
on SRC3.CALENDAR_ID = SRC2.PARENT_CALENDAR_ID
AND SRC3.WORKING_DAY_DATE between SRC.START_DATE and coalesce(SRC.END_DATE,coalesce(SRC.END_DATE,
                    DATE_ADD((SELECT
                        max(lastupdated) 
                    FROM
                        itpa_l_dev_workdb.d_o_data_freshness
						WHERE source_id=SRC.sourceinstance 
                        ), INTERVAL 730 DAY)))
AND SRC3.sourceinstance = SRC2.sourceinstance 
AND SRC3.sourceinstance = SRC.sourceinstance
left join #MDS_TABLE_SCHEMA.hp_kdrv_calendar_exceptions_final SRC4
on SRC2.CALENDAR_ID = SRC4.CALENDAR_ID and
SRC3.WORKING_DAY_DATE = SRC4.EVENT_DATE and SRC2.sourceinstance = SRC4.sourceinstance and SRC4.sourceinstance = SRC3.sourceinstance
left join #DWH_TABLE_SCHEMA.f_resource_availability TRGT
on concat(SRC.USER_ID,'~',COALESCE(DATE_FORMAT(CONVERT_TZ(SRC3.WORKING_DAY_DATE,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),
'%Y%m%d'),'UNSPECIFIED') ) = TRGT.row_id
WHERE	(SRC3.WORKING_DAY_FLAG = 'Y') AND  SRC4.EVENT_DATE is NULL -- row_count



SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for f_resource_availability' ELSE 'SUCCESS' END as Message
from (
select count_src
from
  (
select SRC1.sourceinstance, COUNT(*) count_src FROM
(select * from qa_caint_mdsdb.prj_blb_slices_final  where cdctype<>'D')SRC1
inner join 
(select * from qa_caint_mdsdb.prj_blb_slicerequests_final where cdctype<>'D' and request_name='DAILYRESOURCEAVAILCURVE')SRC2
on SRC1.slice_request_id=SRC2.ID and SRC1.sourceinstance=SRC2.sourceinstance
) count_src
left outer join
(select source_id,count(*) count_trgt from qa_caint_mdwdb.f_resource_availability TRGT where TRGT.row_key not in (0, -1)
group by source_id) count_trgt
on count_src.sourceinstance=count_trgt.source_id where count_src.count_src <>count_trgt.count_trgt)SQ