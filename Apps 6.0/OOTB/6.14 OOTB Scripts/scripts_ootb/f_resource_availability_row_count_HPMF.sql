select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'MDS to DWH row count failed for d_project.row_count' else 'SUCCESS' end as Message
from 
(select * from
(select count(*) count_1 from #DWH_TABLE_SCHEMA.f_resource_availability TRGT 
join (select distinct source_id from #DWH_TABLE_SCHEMA.d_o_data_freshness where sourcename = 'Microfocus_Tenant') ODF on ODF.source_id = TRGT.source_id
where TRGT.soft_deleted_flag = 'N' and TRGT.row_key not in (0,-1)
) A, 
(select count(*) count_2 FROM #MDS_TABLE_SCHEMA.hp_knta_users_final  SRC
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
WHERE	(SRC3.WORKING_DAY_FLAG = 'Y') and SRC4.EVENT_DATE is NULL) B
where count_1 <> count_2) SQ; 




