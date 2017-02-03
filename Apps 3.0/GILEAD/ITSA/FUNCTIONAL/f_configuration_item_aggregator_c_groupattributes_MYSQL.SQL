select  
CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message 
from gilead_mdwdb.f_configuration_item_aggregator_c TRGT
JOIN
(
select 
ci.class,
ci.environment as environment,
ci.owner_group as owner_group,
ci.location as location,
ci.operational_status as operational_status,
concat(ci.class,'~',ci.environment,'~',ci.owner_group,'~',ci.location,'~',ci.operational_status,'~',cd.row_id) as row_id
from gilead_mdwdb.d_calendar_date  as cd
inner join(select DATE_FORMAT((SUBDATE(max(lastupdated), 
WEEKDAY(max(lastupdated)))),'%Y%m%d') AS refreshday,lastupdated from gilead_workdb.o_data_freshness as df  ) as df 
on cd.row_id = df.refreshday 
inner join (select 
COALESCE(sdof.label,'UNSPECIFIED')as class,
COALESCE(cmn.name,'UNSPECIFIED') as location ,
COALESCE(op.label,'UNSPECIFIED') as operational_status,
COALESCE(grp.name,'UNSPECIFIED') as owner_group ,
COALESCE(env.label,'UNSPECIFIED') as environment
from gilead_mdsdb.cmdb_ci_final  as con
inner join gilead_mdsdb.sys_db_object_final sdof on con.sys_class_name=sdof.name and con.SourceInstance=sdof.SourceInstance
inner join (select value,label from gilead_mdsdb.sys_choice_final where name = 'cmdb_ci' and element = 'operational_status' and language = 'en' and label = 'Active' group by value) as op on (op.value = con.operational_status)
inner join (select value,label from gilead_mdsdb.sys_choice_final where name = 'cmdb_ci' and element = 'install_status' and language = 'en' and label = 'Installed' group by value) as ins on(ins.value = con.install_status)
LEFT join( select value,label from gilead_mdsdb.sys_choice_final where name = 'cmdb_ci' and element = 'u_environment' and language = 'en'  group by value) env on (env.value = con.u_environment)
LEFT JOIN gilead_mdsdb.cmdb_ci_service_final service on(con.sys_id = service.sys_id and con.sourceinstance = service.sourceinstance)
LEFT join gilead_mdsdb.cmn_location_final cmn on (cmn.sys_id=con.location and cmn.SourceInstance=con.SourceInstance)
LEFT JOIN gilead_mdsdb.sys_user_group_final grp ON (grp.sys_id = service.support_group and grp.sourceinstance = grp.sourceinstance)
group by sdof.label,cmn.name,op.label,grp.name,env.label) as ci on cd.row_id = cd.week_start_date_key
group by cd.row_id,ci.class
)SRC on SRC.row_id = TRGT.row_id
where
SRC.location<>TRGT.location or 
SRC.operational_status<> TRGT.operational_status or 
SRC.owner_group<>TRGT.owner_group or 
SRC.environment<>TRGT.environment




