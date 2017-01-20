select  CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message from gilead_mdwdb.f_configuration_item_aggregator_c TRGT
JOIN
(

select 
ci.class
,sum(ci.total_configuration_items_count) as total_configuration_items_count
,sum(ci.missing_environment_flag_count) as missing_environment_flag_count
,sum(ci.missing_name_flag_count) as missing_name_flag_count
,sum(ci.missing_owner_group_flag_count) as missing_owner_group_flag_count
,sum(ci.missing_location_flag_count) as missing_location_flag_count
,sum(ci.missing_sox_classification_flag_count) as missing_sox_classification_flag_count
,sum(ci.missing_gxp_classification_flag_count) as missing_gxp_classification_flag_count
,sum(ci.missing_business_criticality_flag_count) as missing_business_criticality_flag_count
,sum(ci.missing_system_manager_flag_count) as missing_system_manager_flag_count
, concat(coalesce(ci.class,''),'~',cd.row_id) as row_id
from gilead_mdwdb.d_calendar_date  as cd
inner join(select DATE_FORMAT((SUBDATE(max(lastupdated), 
WEEKDAY(max(lastupdated)))),'%Y%m%d') AS refreshday,lastupdated from gilead_workdb.o_data_freshness as df  ) as df 


on cd.row_id = df.refreshday 

inner join (select 
                                                                con.sourceinstance
                                                                ,sdof.label as class
                                                                ,count(*) as total_configuration_items_count
                                                                ,sum(case when con.u_environment is null then 1 else 0 end) as missing_environment_flag_count
                                                                ,sum(case when con.name is null  then 1 else 0 end) as missing_name_flag_count
                                                                ,sum(case when service.support_group is null then 1 else 0 end) as missing_owner_group_flag_count
                                                                ,sum(case when con.location is null then 1 else 0 end) as missing_location_flag_count
                                                                ,sum(case when con.u_sox is null then 1 else 0 end) as missing_sox_classification_flag_count
                                                                ,sum(case when con.u_gxp is null  then 1 else 0 end) as missing_gxp_classification_flag_count
                                                                ,sum(case when con.u_business_criticality is null then 1 else 0 end) as missing_business_criticality_flag_count
                                                                ,sum(case when service.managed_by is null then 1 else 0 end) as missing_system_manager_flag_count
                                                                
                                                                from gilead_mdsdb.cmdb_ci_final  as con
                                                                inner join gilead_mdsdb.sys_db_object_final sdof on con.sys_class_name=sdof.name and con.SourceInstance=sdof.SourceInstance
                                                                inner join (select value,label from gilead_mdsdb.sys_choice_final where name = 'cmdb_ci' and element = 'operational_status' and language = 'en' and label = 'Active' group by value) as op 
                                                                on op.value = con.operational_status
                                                                inner join (select value,label from gilead_mdsdb.sys_choice_final where name = 'cmdb_ci' and element = 'install_status' and language = 'en' and label = 'Installed' group by value) as ins 
                                                                on ins.value = con.install_status
                                                                LEFT JOIN gilead_mdsdb.cmdb_ci_service_final service
                                                                on con.sys_id = service.sys_id and con.sourceinstance = service.sourceinstance
                                                                group by con.sourceinstance,sdof.label) as ci 
on cd.row_id = cd.week_start_date_key
group by cd.row_id,ci.class

)SRC on SRC.row_id = TRGT.row_id

where
SRC.total_configuration_items_count<>TRGT.total_configuration_items_count or 
SRC.missing_environment_flag_count<>TRGT.missing_environment_flag_count or 
SRC.missing_name_flag_count<>TRGT.missing_name_flag_count or
SRC.missing_owner_group_flag_count<>TRGT.missing_owner_group_flag_count or
SRC.missing_location_flag_count<>TRGT.missing_location_flag_count or
SRC.missing_sox_classification_flag_count<>TRGT.missing_sox_classification_flag_count or
SRC.missing_gxp_classification_flag_count<>TRGT.missing_gxp_classification_flag_count or
SRC.missing_business_criticality_flag_count<>TRGT.missing_business_criticality_flag_count or
SRC.missing_system_manager_flag_count<>TRGT.missing_system_manager_flag_count

