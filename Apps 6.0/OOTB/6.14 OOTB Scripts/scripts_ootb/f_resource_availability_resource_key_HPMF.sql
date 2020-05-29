SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed ' ELSE 'SUCCESS' END as Message
from (select *from  #MDS_TABLE_SCHEMA.hp_knta_users_final WHERE cdctype <> 'D') SRC
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
left join #MDS_TABLE_SCHEMA.hp_kdrv_calendar_setups_final SRC5
on  SRC2.PARENT_CALENDAR_ID = SRC5.CALENDAR_ID 
and SRC2.sourceinstance = SRC5.sourceinstance
left join #MDS_TABLE_SCHEMA.hp_kdrv_calendar_exceptions_final SRC4
on SRC2.CALENDAR_ID = SRC4.CALENDAR_ID and
SRC3.WORKING_DAY_DATE = SRC4.EVENT_DATE and SRC2.sourceinstance = SRC4.sourceinstance and SRC4.sourceinstance = SRC3.sourceinstance
left join #DWH_TABLE_SCHEMA.f_resource_availability TRGT
on concat(SRC.USER_ID,'~',COALESCE(DATE_FORMAT(CONVERT_TZ(SRC3.WORKING_DAY_DATE,'@#TENANT_SSI_TIME_ZONE@#','@#DW_TARGET_TIME_ZONE@#'),
'%Y%m%d'),'UNSPECIFIED') ) = TRGT.row_id
left join #DWH_TABLE_SCHEMA.d_internal_contact LKP
on CONCAT('INTERNAL~CONTACT~',SRC.USER_ID) = LKP.row_id
WHERE	(SRC3.WORKING_DAY_FLAG = 'Y') AND SRC4.EVENT_DATE is NULL AND COALESCE(CONCAT(LKP.row_key,CASE WHEN SRC.USER_ID IS NULL THEN 0 else '-1' end)) <> COALESCE(TRGT.resource_key,'')