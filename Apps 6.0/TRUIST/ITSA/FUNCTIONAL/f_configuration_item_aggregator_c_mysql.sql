
SELECT 
CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_configuration_item_aggregator_c' ELSE 'SUCCESS' END as Message
FROM
(select count(*) as cnt
from (
select sdof.label,
count(*) as total_configuration_items
,sum(case when ser.u_environment is null then 1 else 0 end) as missing_environment_c_flag_count
,sum(case when ser.location is null  then 1 else 0 end) as missing_location_c_flag_count
,sum(case when ser.support_group is null then 1 else 0 end) as missing_support_group_c_flag_count
,sum(case when ser.u_tier_rating is null then 1 else 0 end) as missing_tier_c_flag_count
from truist_mdsdb.cmdb_ci_final  as ser
LEFT JOIN truist_mdsdb.sys_db_object_final sdof ON ser.sys_class_name=sdof.name and ser.SourceInstance=sdof.SourceInstance
inner join (select value,label from truist_mdsdb.sys_choice_final where name = 'cmdb_ci' and element = 'operational_status' and language = 'en' and label = 'Operational' group by value) as op on op.value = ser.operational_status
inner join (select value,label from truist_mdsdb.sys_choice_final where name = 'cmdb_ci' and element = 'install_status' and language = 'en' and label = 'Installed' group by value) as ins on ins.value = ser.install_status
group by sdof.label
) as src
left join
(Select class,total_configuration_items_count,
missing_environment_c_flag_count,missing_location_c_flag_count,missing_support_group_c_flag_count,missing_tier_c_flag_count
from truist_mdwdb.f_configuration_item_aggregator_c cd 
inner join(select date_format(max(lastupdated) ,'%Y%m01') AS refreshday from truist_mdwdb.d_o_data_freshness) as df  
where cd.aggregate_c_key = df.refreshday) as trgt
on src.label = trgt.class
where src.missing_environment_c_flag_count <> trgt.missing_environment_c_flag_count
or src.missing_location_c_flag_count <> trgt.missing_location_c_flag_count
or src.missing_support_group_c_flag_count <> trgt.missing_support_group_c_flag_count
or src.missing_tier_c_flag_count <> trgt.missing_tier_c_flag_count) temp;