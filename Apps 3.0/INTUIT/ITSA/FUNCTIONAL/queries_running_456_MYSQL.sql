CaseSensitiveissueinLOV_mysql.sql :: 



SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_item.configuration_item_key' ELSE 'SUCCESS' END as Message
 FROM (
select dimension_class , upper(dimension_class) 
from intuit_mdwdb.d_lov 
where dimension_class COLLATE utf8_bin <> upper(dimension_class) COLLATE utf8_bin)a; 


Closed_on_key_null-dim-closed_mysql.sql :: 


select CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_incident.state_src_key' ELSE 'SUCCESS' END as Message
 FROM(
select count(1) cnt
from intuit_mdwdb.f_incident f
 join intuit_mdwdb.d_lov_map d on src_key=state_src_key
 join intuit_mdwdb.d_lov lov on lov.dimension_class=d.dimension_class and lov.dimension_code=d.dimension_code 
and d.dimension_class not IN ('STATE~GEO','CITY~GEO', 'COUNTRY~GEO','CURRENCY')
 and d.src_key not in(-1) 
where f.closed_on_key is null	and dimension_wh_code ='CLOSED')a


 


D_LOV-LSM_LS_Enable_flagvalidation_mysql.sql :: 


select case when count(1) > 0 then 'WARNING' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'Distinct dimension classes which are not loaded into d_lov' else 'SUCCESS' end as Message
from (
select TGT.dimension_class as d1 , SRC.dimension_class as d2
from (select class_value as dimension_class
from intuit_workdb.lsm_ls_system_variables conf
where conf.enable_flag = 'Y') SRC
left join intuit_mdwdb.d_lov TGT
ON TGT.dimension_class = SRC.dimension_class
where TGT.row_id is null and SRC.dimension_class not like '%CALL%' and SRC.dimension_class not like '%FACILITIES%')a;
 


D_LOV_MAP-SRC_KEYhaving-1_mysql.sql :: 


 
 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'SRC_KEY=-1 in d_lov_map issue' ELSE 'SUCCESS' END as Message
 FROM(
select lov.src_rowid lov_src_rowid,map.src_rowid map_src_rowid,lov.dimension_code lov_dimension_code,map.dimension_code lov_map_dimension_code,
lov.row_id,SRC.column_value,SRC.table_value,lov.row_key lov_row_key,map.src_key lov_map_src_key,
lov.dimension_class as lov_dimension_class,
map.dimension_class as map_dimension_class
from  intuit_mdwdb.d_lov_map map
 join intuit_mdwdb.d_lov lov on lov.src_rowid=map.src_rowid and lov.source_id=map.source_id
left join
(select conf.table_value table_value,conf.column_value column_value,UPPER(concat(conf.class_value,'~~~',scf.value)) as 
row_id,scf.sourceinstance AS source_id
from intuit_workdb.lsm_ls_system_variables conf
left join intuit_mdsdb.sys_choice_final scf on conf.table_value= scf.name and conf.column_value = scf.element
where conf.enable_flag = 'Y'
and scf.inactive = 0
and scf.language='en') SRC
on lov.row_id = SRC.row_id
and lov.source_id = SRC.source_id
where src_key<0 )x 


d_lov_map_row_id_Validation_mysql.sql :: 


SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_item.configuration_item_key' ELSE 'SUCCESS' END as Message
FROM (
select row_key
from intuit_mdwdb.d_lov_map 
where src_rowId<>concat(coalesce(dimension_class,''),'~',coalesce(dimension_type,''),'~',coalesce(dimension_subtype,''),'~',ucase(coalesce(dimension_code)))
  or 
  wh_rowid <> concat(coalesce(wh_dimension_class,''),'~',coalesce(wh_dimension_type,''),'~',coalesce(dimension_subtype,''),'~',ucase(coalesce(dimension_wh_code,''))) 
)a;
 


d_lov_row_id_Validation_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_request_item.configuration_item_key' ELSE 'SUCCESS' END as Message
FROM (
select count(1) as cnt
from intuit_mdwdb.d_lov
where 
row_id <> concat(dimension_class,'~',dimension_type,'~',dimension_subtype,'~',dimension_code)
and dimension_class <>'LANDING_PAGE'
and row_key not in (-1,0)
)a;
 


d_lov_sys_choice_mysql.sql :: 


SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_lov' ELSE 'SUCCESS' END as Message
 FROM 
(select distinct LSM.class_value as dimension_class
,SRC.value as dimension_code
,SRC.label as dimension_name
,concat(LSM.class_value,'~~~',SRC.value) as src_rowid
,concat(LSM.class_value,'~~~',SRC.value) as row_id
,'N' as soft_deleted_flag
,'Y' as current_flag

from
 intuit_mdsdb.sys_choice_final SRC
join intuit_workdb.lsm_ls_system_variables LSM
on (LSM.table_value=SRC.name
and LSM.column_value=SRC.element )
where language='en' and enable_flag='Y' and inactive=0 and sys_created_on= (select max(sys_created_on) from intuit_mdsdb.sys_choice_final) 

) SRC
left join intuit_mdwdb.d_lov TRGT
on(SRC.row_id=TRGT.row_id
and TRGT.source_id = 2)
where SRC.dimension_class<>TRGT.dimension_class
or SRC.dimension_code<>TRGT.dimension_code
or SRC.dimension_name<>TRGT.dimension_name
or UPPER(SRC.src_rowid)<>TRGT.src_rowid
or SRC.soft_deleted_flag<>TRGT.soft_deleted_flag
or SRC.current_flag<>TRGT.current_flag

 


d_lov_wf_stage_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_lov' ELSE 'SUCCESS' END as Message
 FROM (
select count(1) as cnt from 
(
select 
distinct LSM.class_value as dimension_class
,SRC.value as dimension_code
,SRC.name as dimension_name
,concat(LSM.class_value,'~~~',SRC.value) as src_rowid
,concat(LSM.class_value,'~~~',SRC.value) as row_id
,'N' as soft_deleted_flag
,'Y' as current_flag
from intuit_mdsdb.wf_stage_final SRC
 join intuit_workdb.lsm_ls_system_variables LSM
on (LSM.table_value=SRC.name and LSM.column_value ='stage' and enable_flag='Y')
 join  intuit_mdsdb.wf_workflow_version_final SRC2
on (LSM.table_value=SRC2.table
and SRC2.sys_id=SRC.workflow_version)
join (
	select distinct SRC.value as dimension_code
	from intuit_mdsdb.sys_choice_final SRC
	join intuit_workdb.lsm_ls_system_variables LSM
	on (LSM.table_value=SRC.name
	and LSM.column_value=SRC.element and enable_flag='Y' )where language='en')bc 
on SRC.value <>bc.dimension_code
	) SRC
left join intuit_mdwdb.d_lov TRGT
on(SRC.row_id=TRGT.row_id
and TRGT.source_id = 2)
where (SRC.dimension_class<>TRGT.dimension_class
or SRC.dimension_code<>TRGT.dimension_code
or SRC.dimension_name<>TRGT.dimension_name
or SRC.src_rowid<>TRGT.src_rowid
or SRC.soft_deleted_flag<>TRGT.soft_deleted_flag
or SRC.current_flag<>TRGT.current_flag
)
)a 


DimclassnotconfiguedinLSMLSTable_mysql.sql :: 


/* 
--Please Ignore the dimension classes related to Asset,Finance
-- APP 1870 is the defect raised for not having LSM LS Dim class not configured
--Ignore Category and Subcategory for TJX(Populated using M2SI ,Not configured using LSM LS Sytem variable)*/

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'Dimension classes not configured in LSM LS System Variables:Ignore Category and Subcategory for TJX' ELSE 'SUCCESS' END as Message
 FROM(

select distinct dimension_class,source_id
from intuit_mdwdb.d_lov lov where  source_id=2 and dimension_class 
not in (select class_value from intuit_workdb.lsm_ls_system_variables where enable_flag='Y'  )  and dimension_class 
 like '%~%' and  (dimension_class NOT LIKE '%GEO%') and dimension_class not in (

'ASSET',
'ASSET_AGE',
'CITY~GEO',
'COUNTRY~GEO',
'CURRENCY',
'EXPENSE_ITEM',
'GENDER',
'STATE~GEO',
'WARRANTY',
'CRITICALITY~BUSINESS_SERVICE'

) )a;
 


DuplicatesinDimensions_mysql.sql :: 


select case when cnt > 1 then 'FAILURE' else 'SUCCESS' end as Result,
case when cnt > 1 then 'Duplicates exists in Dimensions' else 'SUCCESS' end as Message
from (
select 'd_configuration_item',row_id,source_id,count(1) cnt
from intuit_mdwdb.d_configuration_item
group by 1,2
having count(1) > 1
union
select 'd_incident',row_id,source_id,count(1) cnt
from intuit_mdwdb.d_incident
group by 1,2
having count(1) > 1
union
select 'd_internal_contact',row_id,source_id,count(1) cnt
from intuit_mdwdb.d_internal_contact
group by 1,2
having count(1) > 1
union
select 'd_internal_organization',row_id,source_id,count(1) cnt
from intuit_mdwdb.d_internal_organization
group by 1,2
having count(1) > 1
union
select 'd_location',row_id,source_id,count(1) cnt
from intuit_mdwdb.d_location
group by 1,2
having count(1) > 1
union
select 'd_problem',row_id,source_id,count(1) cnt
from intuit_mdwdb.d_problem
group by 1,2
having count(1) > 1
union
select 'd_problem_task',row_id,source_id,count(1) cnt
from intuit_mdwdb.d_problem_task
group by 1,2
having count(1) > 1
union
select 'd_request',row_id,source_id,count(1) cnt
from intuit_mdwdb.d_request
group by 1,2
having count(1) > 1
union
select 'd_request_item',row_id,source_id,count(1) cnt
from intuit_mdwdb.d_request_item
group by 1,2
having count(1) > 1
union
select 'd_request_task',row_id,source_id,count(1) cnt
from intuit_mdwdb.d_request_task
group by 1,2
having count(1) > 1
union
select 'd_task',row_id,source_id,count(1) cnt
from intuit_mdwdb.d_task
group by 1,2
having count(1) > 1
union
select 'd_task_sla',row_id,source_id,count(1) cnt
from intuit_mdwdb.d_task_sla
group by 1,2
having count(1) > 1
union
select 'd_master_item',row_id,source_id,count(1) cnt
from intuit_mdwdb.d_master_item
group by 1,2
having count(1) > 1


)a 


EntriesinD_o_data_freshness_mysql.sql :: 


SELECT CASE WHEN count(1) < 1 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN count(1) < 1 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM(
select distinct sourcename from intuit_mdwdb.d_o_data_freshness
group by sourcename having sourcename like '%ServiceNow%')a 


LOV_Many0and-1_mysql.sql :: 


SELECT CASE WHEN count(1) > 2 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >2 THEN 'Multiple 0 and -1 in the dim table LOV' ELSE 'SUCCESS' END as Message
 FROM(
select count(1) from intuit_mdwdb.d_lov where row_key in (-1,0))a; 


LOV_MAPVALIDATION_mysql.sql :: 


select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.state_src_key' ELSE 'SUCCESS' END as Message
 FROM(
select lov.dimension_code lov_dimension_code,lov.row_key lov_row_key,map.src_key lov_map_src_key,map.dimension_code lov_map_dimension_code,lov.dimension_class as lov_dimension_class,map.dimension_class as map_dimension_class from  intuit_mdwdb.d_lov_map map
left join intuit_mdwdb.d_lov lov on lov.src_rowid = map.src_rowid
where lov.row_id is null and map.dimension_class not IN ('STATE~GEO','CITY~GEO', 'COUNTRY~GEO','CURRENCY')
and map.src_key not in(-1) )a 


LOV_MAP_Many0and-1_mysql.sql :: 


SELECT CASE WHEN count(1) > 2 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >2 THEN 'Multiple 0 and -1 in the dim table LOV MAP' ELSE 'SUCCESS' END as Message
 FROM(
select count(1) from intuit_mdwdb.d_lov_map where row_key in (-1,0))a; 


RowCount_MDS-d_geography_mysql.sql :: 


SELECT CASE WHEN  (count_mds = count_dwh) THEN 'SUCCESS' ELSE 'FAILURE' END AS Result
,CASE WHEN (count_mds =count_dwh) THEN 'Data Matched'
ELSE CONCAT( 'MDS-DWH RowCount did not Match for ', DWH.Table_DWH , '. MDS:',count_mds,'DWH : ' ,DWH.Count_DWH)
END AS Message
FROM (SELECT (
SELECT COUNT(1) FROM intuit_mdsdb.cmn_location_final ) AS count_mds) MDS,
(SELECT COUNT(1) Count_DWH, 'd_geography'  Table_DWH 
FROM intuit_mdwdb.d_geography WHERE row_key NOT IN (0,-1) and soft_deleted_flag='N') DWH  


RowCount_MDS-d_internal_contact_sn_mysql.sql :: 


SELECT CASE WHEN  (count_mds = count_dwh) THEN 'SUCCESS' ELSE 'FAILURE' END AS Result
,CASE WHEN (count_mds =count_dwh) THEN 'Data Matched'
ELSE CONCAT( 'MDS-DWH RowCount did not Match for ', DWH.Table_DWH , '. MDS:',count_mds,'DWH : ' ,DWH.Count_DWH)
END AS Message
FROM (SELECT (SELECT COUNT(1) FROM intuit_mdsdb.sys_user_final ) AS count_mds ) MDS,
(SELECT COUNT(1) Count_DWH, 'd_internal_contact'  Table_DWH 
FROM intuit_mdwdb.d_internal_contact WHERE row_key NOT IN (0,-1)  and current_flag='Y'
AND soft_deleted_flag='N') DWH
 


RowCount_MDS-d_internal_organization_sn_mysql.sql :: 






SELECT CASE WHEN  (count_mds = count_dwh) THEN 'SUCCESS' ELSE 'FAILURE' END AS Result
,CASE WHEN (count_mds =count_dwh) THEN 'Data Matched'
ELSE CONCAT( 'MDS-DWH RowCount did not Match for ', DWH.Table_DWH , '. MDS:',count_mds,'DWH : ' ,DWH.Count_DWH)
END AS Message
FROM (SELECT (SELECT COUNT(1) FROM intuit_mdsdb.core_company_final) + (SELECT COUNT(1) FROM intuit_mdsdb.cmn_department_final) +
 (SELECT COUNT(1) FROM intuit_mdsdb.sys_user_group_final)

 AS count_mds) MDS,
(SELECT COUNT(1) Count_DWH, 'd_internal_organization'  Table_DWH 
FROM intuit_mdwdb.d_internal_organization WHERE row_key NOT IN (0,-1) and soft_deleted_flag='N') DWH



 


RowCount_MDS-d_location_mysql.sql :: 


SELECT CASE WHEN  (count_mds = count_dwh) THEN 'SUCCESS' ELSE 'FAILURE' END AS Result
,CASE WHEN (count_mds =count_dwh) THEN 'Data Matched'
ELSE CONCAT( 'MDS-DWH RowCount did not Match for ', DWH.Table_DWH , '. MDS:',count_mds,'DWH : ' ,DWH.Count_DWH)
END AS Message
FROM (SELECT (SELECT COUNT(1) FROM intuit_mdsdb.cmn_location_final )  AS count_mds) MDS,
(SELECT COUNT(1) Count_DWH, 'd_location'  Table_DWH 
FROM intuit_mdwdb.d_location WHERE row_key not in (0,-1) and soft_deleted_flag='N') DWH 


RowCount_MDS-d_master_item_sn_mysql.sql :: 






SELECT CASE WHEN  (count_mds = count_dwh) THEN 'SUCCESS' ELSE 'FAILURE' END AS Result
,CASE WHEN (count_mds =count_dwh) THEN 'Data Matched'
ELSE CONCAT( 'MDS-DWH RowCount did not Match for ', DWH.Table_DWH , '. MDS:',count_mds,'DWH : ' ,DWH.Count_DWH)
END AS Message
FROM (SELECT (SELECT COUNT(1) FROM intuit_mdsdb.sc_cat_item_final) AS count_mds) MDS,
(SELECT COUNT(1) Count_DWH, 'd_master_item'  Table_DWH 
FROM intuit_mdwdb.d_master_item WHERE row_key NOT IN (0,-1) and soft_deleted_flag='N')  DWH


 


SYS_CHOICE_D_LOV_Row_idIssue_mysql.sql :: 


select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'sys_choice-d_lov row_di does not exist' else 'SUCCESS' end as Message
from (
select TGT.row_id a1 , SRC.row_id a2
from (select UPPER(concat(conf.class_value,'~~~',scf.value)) as row_id,scf.sourceinstance AS source_id
from intuit_workdb.lsm_ls_system_variables conf
join intuit_mdsdb.sys_choice_final scf on conf.table_value= scf.name and conf.column_value = scf.element
where conf.enable_flag = 'Y'
and scf.inactive = 0
and scf.language='en') SRC
left join intuit_mdwdb.d_lov TGT
ON TGT.row_id = SRC.row_id
and TGT.source_id = SRC.source_id
where coalesce(TGT.row_id,-99)  <> coalesce(SRC.row_id,-99)
and SRC.row_id not like '%GOAL~~~%'
and SRC.row_id not like '%PROJECT~~~%'
and SRC.row_id not like '%PORTFOLIO~~~%' )a;
 


SysAuditnotextractedproperly(tenthousand)_mysql.sql :: 



SELECT CASE WHEN cnt<10000 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt<10000 THEN 'Data in Sys Audit Table is not extracted properly' ELSE 'SUCCESS' END as Message  from
   (select count(1) as cnt from intuit_mdsdb.sys_audit_final  )a 


SysAuditnotextractedproperly(thousand)_mysql.sql :: 



SELECT CASE WHEN cnt<1000 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt<1000 THEN 'Data in Sys Audit Table is not extracted properly' ELSE 'SUCCESS' END as Message  from
   (select count(1) as cnt from intuit_mdsdb.sys_audit_final  )a 


count_d_incident_mysql.sql :: 



SELECT CASE WHEN cnt<>cntt THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt<>cntt THEN concat('Failure',(cnt-cntt)) ELSE 'Data Matched' END as Message
 FROM
(

select RES1.cnt as cnt, RES2.cntt from

(select count(sys_id) as cnt from
intuit_mdsdb.incident_final) as RES1,

(select count(row_id)-2 as cntt 
from intuit_mdwdb.d_incident where soft_deleted_flag='N') RES2

)a; 


 


d_incident_active_flag_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.active_flag' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.incident_final SRC 
  JOIN intuit_mdwdb.d_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE ( CASE WHEN SRC.active= 1 then 'Y' else 'N' END)<> (TRGT.active_flag )
 


d_incident_auto_generated_flag_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.auto_generated_flag' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.incident_final SRC 
 LEFT JOIN intuit_mdwdb.d_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( 'N','')<> COALESCE(TRGT.auto_generated_flag ,'')
 


d_incident_backlog_flag_mysql.sql :: 


SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.backlog_flag' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.incident_final SRC 
 LEFT JOIN intuit_mdwdb.d_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
   JOIN  intuit_mdwdb.f_incident TRGTF 
 ON (TRGTF.incident_key =TRGT.row_key
 AND TRGTF.source_id =TRGT.source_id)
LEFT JOIN intuit_mdwdb.d_lov_map LM
 on TRGTF.state_src_key = LM.src_key 
WHERE LM.dimension_class = 'STATE~INCIDENT' and 
( CASE WHEN LM.dimension_wh_code NOT IN('RESOLVED','CLOSED') THEN 'Y' ELSE 'N' END)<> (TRGT.backlog_flag)
 


d_incident_caused_by_change_flag_mysql.sql :: 





SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.caused_by_change_flag' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.incident_final SRC 
  JOIN intuit_mdwdb.d_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE ( CASE WHEN SRC.caused_by is not null then 'Y' else 'N' END)<> (TRGT.caused_by_change_flag )
 


d_incident_change_flag_mysql.sql :: 





SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.change_flag' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.incident_final SRC 
  JOIN intuit_mdwdb.d_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE ( CASE WHEN SRC.rfc is not null then 'Y' else 'N' END)<> (TRGT.change_flag )
 


d_incident_changed_by_mysql.sql :: 





SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.changed_by' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.incident_final SRC 
  JOIN intuit_mdwdb.d_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( SRC.sys_updated_by,'')<> COALESCE(TRGT.changed_by ,'')
 


d_incident_changed_on_mysql.sql :: 





SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.changed_on' ELSE 'SUCCESS' END as Message
  FROM intuit_mdsdb.incident_final SRC 
 LEFT JOIN intuit_mdwdb.d_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE convert_tz(SRC.sys_updated_on,"GMT","America/Los_Angeles")<> TRGT.changed_on 
 


d_incident_closed_on_mysql.sql :: 


SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.closed_on' ELSE 'SUCCESS' END as Message  FROM intuit_mdsdb.incident_final SRC  LEFT JOIN intuit_mdwdb.d_incident TRGT  ON 
(SRC.sys_id =TRGT.row_id   AND SRC.sourceinstance= TRGT.source_id  ) 
join  intuit_mdwdb.f_incident TRGTF  ON TRGTF.incident_key=TRGT.row_key
JOIN intuit_mdwdb.d_lov_map lkp
on TRGTF.state_src_key = lkp.src_key
WHERE convert_tz(coalesce(SRC.closed_at,sys_updated_on),"GMT","America/Los_Angeles")<> (TRGT.closed_on)
AND dimension_wh_code = 'CLOSED'
 


d_incident_created_by_mysql.sql :: 





SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.created_by' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.incident_final SRC 
 LEFT JOIN intuit_mdwdb.d_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( SRC.sys_created_by,'')<> COALESCE(TRGT.created_by ,'')
 


d_incident_created_on_mysql.sql :: 


SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.created_on' ELSE 'SUCCESS' END as Message  FROM intuit_mdsdb.incident_final SRC  LEFT JOIN intuit_mdwdb.d_incident TRGT  ON (SRC.sys_id =TRGT.row_id   AND SRC.sourceinstance= TRGT.source_id  ) WHERE convert_tz(SRC.sys_created_on,"GMT","America/Los_Angeles")<> TRGT.created_on 
 


d_incident_description_mysql.sql :: 





SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.description' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.incident_final SRC 
 LEFT JOIN intuit_mdwdb.d_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( SRC.description,'')<> COALESCE(TRGT.description ,'')
 


d_incident_domain_key_mysql.sql :: 





SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.domain_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.incident_final SRC 
 LEFT JOIN intuit_mdwdb.d_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN intuit_mdwdb.d_domain LKP 
 ON ( SRC.sys_domain= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.sys_domain IS NULL THEN 0 else -1 end)<>(TRGT.domain_key)
 


d_incident_dormant_flag_mysql.sql :: 


 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_incident.dormant_flag' ELSE 'SUCCESS' END as Message from (
 select count(1) as cnt 
  FROM 
intuit_mdwdb.d_incident di
  JOIN intuit_mdwdb.f_incident fi ON di.row_key = fi.incident_key
  JOIN intuit_mdwdb.d_lov_map dlm ON fi.state_src_key = dlm.src_key  	
  where dlm.dimension_class = 'STATE~INCIDENT'
  AND dlm.dimension_wh_code = 'OPEN'
  AND  (CASE WHEN timestampdiff(DAY,di.changed_on, (SELECT MAX(lastupdated) AS lastupdated
FROM intuit_mdwdb.d_o_data_freshness WHERE sourcename like 'ServiceNow%'))>30 THEN 'Y' ELSE 'N' END) <> di.dormant_flag)a; 


d_incident_due_on_mysql.sql :: 


SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.due_on' ELSE 'SUCCESS' END as Message  FROM intuit_mdsdb.incident_final SRC  LEFT JOIN intuit_mdwdb.d_incident TRGT  ON (SRC.sys_id =TRGT.row_id   AND SRC.sourceinstance= TRGT.source_id  ) WHERE 
coalesce(convert_tz(SRC.due_date,"GMT","America/Los_Angeles"),-99)<> coalesce(TRGT.due_on,-99)
 


d_incident_duplicate_incident_flag_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.duplicate_incident_flag' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.incident_final SRC 
 LEFT JOIN intuit_mdwdb.d_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( 'N','')<> COALESCE(TRGT.duplicate_incident_flag ,'')
 


d_incident_first_call_resolution_flag_mysql.sql :: 


SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.first_call_resolution_flag' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.incident_final SRC
  JOIN intuit_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
JOIN intuit_mdwdb.d_incident d ON d.row_key = TRGT.incident_key
WHERE   
 TIMESTAMPDIFF(SECOND,d.opened_on,coalesce( d.closed_on,d.changed_on))  <> TRGT.open_to_resolve_duration and
d.last_resolved_on is null; 


d_incident_first_line_resolution_flag_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.first_line_resolution_flag' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.incident_final SRC 
 LEFT JOIN intuit_mdwdb.d_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( 'N','')<> COALESCE(TRGT.first_line_resolution_flag ,'')
 


d_incident_first_point_of_contact_resolution_flag_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.first_point_of_contact_resolution_flag' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.incident_final SRC 
 LEFT JOIN intuit_mdwdb.d_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( 'N','')<> COALESCE(TRGT.first_point_of_contact_resolution_flag ,'')
 


d_incident_grand_parent_incident_key_mysql.sql :: 



SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.grand_parent_incident_key' ELSE 'SUCCESS' END as Message
from (
SELECT CASE
              WHEN si.grand_parent_incident_id ='UNSPECIFIED' THEN 0
              ELSE (di.row_key)
          END AS row_key,
          si.row_id AS row_id,
          si.source_id,
    COALESCE(di.grand_parent_incident_key,'') as grand_parent_incident_key
   FROM (select 
COALESCE(parent_i.parent_incident,'UNSPECIFIED') as grand_parent_incident_id
,i.SourceInstance as source_id
,i.sys_id as row_id
FROM intuit_mdsdb.incident_final i
LEFT JOIN intuit_mdsdb.incident_final parent_i
ON i.parent_incident=parent_i.sys_id)si
   LEFT JOIN intuit_mdwdb.d_incident di ON si.grand_parent_incident_id =di.row_id
   AND di.source_id = CASE
                          WHEN si.grand_parent_incident_id = 'UNSPECIFIED' THEN 0
                          ELSE si.source_id
                      END)A  
       LEFT JOIN intuit_mdwdb.d_incident d1 ON d1.row_id = A.row_id
AND d1.source_id = A.source_id
where  d1.grand_parent_incident_key <> A.row_key 


d_incident_incident_number_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.incident_number' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.incident_final SRC 
 LEFT JOIN intuit_mdwdb.d_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( SRC.number,'')<> COALESCE(TRGT.incident_number ,'')
 


d_incident_knowledge_flag_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.knowledge_flag' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.incident_final SRC 
 LEFT JOIN intuit_mdwdb.d_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE ( CASE WHEN SRC.knowledge = 1 then 'Y' else 'N' END)<> (TRGT.knowledge_flag )
 


d_incident_last_resolved_on_mysql.sql :: 


SELECT CASE WHEN cnt> 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_incident.last_resolved_on' ELSE 'data matched' END as
 Message  from (
select count(1) as cnt  FROM intuit_mdsdb.incident_final SRC  LEFT JOIN intuit_mdwdb.d_incident TRGT  
ON (SRC.sys_id =TRGT.row_id   AND SRC.sourceinstance= TRGT.source_id  )
left join intuit_mdwdb.f_incident f on f.incident_key=TRGT.row_key
JOIN intuit_mdwdb.d_lov_map dlm 
ON f.state_src_key = dlm.src_key
 WHERE 
case when
 dlm.dimension_wh_code = 'RESOLVED' then 
 convert_tz(SRC.resolved_at,"GMT","America/Los_Angeles") else null end 
<> TRGT.last_resolved_on)x
 


d_incident_major_incident_flag_mysql.sql :: 



SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from intuit_mdsdb.incident_final a
left join intuit_mdwdb.d_incident c 
on  a.sys_id = c.ROW_ID and a.sourceinstance=c.source_id
where c.major_incident_flag <> CASE WHEN a.u_major_incident=1 THEN 'Y' ELSE 'N'END) g 


d_incident_met_sla_flag_mysql.sql :: 


SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_problem.met_sla_flag' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.incident_final SRC 
 LEFT JOIN intuit_mdwdb.d_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE ( CASE WHEN made_sla = 1 then 'Y' else 'N' END)<> (TRGT.met_sla_flag )
 


d_incident_multiple_assignment_flag_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.multiple_assignment_flag' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.incident_final SRC 
 LEFT JOIN intuit_mdwdb.d_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE ( CASE WHEN SRC.reassignment_count >= 1 then 'Y' else 'N' END)<> (TRGT.multiple_assignment_flag )
 


d_incident_multiple_categorization_flag_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'SRCAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH daTRGT validation SRCailed SRCor d_incident.MULTIPLE_CATEGORIZATION_SRCLAG' ELSE 'SUCCESS' END as Message
FROM intuit_mdwdb.d_incident SRC
JOIN intuit_mdwdb.f_t_task_activity TRGT
 ON SRC.row_id = TRGT.row_id and SRC.source_id = TRGT.source_id  and TRGT.task_wh_type = 'incident' 
and TRGT.task_attribute_wh_name =  'category'   and 
 TRGT.task_attribute_wh_new_value <> TRGT.task_attribute_wh_old_value


 


d_incident_opened_on_mysql.sql :: 


SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.opened_on' ELSE 'SUCCESS' END as Message  FROM intuit_mdsdb.incident_final SRC  LEFT JOIN intuit_mdwdb.d_incident TRGT  ON (SRC.sys_id =TRGT.row_id   AND SRC.sourceinstance= TRGT.source_id  ) WHERE convert_tz(SRC.opened_at,"GMT","America/Los_Angeles")<> TRGT.opened_on 
 


d_incident_over_due_flag_mysql.sql :: 


SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.over_due_flag' ELSE 'SUCCESS' END as Message from (
 select ( CASE WHEN  due_date < CONVERT_TZ((SELECT MAX(lastupdated) AS lastupdated
FROM intuit_mdwdb.d_o_data_freshness WHERE sourcename like 'ServiceNow%'),"America/Los_Angeles","GMT") and TRGT.active_flag='Y' then 'Y' else 'N' END)abc, 
(TRGT.over_due_flag )def
 FROM intuit_mdsdb.incident_final SRC 
LEFT JOIN intuit_mdwdb.d_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE due_date is not null and active_flag='Y'
 )a
 WHERE abc<>def 


d_incident_parent_incident_key_mysql.sql :: 


SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.parent_incident_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.incident_final SRC 
 LEFT JOIN intuit_mdwdb.d_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 JOIN intuit_mdwdb.d_incident LKP 
 ON ( SRC.parent_incident= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.parent_incident IS NULL THEN 0 else -1 end)<>(TRGT.parent_incident_key)
 


d_incident_priority_escalated_flag_mysql.sql :: 



SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_request_item.priority_escalated_flag' ELSE 'SUCCESS' END as Message from (
select case when locate('Y',b.res)>0 then 'Y' else 'N' end as priority_escalation,c.sys_id,
d.priority_escalated_flag as target from (
select group_concat(a.flag) as res,a.documentkey from (
select case when newvalue<oldvalue then 'Y' else 'N' end as flag,documentkey from intuit_mdsdb.sys_audit_final 
 where
tablename = 'incident' 
AND fieldname =  'priority' and oldvalue is not null and newvalue is not null
)a group by a.documentkey
)b
 join intuit_mdsdb.incident_final c on b.documentkey=c.sys_id
join intuit_mdwdb.d_incident d on c.sys_id = d.row_id and c.sourceinstance = d. source_id
) e where priority_escalation<>target



 


d_incident_problem_flag_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.problem_flag' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.incident_final SRC 
 LEFT JOIN intuit_mdwdb.d_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE ( CASE WHEN SRC.problem_id is not null then 'Y' else 'N' END)<> (TRGT.problem_flag )
 


d_incident_reopened_flag_mysql.sql :: 


SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.reopened_flag' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.incident_final SRC 
 LEFT JOIN intuit_mdwdb.d_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE ( CASE WHEN SRC.reopen_count > 0 then 'Y' else 'N' END)<> (TRGT.reopened_flag )
 


d_incident_row_id_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.row_id' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.incident_final SRC 
 LEFT JOIN intuit_mdwdb.d_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( SRC.sys_id,'')<> COALESCE(TRGT.row_id ,'')
 


d_incident_short_description_mysql.sql :: 



  SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.short_description' ELSE 'SUCCESS' END as Message
 FROM 
 intuit_mdsdb.incident_final SRC 
 LEFT JOIN intuit_mdwdb.d_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE length(SRC.short_description)<=255 and SRC.short_description<>TRGT.short_description 


d_incident_source_id_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.source_id' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.incident_final SRC 
 LEFT JOIN intuit_mdwdb.d_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( SRC.sourceinstance,'')<> COALESCE(TRGT.source_id ,'')
 


f_incident_age_close_resolved_mysql.sql :: 


/*If there is a data mismatch failure , please check for the Daylight Savings time of the particular year  and if it falls then 
this is not an issue or data mismatch else investigate.
*/
 select CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_incident.age' ELSE 'SUCCESS' END as Message
from
(
select count(1) as cnt FROM (select * from intuit_mdsdb.incident_final where opened_at < coalesce(resolved_at,closed_at)) SRC 
  join intuit_mdwdb.f_incident f ON (SRC.sys_id =f.row_id  
 AND SRC.sourceinstance= f.source_id  )
JOIN intuit_mdwdb.d_lov_map br ON f.state_src_key = br.src_key
AND br.dimension_wh_code IN ('RESOLVED','CLOSED')
JOIN intuit_mdwdb.d_incident a ON a.row_key = f.incident_key
AND f.source_id = a.source_id
WHERE
timestampdiff(DAY, SRC.opened_at, coalesce(SRC.resolved_at, SRC.closed_at)) <> f.age
  )a
  
   


f_incident_age_key_mysql.sql :: 



 select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.age_key' ELSE 'SUCCESS' END as Message
from intuit_mdwdb.f_incident f  
LEFT JOIN intuit_mdwdb.d_lov L  
ON ((f.age BETWEEN L.lower_range_value AND L.upper_range_value)
	AND L.dimension_class = 'AGEBUCKET_WH~INCIDENT' )
WHERE (L.row_key )  <> f.age_key
 


f_incident_age_open_mysql.sql :: 


 select CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_incident.age' ELSE 'SUCCESS' END as Message

from
(select count(1) cnt FROM (select sys_id,sourceinstance,opened_at from intuit_mdsdb.incident_final where opened_at < coalesce(resolved_at,closed_at)) SRC 
  join intuit_mdwdb.f_incident f ON (SRC.sys_id =f.row_id  
 AND SRC.sourceinstance= f.source_id and f.soft_deleted_flag='N' )

JOIN intuit_mdwdb.d_lov_map br ON f.state_src_key = br.src_key
AND br.dimension_wh_code = 'OPEN' and br.dimension_class = 'STATE~INCIDENT'

WHERE TIMESTAMPDIFF(DAY,SRC.opened_at,(SELECT CONVERT_TZ(MAX(lastupdated),"America/Los_Angeles","GMT") AS lastupdated FROM intuit_mdwdb.d_o_data_freshness WHERE sourcename like 'ServiceNow%'))<> f.age

 )A 


f_incident_assigned_to_key_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.assigned_to_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.incident_final SRC 
 LEFT JOIN intuit_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN intuit_mdwdb.d_internal_contact LKP 
 ON ( concat('INTERNAL_CONTACT~',assigned_to)= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id ) and TRGT.pivot_date between effective_from and effective_to
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.assigned_to IS NULL THEN 0 else -1 end)<> (TRGT.assigned_to_key)
 


f_incident_assignment_group_key_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.assignment_group_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.incident_final SRC 
 LEFT JOIN intuit_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN intuit_mdwdb.d_internal_organization LKP 
 ON ( concat('GROUP~',SRC.assignment_group )= LKP.row_id
AND SRC.sourceinstance= LKP.source_id ) and TRGT.pivot_date between effective_from and effective_to
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.assignment_group IS NULL THEN 0 else -1 end)<> (TRGT.assignment_group_key)
 


f_incident_category_src_code_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.category_src_code' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.incident_final SRC 
 LEFT JOIN intuit_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( SRC.category,'')<> COALESCE(TRGT.category_src_code ,'')
 


f_incident_category_src_key_mysql.sql :: 




SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_incident.category_src_key' ELSE 'SUCCESS' END as Message from (
select count(1) as cnt   
FROM intuit_mdsdb.incident_final SRC 
LEFT JOIN intuit_mdwdb.d_lov LKP 
 ON LKP.dimension_class like '%CATEGORY~INCIDENT%' and
  concat('CATEGORY~INCIDENT~~~',upper(category ))=  LKP.src_rowid 
AND SRC.sourceinstance= LKP.source_id 
 LEFT JOIN intuit_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  ) and TRGT.pivot_date between effective_from and effective_to
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.category IS NULL THEN 0 else -1 end)<> (TRGT.category_src_key))a 


f_incident_caused_by_change_key_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.caused_by_change_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.incident_final SRC 
 LEFT JOIN intuit_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN intuit_mdwdb.d_change_request LKP 
 ON ( SRC.caused_by= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.caused_by IS NULL THEN 0 else -1 end)<> (TRGT.caused_by_change_key)
 


f_incident_change_request_key_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.change_request_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.incident_final SRC 
 LEFT JOIN intuit_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN intuit_mdwdb.d_change_request LKP 
 ON ( SRC.rfc= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.rfc IS NULL THEN 0 else -1 end)<> (TRGT.change_request_key)
 


f_incident_changed_by_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.changed_by' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.incident_final SRC 
 LEFT JOIN intuit_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( SRC.sys_updated_by,'')<> COALESCE(TRGT.changed_by ,'')
 


f_incident_changed_on_mysql.sql :: 


SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.changed_on' ELSE 'SUCCESS' END as Message  FROM intuit_mdsdb.incident_final SRC  LEFT JOIN intuit_mdwdb.f_incident TRGT  ON (SRC.sys_id =TRGT.row_id   AND SRC.sourceinstance= TRGT.source_id  ) WHERE convert_tz(SRC.sys_updated_on,"GMT","America/Los_Angeles")<> TRGT.changed_on 
 


f_incident_close_code_src_code_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.close_code_src_code' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.incident_final SRC 
 LEFT JOIN intuit_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( SRC.close_code,'')<> COALESCE(TRGT.close_code_src_code ,'')
 


f_incident_close_code_src_key_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.close_code_src_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.incident_final SRC 
 LEFT JOIN intuit_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN intuit_mdwdb.d_lov LKP 
 ON LKP.dimension_class like '%CLOSE_CODE~INCIDENT%' and 
 concat('CLOSE_CODE~INCIDENT~~~',upper(close_code))= (LKP.src_rowid)
AND SRC.sourceinstance= LKP.source_id 
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.close_code IS NULL THEN 0 else -1 end)<> (TRGT.close_code_src_key) 


f_incident_closed_by_key_mysql.sql :: 


 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.closed_by_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.incident_final SRC 
 LEFT JOIN intuit_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
  LEFT JOIN intuit_mdwdb.d_lov_map dlm 
ON TRGT.state_src_key = dlm.src_key AND dlm.dimension_wh_code = 'CLOSED'
LEFT JOIN intuit_mdwdb.d_internal_contact LKP 
 ON ( concat('INTERNAL_CONTACT~',closed_by)= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id 
AND COALESCE(CONVERT_TZ (SRC.opened_at,"GMT","America/Los_Angeles"), CONVERT_TZ (coalesce(SRC.closed_at,SRC.sys_updated_on),"GMT","America/Los_Angeles")BETWEEN LKP.effective_from AND LKP.effective_to) )

 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.closed_by IS NULL THEN 0 else -1 end)<> (TRGT.closed_by_key) ;
  


f_incident_closed_on_key_mysql.sql :: 


SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.closed_on_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.incident_final SRC
 LEFT JOIN intuit_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
  JOIN intuit_mdwdb.d_lov_map dlm 
ON TRGT.state_src_key = dlm.src_key   and dlm.dimension_wh_code = 'CLOSED' and dimension_class ='STATE~INCIDENT'
LEFT JOIN intuit_mdwdb.d_calendar_date LKP 
on (LKP.row_id = date_format(convert_tz(coalesce(SRC.closed_at,sys_updated_on),"GMT","America/Los_Angeles"),'%Y%m%d') and LKP.source_id=0
)
WHERE  case when dlm.dimension_wh_code = 'CLOSED' then (LKP.row_key) else null end <> (TRGT.closed_on_key)



 


f_incident_company_key_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.company_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.incident_final SRC 
 LEFT JOIN intuit_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN intuit_mdwdb.d_internal_organization LKP 
 ON ( concat('SUBSIDIARY~',company)= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id ) and TRGT.pivot_date between effective_from and effective_to
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.company IS NULL THEN 0 else -1 end)<> (TRGT.company_key)
 


f_incident_configuration_item_key_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.configuration_item_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.incident_final SRC 
 LEFT JOIN intuit_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN intuit_mdwdb.d_configuration_item LKP 
 ON ( SRC.cmdb_ci= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.cmdb_ci IS NULL THEN 0 else -1 end)<> (TRGT.configuration_item_key)
 


f_incident_created_by_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.created_by' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.incident_final SRC 
 LEFT JOIN intuit_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( SRC.sys_created_by,'')<> COALESCE(TRGT.created_by ,'')
 


f_incident_created_on_mysql.sql :: 


SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.created_on' ELSE 'SUCCESS' END as Message  FROM intuit_mdsdb.incident_final SRC  LEFT JOIN intuit_mdwdb.f_incident TRGT  ON (SRC.sys_id =TRGT.row_id   AND SRC.sourceinstance= TRGT.source_id  ) WHERE convert_tz(SRC.sys_created_on,"GMT","America/Los_Angeles")<> TRGT.created_on 
 


f_incident_customer_key_mysql.sql :: 


SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.customer_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.incident_final SRC 
 LEFT JOIN intuit_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN intuit_mdwdb.d_organization_customer LKP 
 ON ( concat('ORG_CUST~',company)= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.company IS NULL THEN 0 else -1 end)<> (TRGT.customer_key)

 


f_incident_domain_key_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.domain_key' ELSE 'SUCCESS' END as Message from(
select 
COALESCE(LKP.row_key,CASE WHEN SRC.sys_domain IS NULL THEN 0 else -1 end)abc, (TRGT.domain_key)def
 FROM intuit_mdsdb.incident_final SRC 
 LEFT JOIN intuit_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN intuit_mdwdb.d_domain LKP 
 ON ( SRC.sys_domain= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id ))a
 WHERE abc<>def
 


f_incident_dormancy_age_mysql.sql :: 


 select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.dormancy_age' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.incident_final SRC 
 LEFT JOIN intuit_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id 
 AND SRC.sourceinstance= TRGT.source_id )
 left join intuit_mdwdb.d_lov_map lm 
 ON (lm.src_key = TRGT.state_src_key)
 where lm.dimension_class = 'STATE~INCIDENT'
AND  lm.dimension_wh_code = 'OPEN'  
AND COALESCE(TIMESTAMPDIFF(DAY,SRC.sys_updated_on,CONVERT_TZ((SELECT MAX(lastupdated) AS lastupdated
FROM intuit_mdwdb.d_o_data_freshness WHERE sourcename like 'ServiceNow%'),"America/Los_Angeles","GMT")),0)<> TRGT.dormancy_age 
 
 

 


f_incident_dormancy_age_resolved_closed_mysql.sql :: 


 select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.dormancy_age' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.incident_final SRC 
 LEFT JOIN intuit_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id 
 AND SRC.sourceinstance= TRGT.source_id )
 left join intuit_mdwdb.d_lov_map lm 
 ON (lm.src_key = TRGT.state_src_key)
 where lm.dimension_class = 'STATE~INCIDENT'
AND  lm.dimension_wh_code in  ('RESOLVED','CLOSED')
AND 0<> TRGT.dormancy_age 
 


f_incident_due_on_key_mysql.sql :: 


SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.due_on_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.incident_final SRC
 LEFT JOIN intuit_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN intuit_mdwdb.d_calendar_date LKP 
on (LKP.row_id = date_format(convert_tz(SRC.due_date,"GMT","America/Los_Angeles"),'%Y%m%d')  and LKP.source_id=0
)
WHERE coalesce(LKP.row_key,case when SRC.due_date is null then 0 else -1 end ) <> (TRGT.due_on_key)
 


f_incident_grand_parent_incident_key_mysql.sql :: 



SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.grand_parent_incident_key' ELSE 'SUCCESS' END as Message
from (
SELECT CASE
              WHEN si.grand_parent_incident_id ='UNSPECIFIED' THEN 0
              ELSE (di.row_key)
          END AS row_key,
          si.row_id AS row_id,
          si.source_id,
    COALESCE(di.grand_parent_incident_key,'') as grand_parent_incident_key
   FROM (select 
COALESCE(parent_i.parent_incident,'UNSPECIFIED') as grand_parent_incident_id
,i.SourceInstance as source_id
,i.sys_id as row_id
FROM intuit_mdsdb.incident_final i
LEFT JOIN intuit_mdsdb.incident_final parent_i
ON i.parent_incident=parent_i.sys_id)si
   LEFT JOIN intuit_mdwdb.d_incident di ON si.grand_parent_incident_id =di.row_id
   AND di.source_id = CASE
                          WHEN si.grand_parent_incident_id = 'UNSPECIFIED' THEN 0
                          ELSE si.source_id
                      END)A  
       LEFT JOIN intuit_mdwdb.f_incident d1 ON d1.row_id = A.row_id
AND d1.source_id = A.source_id
where  d1.grand_parent_incident_key <> A.row_key
 


f_incident_impact_src_code_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.impact_src_code' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.incident_final SRC 
 LEFT JOIN intuit_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( SRC.impact,'')<> COALESCE(TRGT.impact_src_code ,'')
 


f_incident_impact_src_key_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.impact_src_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.incident_final SRC 
 LEFT JOIN intuit_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN intuit_mdwdb.d_lov LKP 
 ON ( concat('IMPACT','~','TASK','~','~','~',upper(impact))= LKP.src_rowid 
AND SRC.sourceinstance= LKP.source_id ) and TRGT.pivot_date between effective_from and effective_to
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.impact IS NULL THEN 0 else -1 end)<> (TRGT.impact_src_key)
 


f_incident_incident_key_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.incident_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.incident_final SRC 
 LEFT JOIN intuit_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN intuit_mdwdb.d_incident LKP 
 ON ( SRC.sys_id= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id and LKP.soft_deleted_flag='N' )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.sys_id IS NULL THEN 0 else -1 end)<> (TRGT.incident_key)
 


f_incident_incident_number_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.incident_number' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.incident_final SRC 
 LEFT JOIN intuit_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( SRC.number,'')<> COALESCE(TRGT.incident_number ,'')
 


f_incident_last_resolved_by_key_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt from
 intuit_mdsdb.incident_final x  left outer join 
intuit_mdwdb.d_internal_contact y on 
CONCAT('INTERNAL_CONTACT~',x.resolved_by)=row_id  AND sourceinstance= source_id 
 JOIN   intuit_mdwdb.f_incident B on x.sourceinstance=B.source_id AND B.ROW_ID=SYS_ID
WHERE y.row_key<> B.last_resolved_by_key)E; 
 


f_incident_last_resolved_on_key_mysql.sql :: 



SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select COUNT(1) cnt from(
SELECT A.SYS_ID,B.ROW_ID,
B.  last_resolved_on_key B_last_resolved_on_key ,
case when year <2000 then A.last_resolved_on_key+20000000 else A.last_resolved_on_key 
end as  A_last_resolved_on_key from
(SELECT SYS_ID,sourceinstance, 
DATE_FORMAT(CONVERT_TZ(coalesce(resolved_at,closed_at,sys_updated_on),"GMT","America/Los_Angeles"),'%Y')  AS   year,
DATE_FORMAT(CONVERT_TZ(coalesce(resolved_at,closed_at,sys_updated_on),"GMT","America/Los_Angeles"),'%Y%m%d')  AS   last_resolved_on_key
FROM intuit_mdsdb.incident_final 

)A
 JOIN  
(SELECT  f.last_resolved_on_key,f.source_id,f.ROW_ID FROM  intuit_mdwdb.f_incident f
join intuit_mdwdb.d_lov_map dlm ON f.state_src_key = dlm.src_key and f.state_src_code=dlm.dimension_code 
where dlm.dimension_class = 'STATE~INCIDENT'
AND dlm.dimension_wh_code IN('RESOLVED','CLOSED')and state_src_code>4
 )B on A.sourceinstance=B.source_id AND B.ROW_ID=SYS_ID)h
WHERE A_last_resolved_on_key<> B_last_resolved_on_key)E;
 


f_incident_location_key_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.location_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.incident_final SRC 
 LEFT JOIN intuit_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN intuit_mdwdb.d_location LKP 
 ON ( SRC.location= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.location IS NULL THEN 0 else -1 end)<> (TRGT.location_key)
 


f_incident_open_to_close_duration_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.open_to_close_duration' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.incident_final SRC
 LEFT JOIN intuit_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 JOIN intuit_mdwdb.d_lov_map MAP ON MAP.SRC_KEY=TRGT.STATE_SRC_KEY
WHERE  TIMESTAMPDIFF(second, SRC.opened_at, SRC.closed_at)<>  TRGT.open_to_close_duration
AND dimension_wh_code = 'CLOSED'


 


f_incident_open_to_resolve_duration_mysql.sql :: 


SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.open_to_resolve_duration' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.incident_final SRC
  JOIN intuit_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN intuit_mdwdb.d_lov_map br 
 ON TRGT.state_src_key = br.src_key
WHERE   br.dimension_wh_code IN ('RESOLVED')
AND TIMESTAMPDIFF(SECOND,SRC.opened_at,coalesce(SRC.resolved_at,SRC.closed_at))  <> TRGT.open_to_resolve_duration;

 


f_incident_opened_by_department_key_mysql.sql :: 


SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem.opened_by_department_key' ELSE 'SUCCESS' END as Message
 
 FROM intuit_mdsdb.incident_final SRC 
left join  intuit_mdsdb.sys_user_final scu on SRC.caller_id = scu.sys_id
 JOIN intuit_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN   intuit_mdwdb.d_internal_organization LKP
 ON ( concat('DEPARTMENT~',scu.department)= LKP.row_id 
 AND scu.sourceinstance= LKP.source_id )

 WHERE COALESCE(LKP.row_key,CASE WHEN (scu.department is  null ) THEN 0 else -1 end)<> (TRGT.opened_by_department_key)  


f_incident_opened_by_key_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from intuit_mdsdb.incident_final a 
left JOIN intuit_mdwdb.f_incident b 
 ON a.sys_id = b.row_id  AND a.sourceinstance = b.source_id 
left join intuit_mdwdb.d_internal_contact   c
on c.row_id = COALESCE(CONCAT('INTERNAL_CONTACT~',a.u_client),'UNSPECIFIED') and a.sourceinstance = c.source_id  
where  c.row_key <> b.opened_by_key
) g 


f_incident_opened_on_key_mysql.sql :: 


SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.opened_on_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.incident_final SRC
 LEFT JOIN intuit_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN intuit_mdwdb.d_calendar_date LKP 
on (LKP.row_id = date_format(convert_tz(SRC.opened_at,"GMT","America/Los_Angeles"),'%Y%m%d')  and LKP.source_id=0
)
WHERE COALESCE(LKP.row_key,case when SRC.opened_at is null then 0 else -1 end ) <> (TRGT.opened_on_key) 
 


f_incident_opened_time_key_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.opened_time_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.incident_final SRC
 LEFT JOIN intuit_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN intuit_mdwdb.d_calendar_time LKP 
on (LKP.row_id = date_format(convert_tz(SRC.opened_at,"GMT","America/Los_Angeles"),'%H%i')  and LKP.source_id=0
)
WHERE COALESCE(LKP.row_key,case when SRC.opened_at is null then 0 else -1 end)<>  (TRGT.opened_time_key) 
 


f_incident_parent_incident_key_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.parent_incident_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.incident_final SRC 
 LEFT JOIN intuit_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN intuit_mdwdb.d_incident LKP 
 ON ( SRC.parent_incident= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.parent_incident IS NULL THEN 0 else -1 end)<> (TRGT.parent_incident_key)
 


f_incident_priority_src_code_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.priority_src_code' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.incident_final SRC 
 LEFT JOIN intuit_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( SRC.priority,'')<> COALESCE(TRGT.priority_src_code ,'')
 


f_incident_priority_src_key_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.priority_src_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.incident_final SRC 
 LEFT JOIN intuit_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN intuit_mdwdb.d_lov LKP 
 ON ( concat('PRIORITY','~','TASK','~','~','~',upper(priority))= LKP.src_rowid 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.priority IS NULL THEN 0 else -1 end)<> (TRGT.priority_src_key)
 


f_incident_problem_key_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.problem_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.incident_final SRC 
 LEFT JOIN intuit_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN intuit_mdwdb.d_problem LKP 
 ON ( SRC.problem_id= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.problem_id IS NULL THEN 0 else -1 end)<> (TRGT.problem_key)
 


f_incident_reported_type_src_code_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.reported_type_src_code' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.incident_final SRC 
 LEFT JOIN intuit_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( SRC.contact_type,'')<> COALESCE(TRGT.reported_type_src_code ,'')
 


f_incident_reported_type_src_key_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.reported_type_src_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.incident_final SRC 
 LEFT JOIN intuit_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN intuit_mdwdb.d_lov LKP 
 ON ( concat('CONTACT_TYPE','~','TASK','~','~','~',upper(contact_type))= LKP.src_rowid 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.contact_type IS NULL THEN 0 else -1 end)<> (TRGT.reported_type_src_key)
 


f_incident_resolve_to_close_duration_mysql.sql :: 



SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.resolve_to_close_duration' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.incident_final SRC
 LEFT JOIN intuit_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
  LEFT JOIN intuit_mdwdb.d_lov_map br 
 ON TRGT.state_src_key = br.src_key
WHERE   br.dimension_wh_code IN ('CLOSED') 
AND  TIMESTAMPDIFF(second,SRC.resolved_at,closed_at)
<> TRGT.resolve_to_close_duration
 


f_incident_row_id_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.row_id' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.incident_final SRC 
 LEFT JOIN intuit_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( SRC.sys_id,'')<> COALESCE(TRGT.row_id ,'')
 


f_incident_severity_src_code_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.severity_src_code' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.incident_final SRC 
 LEFT JOIN intuit_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( SRC.severity,'')<> COALESCE(TRGT.severity_src_code ,'')
 


f_incident_severity_src_key_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.severity_src_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.incident_final SRC 
 LEFT JOIN intuit_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN intuit_mdwdb.d_lov LKP 
 ON ( concat('SEVERITY','~','INCIDENT','~','~','~',upper(severity))= LKP.src_rowid 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.severity IS NULL THEN 0 else -1 end)<> (TRGT.severity_src_key)
 


f_incident_source_id_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.source_id' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.incident_final SRC 
 LEFT JOIN intuit_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( SRC.sourceinstance,'')<> COALESCE(TRGT.source_id ,'')
 


f_incident_state_src_code_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.state_src_code' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.incident_final SRC 
 LEFT JOIN intuit_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( SRC.state,'')<> COALESCE(TRGT.state_src_code ,'')
 


f_incident_state_src_key_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.state_src_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.incident_final SRC 
 LEFT JOIN intuit_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN intuit_mdwdb.d_lov LKP 
 ON  LKP.dimension_class like '%STATE~INCIDENT%' and
( concat('STATE~INCIDENT~~~',upper(SRC.state))= LKP.src_rowid 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.state IS NULL THEN 0 else -1 end)<> (TRGT.state_src_key) 


f_incident_sub_category_src_code_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.sub_category_src_code' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.incident_final SRC 
 LEFT JOIN intuit_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( SRC.subcategory,'')<> COALESCE(TRGT.sub_category_src_code ,'')
 


f_incident_sub_category_src_key_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.sub_category_src_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.incident_final SRC 
 LEFT JOIN intuit_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN intuit_mdwdb.d_lov LKP 
 ON ( concat('SUBCATEGORY','~','INCIDENT','~','~','~',upper(subcategory))= LKP.src_rowid 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.subcategory IS NULL THEN 0 else -1 end)<> (TRGT.sub_category_src_key)
 


f_incident_time_worked_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.time_worked' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.incident_final SRC
 LEFT JOIN intuit_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
WHERE  TIMESTAMPDIFF(second,'1970-01-01 00:00:00',SRC.time_worked)<>  COALESCE(TRGT.time_worked,'') 
 


f_incident_urgency_src_code_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.urgency_src_code' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.incident_final SRC 
 LEFT JOIN intuit_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( SRC.urgency,'')<> COALESCE(TRGT.urgency_src_code ,'')
 


f_incident_urgency_src_key_mysql.sql :: 


 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.urgency_src_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.incident_final SRC 
 LEFT JOIN intuit_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN intuit_mdwdb.d_lov LKP 
 ON ( concat('URGENCY','~','TASK','~','~','~',upper(urgency))= LKP.src_rowid 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.urgency IS NULL THEN 0 else -1 end)<> COALESCE(TRGT.urgency_src_key) 
 


d_change_request_active_flag_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_request.active_flag' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.change_request_final SRC 
 LEFT JOIN intuit_mdwdb.d_change_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE ( CASE WHEN  SRC.active= TRUE THEN 'Y' ELSE 'N' END)<> (TRGT.active_flag )
 


d_change_request_approval_on_mysql.sql :: 


SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_request.approved_on' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.change_request_final SRC 
 LEFT JOIN intuit_mdwdb.d_change_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
where COALESCE(CONVERT_TZ(SRC.approval_set,"GMT","America/Los_Angeles"),'')
<> TRGT.approval_on;
 
 


d_change_request_change_request_number_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_request.change_request_number' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.change_request_final SRC 
 LEFT JOIN intuit_mdwdb.d_change_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( SRC.number,'')<> COALESCE(TRGT.change_request_number ,'')
 


d_change_request_changed_by_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_request.changed_by' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.change_request_final SRC 
 LEFT JOIN intuit_mdwdb.d_change_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( SRC.sys_updated_by,'')<> COALESCE(TRGT.changed_by ,'')
 


d_change_request_created_by_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_request.created_by' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.change_request_final SRC 
 LEFT JOIN intuit_mdwdb.d_change_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( SRC.sys_created_by,'')<> (TRGT.created_by)
 


d_change_request_description_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_request.description' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.change_request_final SRC 
 LEFT JOIN intuit_mdwdb.d_change_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( SRC.description,'')<> COALESCE(TRGT.description ,'')
 


d_change_request_due_on_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_request.due_on' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.change_request_final SRC 
 LEFT JOIN intuit_mdwdb.d_change_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE(CONVERT_TZ(SRC.DUE_DATE,"GMT","America/Los_Angeles"))  <> COALESCE(TRGT.due_on ,'')

 


d_change_request_emergency_flag_mysql.sql :: 


 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_request.emergency_flag' ELSE 'SUCCESS' END as Message
FROM intuit_mdsdb.change_request_final SRC 
 LEFT JOIN intuit_mdwdb.d_change_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE CASE WHEN  SRC.type ='emergency' THEN 'Y' ELSE 'N' END <> TRGT.emergency_flag 


d_change_request_expected_start_on_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_request.expected_start_on' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.change_request_final SRC 
 LEFT JOIN intuit_mdwdb.d_change_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( convert_tz(SRC.expected_start,"GMT","America/Los_Angeles"),'')<> COALESCE(TRGT.expected_start_on ,'')
 


d_change_request_failure_flag_mysql.sql :: 


SELECT CASE 
         WHEN Count(1) > 0 THEN 'FAILURE' 
         ELSE 'SUCCESS' 
       END AS Result, 
       CASE 
         WHEN Count(1) > 0 THEN 
         'MDS to DWH data validation failed for f_change_request.failure_flag' 
         ELSE 'SUCCESS' 
       END AS Message 
FROM   intuit_mdsdb.change_request_final SRC 
       LEFT JOIN intuit_mdwdb.d_change_request TRGT 
              ON ( SRC.sys_id = TRGT.row_id 
                   AND SRC.sourceinstance = TRGT.source_id ) 
       JOIN intuit_mdwdb.d_lov_map br 
         ON (SRC.review_status = br.dimension_code 
            )
WHERE   br.dimension_class = 'REVIEW_STATUS~CHANGE_REQUEST' AND
CASE 
         WHEN br.dimension_wh_code = 'FAIL' 
               THEN 'Y' 
         ELSE 'N' 
       END <> TRGT.failure_flag 
 


d_change_request_grand_parent_change_request_key_mysql.sql :: 


 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.grand_parent_change_request_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.change_request_final SRC
 LEFT JOIN intuit_mdsdb.change_request_final PARENT 
 ON ( SRC.parent=PARENT.sys_id  
 AND SRC.sourceinstance= PARENT.sourceinstance  )
 left join intuit_mdwdb.d_change_request D1
 on D1.row_id =  PARENT.parent  AND D1.source_id = PARENT.sourceinstance
 LEFT JOIN intuit_mdwdb.d_change_request
TRGT 
 ON SRC.sys_id =TRGT.row_id  
 WHERE COALESCE(D1.row_key,CASE WHEN PARENT.parent IS NULL THEN 0 ELSE -1 END )<> TRGT.grand_parent_change_request_key 


d_change_request_knowledge_flag_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_request.knowledge_flag' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.change_request_final SRC 
 LEFT JOIN intuit_mdwdb.d_change_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE ( CASE WHEN  SRC.knowledge= TRUE THEN 'Y' ELSE 'N' END)<> (TRGT.knowledge_flag )
 


d_change_request_met_sla_flag_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_request.met_sla_flag' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.change_request_final SRC 
 LEFT JOIN intuit_mdwdb.d_change_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE ( CASE WHEN  SRC.made_sla= TRUE THEN 'Y' ELSE 'N' END)<> (TRGT.met_sla_flag )
 


d_change_request_not_on_time_flag_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_request.not_on_time_flag' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.change_request_final SRC 
 LEFT JOIN intuit_mdwdb.d_change_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE (CASE WHEN  SRC.closed_at > SRC.end_date THEN 'Y' ELSE 'N' END )<> (TRGT.not_on_time_flag )

 
 


d_change_request_outside_maintenance_schedule_flag_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_request.outside_maintenance_schedule_flag' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.change_request_final SRC 
 LEFT JOIN intuit_mdwdb.d_change_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE ( CASE WHEN  SRC.outside_maintenance_schedule= TRUE THEN 'Y' ELSE 'N' END)<> (TRGT.outside_maintenance_schedule_flag )
 


d_change_request_parent_change_request_key_mysql.sql :: 


SELECT  CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_request.parent_change_request_key' ELSE 'SUCCESS' END as Message
-- COALESCE(PARENT.row_key,CASE WHEN SRC.parent IS NULL THEN 0 ELSE -1 END ) , TRGT.parent_change_request_key
 FROM intuit_mdsdb.change_request_final SRC
  LEFT JOIN (select row_key,row_id,parent_change_request_key from intuit_mdwdb.d_change_request) PARENT 
 ON coalesce(SRC.parent,'UNSPECIFIED')= PARENT.row_id 
 JOIN intuit_mdwdb.d_change_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  ) 
 WHERE COALESCE(PARENT.row_key,CASE WHEN SRC.parent IS NULL THEN 0 ELSE -1 END ) <> TRGT.parent_change_request_key 


d_change_request_production_change_flag_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_request.production_change_flag' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.change_request_final SRC 
 LEFT JOIN intuit_mdwdb.d_change_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE ( CASE WHEN  SRC.production_system= TRUE THEN 'Y' ELSE 'N' END)<> (TRGT.production_change_flag )
 


d_change_request_reschedule_flag_mysql.sql :: 



SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_request.rescheduled_flag' ELSE 'SUCCESS' END as Message
FROM intuit_mdsdb.change_request_final SRC
 LEFT JOIN intuit_mdwdb.d_change_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )

  JOIN intuit_mdwdb.f_change_request TRGT1 

ON (SRC.sys_id =TRGT1.row_id  
 AND SRC.sourceinstance= TRGT1.source_id  )  
where (case when TRGT1.reschedule_count>0  then 'Y' else 'N' end) <>(TRGT.rescheduled_flag) 


d_change_request_row_id_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_request.row_id' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.change_request_final SRC 
 LEFT JOIN intuit_mdwdb.d_change_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( SRC.sys_id,'')<> COALESCE(TRGT.row_id ,'')
 


d_change_request_short_description_mysql.sql :: 


 
 
  SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.short_description' ELSE 'SUCCESS' END as Message
 FROM 
 intuit_mdsdb.change_request_final SRC 
 LEFT JOIN intuit_mdwdb.d_change_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE char_length(SRC.short_description)<=255 and SRC.short_description<>TRGT.short_description 


d_change_request_source_id_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_request.source_id' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.change_request_final SRC 
 LEFT JOIN intuit_mdwdb.d_change_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( SRC.sourceinstance,'')<> COALESCE(TRGT.source_id ,'')
 


d_change_request_unplanned_flag_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_request.unplanned_flag' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.change_request_final SRC 
 LEFT JOIN intuit_mdwdb.d_change_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE CASE WHEN  SRC.`type` = 'Emergency' OR SRC.start_date IS NULL THEN 'Y' ELSE 'N' END<> TRGT.unplanned_flag 
 


f_change_request_actual_duration_mysql.sql :: 


select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.actual_duration' ELSE 'SUCCESS' END as Message
     from intuit_mdsdb.change_request_final SRC left join
        intuit_mdwdb.f_change_request fi on SRC.sys_id=fi.row_id and SRC.sourceinstance=fi.source_id
		    left join intuit_mdwdb.d_lov_map lm 
		ON (lm.src_key = fi.state_src_key) and lm.dimension_wh_code in ('OPEN') 
     
	where case when lm.dimension_wh_code in ('OPEN') 
				then 0
                else  COALESCE(CASE WHEN  SRC.WORK_END <  SRC.WORK_START THEN NULL 
                                -- WHEN TIMESTAMPDIFF(SECOND,SRC.WORK_START, SRC.WORK_END) > 214748364 THEN NULL 
								ELSE TIMESTAMPDIFF(SECOND,SRC.WORK_START, SRC.WORK_END) end ,0)
            end  <> fi.actual_duration 


f_change_request_approval_on_key_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.approved_on_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.change_request_final SRC
 LEFT JOIN intuit_mdwdb.f_change_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN intuit_mdwdb.d_calendar_date LKP 
on (LKP.row_id = date_format(convert_tz(SRC.approval_set,"GMT","America/Los_Angeles"),'%Y%m%d') and LKP.source_id=0)
 WHERE coalesce(LKP.row_key,case when SRC.approval_set is null then 0 else -1 end)<> (TRGT.approval_on_key)
 


f_change_request_approval_state_src_code_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.approval_state_src_code' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.change_request_final SRC 

  JOIN intuit_mdwdb.f_change_request TRGT 

 

 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( SRC.approval,'')<> COALESCE(TRGT.approval_state_src_code ,'')
 


f_change_request_assigned_to_key_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.assigned_to_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.change_request_final SRC
 LEFT JOIN intuit_mdwdb.f_change_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN intuit_mdwdb.d_internal_contact LKP 
 ON ( CONCAT('INTERNAL_CONTACT~',assigned_to)= LKP.row_id 
 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.assigned_to IS NULL THEN 0 else -1 end)<> TRGT.assigned_to_key
 


f_change_request_assignment_group_key_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.assignment_group_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.change_request_final SRC
 LEFT JOIN intuit_mdwdb.f_change_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN intuit_mdwdb.d_internal_organization LKP 
 ON ( COALESCE(CONCAT('GROUP','~',SRC.ASSIGNMENT_GROUP),0)= LKP.row_id 
 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.assignment_group IS NULL THEN 0 else -1 end)<> TRGT.assignment_group_key
 


f_change_request_cab_on_key_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.cab_on_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.change_request_final SRC
  JOIN intuit_mdwdb.f_change_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN intuit_mdwdb.d_calendar_date LKP 
on (LKP.row_id = date_format(convert_tz(SRC.cab_date,"GMT","America/Los_Angeles"),'%Y%m%d') and LKP.source_id=0
 
)
 WHERE coalesce(LKP.row_key,case when SRC.cab_date is null then 0 else -1 end)<> (TRGT.cab_on_key)
 


f_change_request_category_src_code_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.category_src_code' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.change_request_final SRC 

 inner JOIN intuit_mdwdb.f_change_request TRGT 

 

 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE coalesce( SRC.category,'')<> coalesce(TRGT.category_src_code,'')
 


f_change_request_change_request_key_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.change_request_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.change_request_final SRC
 LEFT JOIN intuit_mdwdb.f_change_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN intuit_mdwdb.d_change_request LKP 
 ON ( SRC.sys_id= LKP.row_id 
 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.sys_id IS NULL THEN 0 else -1 end)<> TRGT.change_request_key
 


f_change_request_change_request_number_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.change_request_number' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.change_request_final SRC 

 inner JOIN intuit_mdwdb.f_change_request TRGT 

 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE coalesce( SRC.number,'')<> coalesce(TRGT.change_request_number,'')
 


f_change_request_changed_by_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.changed_by' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.change_request_final SRC 

 inner JOIN intuit_mdwdb.f_change_request TRGT 

 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( SRC.sys_updated_by,'')<> COALESCE(TRGT.changed_by ,'')
 


f_change_request_changed_on_mysql.sql :: 


SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.changed_on' ELSE 'SUCCESS' END as Message FROM intuit_mdsdb.change_request_final SRC   JOIN intuit_mdwdb.f_change_request TRGT  ON (SRC.sys_id =TRGT.row_id   AND SRC.sourceinstance= TRGT.source_id  ) WHERE COALESCE( convert_tz(SRC.sys_updated_on,"GMT","America/Los_Angeles"),'')<> COALESCE(TRGT.changed_on ,'')
 


f_change_request_closed_by_key_mysql.sql :: 


 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.closed_by_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.change_request_final SRC
 LEFT JOIN intuit_mdwdb.f_change_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
    LEFT JOIN intuit_mdwdb.d_lov_map dlm 
ON TRGT.state_src_key = dlm.src_key AND dlm.dimension_wh_code = 'CLOSED'
 LEFT JOIN intuit_mdwdb.d_internal_contact LKP 
 ON ( CONCAT('INTERNAL_CONTACT~',closed_by)= LKP.row_id 
 AND SRC.sourceinstance= LKP.source_id
AND COALESCE(CONVERT_TZ (SRC.opened_at,"GMT","America/Los_Angeles"), CONVERT_TZ (coalesce(SRC.closed_at,SRC.sys_updated_on),"GMT","America/Los_Angeles")BETWEEN LKP.effective_from AND LKP.effective_to) )
 WHERE 
 COALESCE(LKP.row_key,CASE WHEN SRC.closed_by IS NULL THEN 0 else -1 end)<> (TRGT.closed_by_key) 


f_change_request_company_key_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.company_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.change_request_final SRC
 LEFT JOIN intuit_mdwdb.f_change_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN intuit_mdwdb.d_internal_organization LKP 
 ON ( SRC.company= LKP.row_id 
 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.company IS NULL THEN 0 else -1 end)<> (TRGT.company_key)
 


f_change_request_configuration_item_key_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.configuration_item_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.change_request_final SRC
 LEFT JOIN intuit_mdwdb.f_change_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN intuit_mdwdb.d_configuration_item LKP 
 ON ( SRC.cmdb_ci= LKP.row_id 
 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.cmdb_ci IS NULL THEN 0 else -1 end)<> (TRGT.configuration_item_key)
 


f_change_request_created_by_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.created_by' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.change_request_final SRC 

  JOIN intuit_mdwdb.f_change_request TRGT 

 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( SRC.sys_created_by,'')<> COALESCE(TRGT.created_by ,'')
 


f_change_request_created_on_mysql.sql :: 


SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.created_on' ELSE 'SUCCESS' END as Message FROM intuit_mdsdb.change_request_final SRC  inner JOIN intuit_mdwdb.f_change_request TRGT  ON (SRC.sys_id =TRGT.row_id   AND SRC.sourceinstance= TRGT.source_id  ) WHERE COALESCE( convert_tz(SRC.sys_created_on,"GMT","America/Los_Angeles"),'')<> COALESCE(TRGT.created_on ,'')
 


f_change_request_customer_key_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.customer_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.change_request_final SRC
 LEFT JOIN intuit_mdwdb.f_change_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN intuit_mdwdb.d_organization_customer LKP 
 ON CONCAT(company)= LKP.row_id 
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.company IS NULL THEN 0 else -1 end) <> TRGT.customer_key
 
 


f_change_request_domain_key_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.domain_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.change_request_final SRC
 LEFT JOIN intuit_mdwdb.f_change_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN intuit_mdwdb.d_domain LKP 
 ON ( SRC.sys_domain= LKP.row_id 
 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.sys_domain IS NULL THEN 0 else -1 end)<> (TRGT.domain_key)
 


f_change_request_due_on_key_mysql.sql :: 


SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.due_on_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.change_request_final SRC
  JOIN intuit_mdwdb.f_change_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  ) LEFT JOIN intuit_mdwdb.d_calendar_date LKP 
on (LKP.row_id = date_format(convert_tz(SRC.due_date,"GMT","America/Los_Angeles"),'%Y%m%d') and LKP.source_id=0 
)
 WHERE coalesce(LKP.row_key,case when SRC.due_date is null then 0 else -1 end)<> (TRGT.due_on_key)
 


f_change_request_expected_start_on_key_mysql.sql :: 


SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.expected_start_on_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.change_request_final SRC
 LEFT JOIN intuit_mdwdb.f_change_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  ) LEFT JOIN intuit_mdwdb.d_calendar_date LKP 
on (LKP.row_id = date_format(convert_tz(SRC.expected_start,"GMT","America/Los_Angeles"),'%Y%m%d') and LKP.source_id=0 
)
 WHERE coalesce(LKP.row_key,case when SRC.expected_start is null then 0 else -1 end)<> (TRGT.expected_start_on_key)
 


f_change_request_grand_parent_change_request_key_mysql.sql :: 


SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.grand_parent_change_request_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.change_request_final SRC
 LEFT JOIN intuit_mdsdb.change_request_final PARENT 
 ON ( SRC.parent=PARENT.sys_id  
 AND SRC.sourceinstance= PARENT.sourceinstance  )
 left join intuit_mdwdb.d_change_request D1
 on D1.row_id =  PARENT.parent  AND D1.source_id = PARENT.sourceinstance
 LEFT JOIN intuit_mdwdb.f_change_request
TRGT 
 ON SRC.sys_id =TRGT.row_id  
 WHERE COALESCE(D1.row_key,CASE WHEN PARENT.parent IS NULL THEN 0 ELSE -1 END )<> TRGT.grand_parent_change_request_key 


f_change_request_impact_src_code_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.impact_src_code' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.change_request_final SRC 
  JOIN intuit_mdwdb.f_change_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( SRC.impact,'')<> COALESCE(TRGT.impact_src_code ,'')
 


f_change_request_location_key_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.location_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.change_request_final SRC
 LEFT JOIN intuit_mdwdb.f_change_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN intuit_mdwdb.d_location LKP 
 ON ( SRC.location= LKP.row_id 
 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.location IS NULL THEN 0 else -1 end)<> (TRGT.location_key)
 


f_change_request_opened_by_key_mysql.sql :: 


 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.opened_by_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.change_request_final SRC
 LEFT JOIN intuit_mdwdb.f_change_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN intuit_mdwdb.d_internal_contact LKP 
 ON ( CONCAT('INTERNAL_CONTACT~',opened_by)= LKP.row_id 
 AND SRC.sourceinstance= LKP.source_id
AND COALESCE(CONVERT_TZ (SRC.opened_at,"GMT","America/Los_Angeles"), CONVERT_TZ (coalesce(SRC.closed_at,SRC.sys_updated_on),"GMT","America/Los_Angeles")) 
BETWEEN LKP.effective_from AND LKP.effective_to ) 
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.opened_by IS NULL THEN 0 else -1 end)<> (TRGT.opened_by_key) 


f_change_request_opened_on_key_mysql.sql :: 


SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.opened_on_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.change_request_final SRC
  JOIN intuit_mdwdb.f_change_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  ) LEFT JOIN intuit_mdwdb.d_calendar_date LKP 
on (LKP.row_id = date_format(convert_tz(SRC.opened_at,"GMT","America/Los_Angeles"),'%Y%m%d') and LKP.source_id=0 
)
 WHERE COALESCE(LKP.row_key,case when SRC.opened_at is null then 0 else -1 end)<> (TRGT.opened_on_key)
 


f_change_request_parent_change_request_key_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.parent_change_request_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.change_request_final SRC
  JOIN intuit_mdwdb.f_change_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN intuit_mdwdb.d_change_request PARENT 
 ON SRC.parent= PARENT.row_id  AND SRC.sourceinstance= PARENT.source_id
 WHERE COALESCE(PARENT.row_key,CASE WHEN SRC.parent IS NULL THEN 0 ELSE -1 END ) <> TRGT.parent_change_request_key
 


f_change_request_planned_end_on_key_mysql.sql :: 


SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.planned_end_on_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.change_request_final SRC
  JOIN intuit_mdwdb.f_change_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  ) LEFT JOIN intuit_mdwdb.d_calendar_date LKP 
on (LKP.row_id = date_format(convert_tz(SRC.end_date,"GMT","America/Los_Angeles"),'%Y%m%d') and LKP.source_id=0
 
)
 WHERE coalesce(LKP.row_key,case when SRC.end_date is null then 0 else -1 end)<> (TRGT.planned_end_on_key)
 
 
 


f_change_request_planned_start_on_key_mysql.sql :: 


SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.planned_start_on_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.change_request_final SRC
  JOIN intuit_mdwdb.f_change_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 
 LEFT JOIN intuit_mdwdb.d_calendar_date LKP 
on (LKP.row_id = date_format(convert_tz(SRC.start_date,"GMT","America/Los_Angeles"),'%Y%m%d') and LKP.source_id=0
 
)
 WHERE coalesce(LKP.row_key,case when SRC.start_date is null then 0 else -1 end)<> (TRGT.planned_start_on_key)
 


f_change_request_priority_src_code_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.priority_src_code' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.change_request_final SRC 
  JOIN intuit_mdwdb.f_change_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE SRC.priority<> TRGT.priority_src_code
 


f_change_request_priority_src_key_mysql.sql :: 


SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.priority_src_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.change_request_final SRC
 LEFT JOIN intuit_mdwdb.f_change_request TRGT 
 ON (SRC.sys_id ) =(TRGT.row_id ) 
 AND (SRC.sourceinstance )=(TRGT.source_id ) 
 LEFT JOIN intuit_mdwdb.d_lov LKP 
 ON (CONCAT('PRIORITY~CHANGE_REQUEST~~~',UPPER(priority)))= (LKP.src_rowid )
 AND SRC.sourceinstance= LKP.source_id
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.priority IS NULL THEN 0 else -1 end)<> (TRGT.priority_src_key)  


f_change_request_reason_src_key_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.reason_src_key' ELSE 'SUCCESS' END as Message 
from (select COALESCE(LKP.row_key,CASE WHEN SRC.reason IS NULL THEN 0 else '-1' end)abc,
(TRGT.reason_src_key)def
 FROM intuit_mdsdb.change_request_final SRC
  JOIN intuit_mdwdb.f_change_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id )
 LEFT JOIN intuit_mdwdb.d_lov LKP 
 ON ( CONCAT('REASON','~','CHANGE_REQUEST','~','~','~',UPPER(reason))= LKP.src_rowid 
 
AND SRC.sourceinstance= LKP.source_id ))a
 WHERE abc<>def

 


f_change_request_reported_type_src_code_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.reported_type_src_code' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.change_request_final SRC 
 JOIN intuit_mdwdb.f_change_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE SRC.contact_type<> TRGT.reported_type_src_code
 


f_change_request_reported_type_src_key_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.reported_type_src_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.change_request_final SRC
 LEFT JOIN intuit_mdwdb.f_change_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN intuit_mdwdb.d_lov LKP 
 ON ( CONCAT('CONTACT_TYPE','~','CHANGE_REQUEST','~','~','~',UPPER(contact_type))= LKP.src_rowid 
 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.contact_type IS NULL THEN 0 else -1 end)<> (TRGT.reported_type_src_key)
 


f_change_request_requested_by_key_mysql.sql :: 


 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.closed_by_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.change_request_final SRC
 LEFT JOIN intuit_mdwdb.f_change_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN intuit_mdwdb.d_internal_contact LKP 
 ON ( CONCAT('INTERNAL_CONTACT~',requested_by)= LKP.row_id 
 AND SRC.sourceinstance= LKP.source_id
AND COALESCE(CONVERT_TZ (SRC.opened_at,"GMT","America/Los_Angeles"), CONVERT_TZ (coalesce(SRC.closed_at,SRC.sys_updated_on),"GMT","America/Los_Angeles")BETWEEN LKP.effective_from AND LKP.effective_to) )
where COALESCE(LKP.row_key,CASE WHEN SRC.requested_by IS NULL THEN 0 else -1 end) <> (TRGT.requested_by_key) ;

 


f_change_request_review_status_src_code_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.review_status_src_code' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.change_request_final SRC 
  JOIN intuit_mdwdb.f_change_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( SRC.review_status,'')<> TRGT.review_status_src_code
 


f_change_request_risk_src_code_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.risk_src_code' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.change_request_final SRC 

  JOIN intuit_mdwdb.f_change_request TRGT 

 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( SRC.risk,'')<> COALESCE(TRGT.risk_src_code ,'')
 


f_change_request_row_id_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.row_id' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.change_request_final SRC 
 LEFT JOIN intuit_mdwdb.f_change_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( SRC.sys_id,'')<> (TRGT.row_id)
 


f_change_request_scope_src_code_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.scope_src_code' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.change_request_final SRC 
  JOIN intuit_mdwdb.f_change_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE SRC.scope<>TRGT.scope_src_code
 


f_change_request_source_id_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.source_id' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.change_request_final SRC 
  JOIN intuit_mdwdb.f_change_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( SRC.sourceinstance,'')<> COALESCE(TRGT.source_id ,'')
 


f_change_request_state_src_code_mysql.sql :: 


SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.state_src_code' ELSE 'SUCCESS' END as Message
FROM intuit_mdsdb.change_request_final SRC 
 JOIN intuit_mdwdb.f_change_request TRGT 
ON (SRC.sys_id =TRGT.row_id  
AND SRC.sourceinstance= TRGT.source_id  )
WHERE COALESCE( SRC.state,'')<> COALESCE(TRGT.state_src_code ,'')
 


f_change_request_time_worked_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.time_worked' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.change_request_final SRC 
  JOIN intuit_mdwdb.f_change_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',SRC.time_worked),'')<> COALESCE(TRGT.time_worked ,'')
 


f_change_request_type_src_code_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.type_src_code' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.change_request_final SRC 
 LEFT JOIN intuit_mdwdb.f_change_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE SRC.type<> TRGT.type_src_code 

 


f_change_request_urgency_src_code_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.urgency_src_code' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.change_request_final SRC 
 LEFT JOIN intuit_mdwdb.f_change_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( SRC.urgency,'')<> (TRGT.urgency_src_code)
 


f_change_request_work_end_on_key_mysql.sql :: 


SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.work_end_on_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.change_request_final SRC
  JOIN intuit_mdwdb.f_change_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  ) LEFT JOIN intuit_mdwdb.d_calendar_date LKP 
on (LKP.row_id = date_format(convert_tz(SRC.work_end,"GMT","America/Los_Angeles"),'%Y%m%d') and LKP.source_id=0
 
)
 WHERE coalesce(LKP.row_key,case when SRC.work_end is null then 0 else -1 end)<> (TRGT.work_end_on_key)
 


f_change_request_work_start_on_key_mysql.sql :: 


SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.work_start_on_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.change_request_final SRC
  JOIN intuit_mdwdb.f_change_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  ) LEFT JOIN intuit_mdwdb.d_calendar_date LKP 
on (LKP.row_id = date_format(convert_tz(SRC.work_start,"GMT","America/Los_Angeles"),'%Y%m%d') and LKP.source_id=0)
 WHERE coalesce(LKP.row_key,case when SRC.work_start is null then 0 else -1 end )<>(TRGT.work_start_on_key)
 


d_problem_active_flag_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_problem.active_flag' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.problem_final SRC 
 LEFT JOIN intuit_mdwdb.d_problem TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE ( CASE WHEN active = 1 then 'Y' else 'N' END)<> (TRGT.active_flag)
 


d_problem_backlog_flag_mysql.sql :: 


SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_problem.backlog_flag' ELSE 'SUCCESS' END as Message
 FROM  
intuit_mdwdb.d_problem TRGT 
  JOIN  intuit_mdwdb.f_problem TRGTF 
 ON (TRGTF.problem_key =TRGT.row_key
 AND TRGTF.source_id =TRGT.source_id)
JOIN intuit_mdwdb.d_lov_map LM
 on TRGTF.state_src_key = LM.src_key 
WHERE dimension_class='STATE~PROBLEM'  and  CASE WHEN LM.dimension_wh_code IN('OPEN') THEN 'Y' ELSE 'N' END<> (TRGT.backlog_flag)

 


d_problem_change_flag_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_problem.change_flag' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.problem_final SRC 
 LEFT JOIN intuit_mdwdb.d_problem TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE ( CASE WHEN rfc is not null then 'Y' else 'N' END)<> (TRGT.change_flag )
 


d_problem_changed_by_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_problem.changed_by' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.problem_final SRC 
 LEFT JOIN intuit_mdwdb.d_problem TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( SRC.sys_updated_by,'')<> (TRGT.changed_by)
 


d_problem_changed_on_mysql.sql :: 


SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_problem.changed_on' ELSE 'SUCCESS' END as Message  FROM intuit_mdsdb.problem_final SRC  LEFT JOIN intuit_mdwdb.d_problem TRGT  ON (SRC.sys_id =TRGT.row_id   AND SRC.sourceinstance= TRGT.source_id  ) WHERE convert_tz(SRC.sys_updated_on,"GMT","America/Los_Angeles")<> TRGT.changed_on 
 


d_problem_close_notes_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_problem.close_notes' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.problem_final SRC 
 LEFT JOIN intuit_mdwdb.d_problem TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( SRC.close_notes,'')<> COALESCE(TRGT.close_notes ,'')
 


d_problem_closed_on_mysql.sql :: 


SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_problem.closed_on' ELSE 'SUCCESS' END as Message  
FROM intuit_mdsdb.problem_final SRC  LEFT JOIN intuit_mdwdb.d_problem TRGT  ON (SRC.sys_id =TRGT.row_id   AND SRC.sourceinstance= TRGT.source_id  ) WHERE 
coalesce(convert_tz(coalesce(SRC.closed_at,SRC.sys_updated_on),"GMT","America/Los_Angeles"))<> coalesce(TRGT.closed_on) 
 


d_problem_created_by_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_problem.created_by' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.problem_final SRC 
 LEFT JOIN intuit_mdwdb.d_problem TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( SRC.sys_created_by,'')<> COALESCE(TRGT.created_by ,'')
 


d_problem_created_on_mysql.sql :: 


SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_problem.created_on' ELSE 'SUCCESS' END as Message  FROM intuit_mdsdb.problem_final SRC  LEFT JOIN intuit_mdwdb.d_problem TRGT  ON (SRC.sys_id =TRGT.row_id   AND SRC.sourceinstance= TRGT.source_id  ) WHERE convert_tz(SRC.sys_created_on,"GMT","America/Los_Angeles")<> TRGT.created_on 
 


d_problem_description_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_problem.description' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.problem_final SRC 
 LEFT JOIN intuit_mdwdb.d_problem TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( SRC.description,'')<> (TRGT.description)
 


d_problem_domain_key_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_problem.domain_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.problem_final SRC 
 LEFT JOIN intuit_mdwdb.d_problem TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN intuit_mdwdb.d_domain LKP 
 ON ( SRC.sys_domain= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.sys_domain IS NULL THEN 0 else -1 end)<> (TRGT.domain_key)
 


d_problem_due_on_mysql.sql :: 


SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_problem.due_on' ELSE 'SUCCESS' END as Message  FROM intuit_mdsdb.problem_final SRC  LEFT JOIN intuit_mdwdb.d_problem TRGT  ON (SRC.sys_id =TRGT.row_id   AND SRC.sourceinstance= TRGT.source_id  ) WHERE coalesce(convert_tz(SRC.due_date,"GMT","America/Los_Angeles"),-99)<> coalesce(TRGT.due_on,-99)
 


d_problem_knowledge_flag_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_problem.knowledge_flag' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.problem_final SRC 
 LEFT JOIN intuit_mdwdb.d_problem TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE ( CASE WHEN knowledge = 1 then 'Y' else 'N' END)<> (TRGT.knowledge_flag )
 


d_problem_known_error_flag_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_problem.known_error_flag' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.problem_final SRC 
 LEFT JOIN intuit_mdwdb.d_problem TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE ( CASE WHEN known_error= 1 then 'Y' else 'N' END)<> (TRGT.known_error_flag )
 


d_problem_linked_incident_flag_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_problem.linked_incident_flag' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.problem_final SRC 
 LEFT JOIN intuit_mdwdb.d_problem TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE ( SRC.related_incidents )<> (TRGT.linked_incident_count )
 


d_problem_met_sla_flag_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from intuit_mdwdb.f_problem s
left join intuit_mdwdb.d_problem t 
on s.row_id=t.row_id and s.source_id=t.source_id
where t.met_sla_flag <> case when s.state_src_code=4 and s.priority_src_code IN ( '1', '2' )AND Timestampdiff(day, t.opened_on,t.post_mortem_schedule_c) BETWEEN 0 AND 2 
THEN 'Y' ELSE 'N' END
) temp

 


d_problem_multiple_assignment_flag_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_problem.multiple_assignment_flag' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.problem_final SRC 
 LEFT JOIN intuit_mdwdb.d_problem TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE ( CASE WHEN SRC.reassignment_count >= 1 then 'Y' else 'N' END)<> (TRGT.multiple_assignment_flag )

 


d_problem_opened_on_mysql.sql :: 


SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_problem.opened_on' ELSE 'SUCCESS' END as Message  FROM intuit_mdsdb.problem_final SRC  LEFT JOIN intuit_mdwdb.d_problem TRGT  ON (SRC.sys_id =TRGT.row_id   AND SRC.sourceinstance= TRGT.source_id  ) WHERE convert_tz(SRC.opened_at,"GMT","America/Los_Angeles")<> TRGT.opened_on 
 


d_problem_over_due_flag_mysql.sql :: 


SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_request_task.over_due_flag' ELSE 'SUCCESS' END as Message FROM
 (
select 
( CASE WHEN SRC.active = TRUE and SRC.due_date < CONVERT_TZ((SELECT MAX(lastupdated) AS lastupdated
FROM intuit_mdwdb.d_o_data_freshness WHERE sourcename like 'ServiceNow%'),"America/Los_Angeles","GMT")then 'Y' else 'N' END),
 (TRGT.over_due_flag )
from
intuit_mdsdb.problem_final SRC
LEFT JOIN intuit_mdwdb.d_problem TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
WHERE due_date is not  null and 
( CASE WHEN SRC.active = TRUE and SRC.due_date < CONVERT_TZ((SELECT MAX(lastupdated) AS lastupdated
FROM intuit_mdwdb.d_o_data_freshness WHERE sourcename like 'ServiceNow%'),"America/Los_Angeles","GMT") then 'Y' else 'N' END)<>
 (TRGT.over_due_flag )
)a

 


d_problem_priority_escalated_flag_mysql.sql :: 



SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_request_item.priority_escalated_flag' ELSE 'SUCCESS' END as Message from (
select case when locate('Y',b.res)>0 then 'Y' else 'N' end as priority_escalation,c.sys_id,
d.priority_escalated_flag as target from (
select group_concat(a.flag) as res,a.documentkey from (
select case when newvalue<oldvalue then 'Y' else 'N' end as flag,documentkey from intuit_mdsdb.sys_audit_final 
 where
tablename = 'problem' 
AND fieldname =  'priority' and oldvalue is not null and newvalue is not null
)a group by a.documentkey
)b
 join intuit_mdsdb.problem_final c on b.documentkey=c.sys_id
join intuit_mdwdb.d_problem d on c.sys_id = d.row_id and c.sourceinstance = d. source_id
) e where priority_escalation<>target 


d_problem_problem_number_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_problem.problem_number' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.problem_final SRC 
 LEFT JOIN intuit_mdwdb.d_problem TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( SRC.number,'')<> COALESCE(TRGT.problem_number ,'')
 


d_problem_row_id_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_problem.row_id' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.problem_final SRC 
 LEFT JOIN intuit_mdwdb.d_problem TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( SRC.sys_id,'')<> (TRGT.row_id)
 


d_problem_short_description_mysql.sql :: 



 
  SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.short_description' ELSE 'SUCCESS' END as Message
 FROM 
 intuit_mdsdb.problem_final SRC 
 LEFT JOIN intuit_mdwdb.d_problem TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE char_length(SRC.short_description)<=255 and SRC.short_description<>TRGT.short_description 


d_problem_source_id_mysql.sql :: 



SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_problem.source_id' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.problem_final SRC 
 LEFT JOIN intuit_mdwdb.d_problem TRGT 
 ON SRC.sys_id = TRGT.row_id  
 WHERE SRC.sourceinstance<> TRGT.source_id  


f_problem_assigned_to_key_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem.assigned_to_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.problem_final SRC 
 LEFT JOIN intuit_mdwdb.f_problem TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN intuit_mdwdb.d_internal_contact LKP 
 ON ( concat('INTERNAL_CONTACT~',assigned_to)= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.assigned_to IS NULL THEN 0 else -1 end)<> (TRGT.assigned_to_key)
 


f_problem_assignment_group_key_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem.assignment_group_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.problem_final SRC 
 LEFT JOIN intuit_mdwdb.f_problem TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN intuit_mdwdb.d_internal_organization LKP 
 ON ( concat('GROUP~',SRC.assignment_group)= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.assignment_group IS NULL THEN 0 else -1 end)<> (TRGT.assignment_group_key)
 


f_problem_category_src_key_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem.category_src_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.problem_final SRC 
 LEFT JOIN intuit_mdwdb.f_problem TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN intuit_mdwdb.d_lov LKP 
 ON ( concat('CATEGORY~INCIDENT~~~',upper(null))= LKP.src_rowid 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN null IS NULL THEN 0 else -1 end)<> (TRGT.category_src_key)
 


f_problem_change_request_key_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem.change_request_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.problem_final SRC 
 LEFT JOIN intuit_mdwdb.f_problem TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN intuit_mdwdb.d_change_request LKP 
 ON ( SRC.rfc= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.rfc IS NULL THEN 0 else -1 end)<> (TRGT.change_request_key)
 


f_problem_changed_by_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem.changed_by' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.problem_final SRC 
 LEFT JOIN intuit_mdwdb.f_problem TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( SRC.sys_updated_by,'')<> COALESCE(TRGT.changed_by ,'')
 


f_problem_changed_on_mysql.sql :: 


SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem.changed_on' ELSE 'SUCCESS' END as Message  FROM intuit_mdsdb.problem_final SRC  LEFT JOIN intuit_mdwdb.f_problem TRGT  ON (SRC.sys_id =TRGT.row_id   AND SRC.sourceinstance= TRGT.source_id  ) WHERE convert_tz(SRC.sys_updated_on,"GMT","America/Los_Angeles")<> TRGT.changed_on 
 


f_problem_closed_by_key_mysql.sql :: 


SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem.closed_by_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.problem_final SRC 
 LEFT JOIN intuit_mdwdb.f_problem TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
   left join intuit_mdwdb.d_lov_map p
on TRGT.state_src_key=p.src_key and dimension_wh_code='CLOSED'
LEFT JOIN intuit_mdwdb.d_internal_contact LKP 
 ON ( concat('INTERNAL_CONTACT~',closed_by)= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id
AND COALESCE(CONVERT_TZ (SRC.opened_at,"GMT","America/Los_Angeles"), CONVERT_TZ (coalesce(SRC.closed_at,SRC.sys_updated_on),"GMT","America/Los_Angeles")BETWEEN LKP.effective_from AND LKP.effective_to) )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.closed_by IS NULL THEN 0 else -1 end)<> (TRGT.closed_by_key) ;

 


f_problem_closed_on_key_mysql.sql :: 


SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem.closed_on_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.problem_final SRC
 LEFT JOIN intuit_mdwdb.f_problem TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
  JOIN intuit_mdwdb.d_lov_map dlm 
ON TRGT.state_src_key = dlm.src_key
LEFT JOIN intuit_mdwdb.d_calendar_date LKP 
on (LKP.row_id = date_format(convert_tz(coalesce(SRC.closed_at,SRC.sys_updated_on),"GMT","America/Los_Angeles"),'%Y%m%d')  and LKP.source_id=0
)
WHERE case when dlm.dimension_wh_code = 'CLOSED' then (LKP.row_key) else null end <> (TRGT.closed_on_key)

 


f_problem_company_key_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem.company_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.problem_final SRC 
 LEFT JOIN intuit_mdwdb.f_problem TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN intuit_mdwdb.d_internal_organization LKP 
 ON ( concat('SUBSIDIARY~',company)= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.company IS NULL THEN 0 else -1 end)<> (TRGT.company_key)
 


f_problem_configuration_item_key_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem.configuration_item_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.problem_final SRC 
 LEFT JOIN intuit_mdwdb.f_problem TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN intuit_mdwdb.d_configuration_item LKP 
 ON ( SRC.cmdb_ci= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.cmdb_ci IS NULL THEN 0 else -1 end)<> (TRGT.configuration_item_key)
 


f_problem_created_by_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem.created_by' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.problem_final SRC 
 LEFT JOIN intuit_mdwdb.f_problem TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( SRC.sys_created_by,'')<> COALESCE(TRGT.created_by ,'')
 


f_problem_created_on_mysql.sql :: 


SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem.created_on' ELSE 'SUCCESS' END as Message  FROM intuit_mdsdb.problem_final SRC  LEFT JOIN intuit_mdwdb.f_problem TRGT  ON (SRC.sys_id =TRGT.row_id   AND SRC.sourceinstance= TRGT.source_id  ) WHERE convert_tz(SRC.sys_created_on,"GMT","America/Los_Angeles")<> TRGT.created_on 
 


f_problem_domain_key_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem.domain_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.problem_final SRC 
 LEFT JOIN intuit_mdwdb.f_problem TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN intuit_mdwdb.d_domain LKP 
 ON ( SRC.sys_domain= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.sys_domain IS NULL THEN 0 else -1 end)<>(TRGT.domain_key)
 


f_problem_due_on_key_mysql.sql :: 


SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem.due_on_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.problem_final SRC
 LEFT JOIN intuit_mdwdb.f_problem TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN intuit_mdwdb.d_calendar_date LKP 
on (LKP.row_id = date_format(convert_tz(SRC.due_date,"GMT","America/Los_Angeles"),'%Y%m%d')  and LKP.source_id=0
)
WHERE coalesce(LKP.row_key,case when SRC.due_date is null then 0 else -1 end) <> (TRGT.due_on_key)
 


f_problem_impact_src_code_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem.impact_src_code' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.problem_final SRC 
 LEFT JOIN intuit_mdwdb.f_problem TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( SRC.impact,'')<> COALESCE(TRGT.impact_src_code ,'')
 


f_problem_impact_src_key_mysql.sql :: 


SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem.priority_src_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.problem_final SRC 
 LEFT JOIN intuit_mdwdb.f_problem TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN intuit_mdwdb.d_lov LKP 
 ON ( concat('PRIORITY','~','PROBLEM','~','~','~',upper(priority))= LKP.src_rowid 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.priority IS NULL THEN 0 else -1 end)<> (TRGT.priority_src_key) 


f_problem_location_key_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem.location_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.problem_final SRC 
 LEFT JOIN intuit_mdwdb.f_problem TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN intuit_mdwdb.d_location LKP 
 ON ( SRC.location= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.location IS NULL THEN 0 else -1 end)<> (TRGT.location_key)
 


f_problem_opened_by_department_key_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
  FROM (select  count(1) as cnt
  FROM intuit_mdsdb.problem_final p 
 LEFT JOIN intuit_mdsdb.sys_user_final su 
ON p.opened_by=su.sys_id AND p.SourceInstance=su.SourceInstance
 Left join intuit_mdwdb.f_problem sp 
on sp.row_id=p.sys_id and sp.source_id=p.sourceinstance
 left  join intuit_mdwdb.d_internal_organization c 
on concat('DEPARTMENT~',su.department)=c.row_id 
 AND c.source_id =  su.sourceinstance  
 where COALESCE(c.row_key,case when su.department IS NULL then 0 else  -1 end )
<> sp.opened_by_department_key )x 


f_problem_opened_by_key_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem.opened_by_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.problem_final SRC 
 LEFT JOIN intuit_mdwdb.f_problem TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN intuit_mdwdb.d_internal_contact LKP 
 ON ( concat('INTERNAL_CONTACT~',opened_by)= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.opened_by IS NULL THEN 0 else -1 end)<> (TRGT.opened_by_key)
 


f_problem_opened_on_key_mysql.sql :: 


SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem.opened_on_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.problem_final SRC
 LEFT JOIN intuit_mdwdb.f_problem TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN intuit_mdwdb.d_calendar_date LKP 
on (LKP.row_id = date_format(convert_tz(SRC.opened_at,"GMT","America/Los_Angeles"),'%Y%m%d')  and LKP.source_id=0
)
WHERE COALESCE(LKP.row_key,case when SRC.opened_at is null then 0 else -1 end) <> (TRGT.opened_on_key) 
 


f_problem_priority_src_code_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem.priority_src_code' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.problem_final SRC 
 LEFT JOIN intuit_mdwdb.f_problem TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( SRC.priority,'')<> COALESCE(TRGT.priority_src_code ,'')
 


f_problem_priority_src_key_mysql.sql :: 


SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem.impact_src_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.problem_final SRC 
 LEFT JOIN intuit_mdwdb.f_problem TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN intuit_mdwdb.d_lov LKP 
 ON ( concat('IMPACT','~','PROBLEM','~','~','~',upper(impact))= LKP.src_rowid 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.impact IS NULL THEN 0 else -1 end)<> (TRGT.impact_src_key) 


f_problem_problem_key_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem.problem_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.problem_final SRC 
 LEFT JOIN intuit_mdwdb.f_problem TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN intuit_mdwdb.d_problem LKP 
 ON ( SRC.sys_id= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.sys_id IS NULL THEN 0 else -1 end)<> (TRGT.problem_key)
 


f_problem_problem_number_mysql.sql :: 





SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
 from (select count(1) as cnt
 FROM intuit_mdsdb.problem_final SRC 
 JOIN intuit_mdwdb.f_problem TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( SRC.number,'')<> COALESCE(TRGT.problem_number ,''))a
 


f_problem_reported_type_src_code_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem.reported_type_src_code' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.problem_final SRC 
 LEFT JOIN intuit_mdwdb.f_problem TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( SRC.contact_type,'')<> COALESCE(TRGT.reported_type_src_code ,'')
 


f_problem_reported_type_src_key_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem.reported_type_src_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.problem_final SRC 
 LEFT JOIN intuit_mdwdb.f_problem TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN intuit_mdwdb.d_lov LKP 
 ON ( concat('CONTACT_TYPE','~','PROBLEM','~','~','~',upper(contact_type))= LKP.src_rowid 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.contact_type IS NULL THEN 0 else -1 end)<> (TRGT.reported_type_src_key)
 


f_problem_row_id_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem.row_id' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.problem_final SRC 
 LEFT JOIN intuit_mdwdb.f_problem TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( SRC.sys_id,'')<> COALESCE(TRGT.row_id ,'')
 


f_problem_severity_src_key_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem.severity_src_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.problem_final SRC 
 LEFT JOIN intuit_mdwdb.f_problem TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN intuit_mdwdb.d_lov LKP 
 ON ( concat('SEVERITY','~','','~','~','~',upper(null))= LKP.src_rowid 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN null IS NULL THEN 0 else -1 end)<> (TRGT.severity_src_key)
 


f_problem_source_id_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem.source_id' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.problem_final SRC 
 LEFT JOIN intuit_mdwdb.f_problem TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( SRC.sourceinstance,'')<> COALESCE(TRGT.source_id ,'')
 


f_problem_state_src_code_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem.state_src_code' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.problem_final SRC 
 LEFT JOIN intuit_mdwdb.f_problem TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( SRC.problem_state,'')<> COALESCE(TRGT.state_src_code ,'')
 


f_problem_state_src_key_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem.state_src_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.problem_final SRC 
 LEFT JOIN intuit_mdwdb.f_problem TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN intuit_mdwdb.d_lov LKP 
 ON ( concat('STATE','~','PROBLEM','~','~','~',upper(problem_state))= LKP.src_rowid 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.problem_state IS NULL THEN 0 else -1 end)<> (TRGT.state_src_key)
 


f_problem_sub_category_src_key_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem.sub_category_src_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.problem_final SRC 
 LEFT JOIN intuit_mdwdb.f_problem TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN intuit_mdwdb.d_lov LKP 
 ON ( concat('SUBCATEGORY','~','','~','~','~',upper(null))= LKP.src_rowid 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN null IS NULL THEN 0 else -1 end)<> (TRGT.sub_category_src_key)
 


f_problem_time_worked_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem.time_worked' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.problem_final SRC
 LEFT JOIN intuit_mdwdb.f_problem TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
WHERE  TIMESTAMPDIFF(second,'1970-01-01 00:00:00',SRC.time_worked)<>  COALESCE(TRGT.time_worked,'') 
 


f_problem_urgency_src_code_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem.urgency_src_code' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.problem_final SRC 
 LEFT JOIN intuit_mdwdb.f_problem TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( SRC.urgency,'')<> COALESCE(TRGT.urgency_src_code ,'')
 


f_problem_urgency_src_key_mysql.sql :: 


SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem.urgency_src_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.problem_final SRC 
 LEFT JOIN intuit_mdwdb.f_problem TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN intuit_mdwdb.d_lov LKP 
 ON ( concat('URGENCY','~','PROBLEM','~','~','~',upper(urgency))= LKP.src_rowid 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.urgency IS NULL THEN 0 else -1 end)<> (TRGT.urgency_src_key) 


d_problem_task_active_flag_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_problem_task.active_flag' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.problem_task_final SRC 
 LEFT JOIN intuit_mdwdb.d_problem_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE ( CASE WHEN active = 1 then 'Y' else 'N' END)<> (TRGT.active_flag )
 


d_problem_task_backlog_flag_mysql.sql :: 


	SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_problem_task.backlog_flag' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.problem_task_final SRC 
 LEFT JOIN intuit_mdwdb.d_problem_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
  JOIN  intuit_mdwdb.f_problem_task TRGTF 
 ON (TRGTF.problem_task_key =TRGT.row_key
 AND TRGTF.source_id =TRGT.source_id)
  LEFT JOIN intuit_mdwdb.d_lov_map LM
 on TRGTF.state_src_key = LM.src_key 
 WHERE LM.dimension_class='STATE~PROBLEM_TASK' and  
 ( CASE WHEN LM.dimension_wh_code IN ('OPEN')
 THEN 'Y' ELSE 'N' END)<> (TRGT.backlog_flag )

 


d_problem_task_changed_by_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_problem_task.changed_by' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.problem_task_final SRC 
 LEFT JOIN intuit_mdwdb.d_problem_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( SRC.sys_updated_by,'')<> COALESCE(TRGT.changed_by ,'')
 


d_problem_task_changed_on_mysql.sql :: 


SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_problem_task.changed_on' ELSE 'SUCCESS' END as Message  FROM intuit_mdsdb.problem_task_final SRC  LEFT JOIN intuit_mdwdb.d_problem_task TRGT  ON (SRC.sys_id =TRGT.row_id   AND SRC.sourceinstance= TRGT.source_id  ) WHERE convert_tz(SRC.sys_updated_on,"GMT","America/Los_Angeles")<> TRGT.changed_on 
 


d_problem_task_closed_on_mysql.sql :: 


SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1) >0
 THEN 'MDS to DWH data validation failed for d_problem_task.closed_on' ELSE 'SUCCESS' END as Message  
 FROM intuit_mdsdb.problem_task_final SRC  
LEFT JOIN intuit_mdwdb.f_problem_task TRGT 
ON (SRC.sys_id =TRGT.row_id   AND SRC.sourceinstance= TRGT.source_id  ) 
LEFT JOIN intuit_mdwdb.d_problem_task TRGT1
ON (SRC.sys_id =TRGT1.row_id   AND SRC.sourceinstance= TRGT1.source_id  ) 
  left join intuit_mdwdb.d_lov_map lm 
 ON (lm.src_key = TRGT.state_src_key)
 where  lm.dimension_wh_code = 'CLOSED' 
 and convert_tz(SRC.closed_at,"GMT","America/Los_Angeles") <> TRGT1.closed_on  


d_problem_task_created_by_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_problem_task.created_by' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.problem_task_final SRC 
 LEFT JOIN intuit_mdwdb.d_problem_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( SRC.sys_created_by,'')<> COALESCE(TRGT.created_by ,'')
 


d_problem_task_created_on_mysql.sql :: 


SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_problem_task.created_on' ELSE 'SUCCESS' END as Message  FROM intuit_mdsdb.problem_task_final SRC  LEFT JOIN intuit_mdwdb.d_problem_task TRGT  ON (SRC.sys_id =TRGT.row_id   AND SRC.sourceinstance= TRGT.source_id  ) WHERE convert_tz(SRC.sys_created_on,"GMT","America/Los_Angeles")<> TRGT.created_on 
 


d_problem_task_description_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_problem_task.description' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.problem_task_final SRC 
 LEFT JOIN intuit_mdwdb.d_problem_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( SRC.description,'')<> COALESCE(TRGT.description ,'')
 


d_problem_task_domain_key_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_problem_task.domain_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.problem_task_final SRC 
 LEFT JOIN intuit_mdwdb.d_problem_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN intuit_mdwdb.d_domain LKP 
 ON ( SRC.sys_domain= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.sys_domain IS NULL THEN 0 else -1 end)<> (TRGT.domain_key)
 


d_problem_task_due_on_mysql.sql :: 


SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_problem_task.due_on' ELSE 'SUCCESS' END as Message  FROM intuit_mdsdb.problem_task_final SRC  LEFT JOIN intuit_mdwdb.d_problem_task TRGT  ON (SRC.sys_id =TRGT.row_id   AND SRC.sourceinstance= TRGT.source_id  ) WHERE convert_tz(SRC.due_date,"GMT","America/Los_Angeles")<> TRGT.due_on 
 


d_problem_task_knowledge_flag_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_problem_task.knowledge_flag' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.problem_task_final SRC 
 LEFT JOIN intuit_mdwdb.d_problem_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE ( CASE WHEN knowledge = 1 then 'Y' else 'N' END)<> (TRGT.knowledge_flag )
 


d_problem_task_known_error_flag_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_problem_task.known_error_flag' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.problem_task_final SRC 
 
 
 LEFT JOIN intuit_mdsdb.problem_final PRB 
 ON (SRC.problem =PRB.sys_id  
 AND SRC.sourceinstance= PRB.sourceinstance  )
 
 LEFT JOIN intuit_mdwdb.d_problem_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( 
 -- CASE WHEN PRB.known_error= 1 then 'Y' else 
 'N' 
 -- END 
,'')<> COALESCE(TRGT.known_error_flag ,'')
 


d_problem_task_met_sla_flag_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from intuit_mdsdb.problem_task_final a
left join intuit_mdwdb.d_problem_task c 
on  a.sys_id = c.ROW_ID and a.sourceinstance=c.source_id
where 
c.met_sla_flag <> CASE WHEN(IF(a.u_due_date_extended_count > 0, 0, IF (c.closed_on > c.due_on, 0, 1)))=1 THEN 'Y'
ELSE 'N' END
) g 


d_problem_task_multiple_assignment_flag_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_problem_task.multiple_assignment_flag' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.problem_task_final SRC 
 LEFT JOIN intuit_mdwdb.d_problem_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE ( CASE WHEN SRC.reassignment_count >= 1 then 'Y' else 'N' END)<> (TRGT.multiple_assignment_flag )

 


d_problem_task_opened_on_mysql.sql :: 


SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_problem_task.opened_on' ELSE 'SUCCESS' END as Message  FROM intuit_mdsdb.problem_task_final SRC  LEFT JOIN intuit_mdwdb.d_problem_task TRGT  ON (SRC.sys_id =TRGT.row_id   AND SRC.sourceinstance= TRGT.source_id  ) WHERE convert_tz(SRC.opened_at,"GMT","America/Los_Angeles")<> TRGT.opened_on 
 


d_problem_task_over_due_flag_mysql.sql :: 


SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,

 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_request_item.over_due_flag' ELSE 'SUCCESS' END as Message

 FROM  intuit_mdwdb.d_problem_task REQ_ITM 
WHERE  REQ_ITM.over_due_flag <> CASE WHEN (REQ_ITM.active_flag = 'Y') && (REQ_ITM.due_on < (SELECT MAX(lastupdated) AS lastupdated
FROM intuit_mdwdb.d_o_data_freshness WHERE sourcename like 'ServiceNow%')) THEN 'Y' ELSE 'N' END 


d_problem_task_priority_escalated_flag_mysql.sql :: 


SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_request_item.priority_escalated_flag' ELSE 'SUCCESS' END as Message from (
select case when locate('Y',b.res)>0 then 'Y' else 'N' end as priority_escalation,c.sys_id,
d.priority_escalated_flag as target from (
select group_concat(a.flag) as res,a.documentkey from (
select case when newvalue<oldvalue then 'Y' else 'N' end as flag,documentkey from intuit_mdsdb.sys_audit_final 
 where
tablename = 'problem_task' 
AND fieldname =  'priority' and oldvalue is not null and newvalue is not null
)a group by a.documentkey
)b
 join intuit_mdsdb.problem_task_final c on b.documentkey=c.sys_id
join intuit_mdwdb.d_problem_task d on c.sys_id = d.row_id and c.sourceinstance = d. source_id
) e where priority_escalation<>target

 


d_problem_task_problem_task_number_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_problem_task.problem_task_number' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.problem_task_final SRC 
 LEFT JOIN intuit_mdwdb.d_problem_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( SRC.number,'')<> COALESCE(TRGT.problem_task_number ,'')
 


d_problem_task_row_id_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_problem_task.row_id' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.problem_task_final SRC 
 LEFT JOIN intuit_mdwdb.d_problem_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( SRC.sys_id,'')<> COALESCE(TRGT.row_id ,'')
 


d_problem_task_short_description_mysql.sql :: 


 
 
 
 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.short_description' ELSE 'SUCCESS' END as Message
 FROM 
 intuit_mdsdb.problem_task_final SRC 
 LEFT JOIN intuit_mdwdb.d_problem_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE char_length(SRC.short_description)<=255 and SRC.short_description<>TRGT.short_description
  


d_problem_task_source_id_mysql.sql :: 



SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_problem_task.source_id' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.problem_task_final SRC 
 LEFT JOIN intuit_mdwdb.d_problem_task TRGT 
 ON SRC.sys_id =TRGT.row_id  
 
 WHERE SRC.sourceinstance<> TRGT.source_id  


f_problem_task_assigned_to_key_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem_task.assigned_to_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.problem_task_final SRC 
 LEFT JOIN intuit_mdwdb.f_problem_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN intuit_mdwdb.d_internal_contact LKP 
 ON ( concat('INTERNAL_CONTACT~',assigned_to)= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.assigned_to IS NULL THEN 0 else -1 end)<> (TRGT.assigned_to_key)
 


f_problem_task_assignment_group_key_mysql.sql :: 



SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem_task.assignment_group_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.problem_task_final SRC 
 LEFT JOIN intuit_mdwdb.f_problem_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN intuit_mdwdb.d_internal_organization LKP 
 ON ( concat('GROUP~',SRC.assignment_group)= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.assignment_group IS NULL THEN 0 else -1 end)<> (TRGT.assignment_group_key)
 


f_problem_task_category_src_key_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem_task.category_src_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.problem_task_final SRC 
 LEFT JOIN intuit_mdwdb.f_problem_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN intuit_mdwdb.d_lov LKP 
 ON ( concat('CATEGORY','~','','~','~','~',upper(null))= LKP.src_rowid 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN null IS NULL THEN 0 else -1 end)<> (TRGT.category_src_key)
 


f_problem_task_changed_by_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem_task.changed_by' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.problem_task_final SRC 
 LEFT JOIN intuit_mdwdb.f_problem_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( SRC.sys_updated_by,'')<> COALESCE(TRGT.changed_by ,'')
 


f_problem_task_changed_on_mysql.sql :: 


SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem_task.changed_on' ELSE 'SUCCESS' END as Message  FROM intuit_mdsdb.problem_task_final SRC  LEFT JOIN intuit_mdwdb.f_problem_task TRGT  ON (SRC.sys_id =TRGT.row_id   AND SRC.sourceinstance= TRGT.source_id  ) WHERE convert_tz(SRC.sys_updated_on,"GMT","America/Los_Angeles")<> TRGT.changed_on 
 


f_problem_task_closed_by_key_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem_task.closed_by_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.problem_task_final SRC 
 LEFT JOIN intuit_mdwdb.f_problem_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN intuit_mdwdb.d_internal_contact LKP 
 ON ( concat('INTERNAL_CONTACT~',closed_by)= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.closed_by IS NULL THEN 0 else -1 end)<> (TRGT.closed_by_key)
 


f_problem_task_closed_on_key_mysql.sql :: 


SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem_task.closed_on_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.problem_task_final SRC
 LEFT JOIN intuit_mdwdb.f_problem_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
JOIN intuit_mdwdb.d_lov_map dlm 
ON TRGT.state_src_key = dlm.src_key
LEFT JOIN intuit_mdwdb.d_calendar_date LKP 
on (LKP.row_id = date_format(convert_tz(coalesce(SRC.closed_at,SRC.sys_updated_on),"GMT","America/Los_Angeles"),'%Y%m%d')  and LKP.source_id=0
)
WHERE  case when dlm.dimension_wh_code = 'CLOSED' then (LKP.row_key) else null end <> (TRGT.closed_on_key)
 


f_problem_task_company_key_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem_task.company_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.problem_task_final SRC 
 LEFT JOIN intuit_mdwdb.f_problem_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN intuit_mdwdb.d_internal_organization LKP 
 ON ( concat('SUBSIDIARY~',company)= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.company IS NULL THEN 0 else -1 end)<> (TRGT.company_key)
 


f_problem_task_configuration_item_key_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem_task.configuration_item_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.problem_task_final SRC 
 LEFT JOIN intuit_mdwdb.f_problem_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN intuit_mdwdb.d_configuration_item LKP 
 ON ( SRC.cmdb_ci= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.cmdb_ci IS NULL THEN 0 else -1 end)<> (TRGT.configuration_item_key)
 


f_problem_task_created_by_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem_task.created_by' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.problem_task_final SRC 
 LEFT JOIN intuit_mdwdb.f_problem_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( SRC.sys_created_by,'')<> COALESCE(TRGT.created_by ,'')
 


f_problem_task_created_on_mysql.sql :: 


SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem_task.created_on' ELSE 'SUCCESS' END as Message  FROM intuit_mdsdb.problem_task_final SRC  LEFT JOIN intuit_mdwdb.f_problem_task TRGT  ON (SRC.sys_id =TRGT.row_id   AND SRC.sourceinstance= TRGT.source_id  ) WHERE convert_tz(SRC.sys_created_on,"GMT","America/Los_Angeles")<> TRGT.created_on 
 


f_problem_task_domain_key_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem_task.domain_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.problem_task_final SRC 
 LEFT JOIN intuit_mdwdb.f_problem_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN intuit_mdwdb.d_domain LKP 
 ON ( SRC.sys_domain= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.sys_domain IS NULL THEN 0 else -1 end)<> (TRGT.domain_key)
 


f_problem_task_due_on_key_mysql.sql :: 


SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem_task.due_on_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.problem_task_final SRC
 LEFT JOIN intuit_mdwdb.f_problem_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN intuit_mdwdb.d_calendar_date LKP 
on (LKP.row_id = date_format(convert_tz(SRC.due_date,"GMT","America/Los_Angeles"),'%Y%m%d')  and LKP.source_id=0
)
WHERE COALESCE(LKP.row_key,case when SRC.due_date is null then 0 else -1 end) <> (TRGT.due_on_key) 
 


f_problem_task_impact_src_code_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem_task.impact_src_code' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.problem_task_final SRC 
 LEFT JOIN intuit_mdwdb.f_problem_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( SRC.impact,'')<> COALESCE(TRGT.impact_src_code ,'')
 


f_problem_task_impact_src_key_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem_task.impact_src_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.problem_task_final SRC 
 LEFT JOIN intuit_mdwdb.f_problem_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN intuit_mdwdb.d_lov LKP 
 ON ( concat('IMPACT','~','PROBLEM_TASK','~','~','~',upper(impact))= LKP.src_rowid 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.impact IS NULL THEN 0 else -1 end)<> (TRGT.impact_src_key)
 


f_problem_task_location_key_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem_task.location_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.problem_task_final SRC 
 LEFT JOIN intuit_mdwdb.f_problem_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN intuit_mdwdb.d_location LKP 
 ON ( SRC.location= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.location IS NULL THEN 0 else -1 end)<> (TRGT.location_key)
 


f_problem_task_open_to_close_duration_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem_task.open_to_close_duration' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.problem_task_final SRC
 LEFT JOIN intuit_mdwdb.f_problem_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
   LEFT JOIN intuit_mdwdb.d_lov_map dlm 
ON TRGT.state_src_key = dlm.src_key AND dlm.dimension_wh_code = 'CLOSED'
WHERE  TIMESTAMPDIFF(second, opened_at, coalesce(SRC.closed_at,SRC.sys_updated_on))<>  (TRGT.open_to_close_duration) 
 


f_problem_task_opened_by_department_key_mysql.sql :: 


SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem.opened_by_department_key' ELSE 'SUCCESS' END as Message
 
 FROM intuit_mdsdb.problem_task_final SRC 
 LEFT JOIN intuit_mdwdb.f_problem_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN  intuit_mdwdb.d_internal_contact LKP1 
 ON ( concat('INTERNAL_CONTACT~',SRC.opened_by)= LKP1.row_id 
 AND SRC.sourceinstance= LKP1.source_id )
 
 LEFT JOIN   intuit_mdwdb.d_internal_organization LKP
 ON ( concat('DEPARTMENT~',LKP1.department_code)= LKP.row_id 
 AND LKP1.source_id= LKP.source_id )

LEFT JOIN   intuit_mdwdb.d_internal_organization LKP2
 ON ( concat('DEPARTMENT~',SRC.opened_by)= LKP2.row_id 
 AND SRC.sourceinstance= LKP2.source_id )
 and LKP.row_id  is null 
 
 WHERE COALESCE(LKP.row_key,LKP2.row_key,CASE WHEN (SRC.opened_by is not null and LKP1.department_code IS NULL 
 or SRC.opened_by is  null)
 THEN 0 else -1 end)<> (TRGT.opened_by_department_key)
 


f_problem_task_opened_by_key_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem_task.opened_by_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.problem_task_final SRC 
 LEFT JOIN intuit_mdwdb.f_problem_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN intuit_mdwdb.d_internal_contact LKP 
 ON ( concat('INTERNAL_CONTACT~',opened_by)= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.opened_by IS NULL THEN 0 else -1 end)<> (TRGT.opened_by_key)
 


f_problem_task_opened_on_key_mysql.sql :: 


SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem_task.opened_on_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.problem_task_final SRC
 LEFT JOIN intuit_mdwdb.f_problem_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN intuit_mdwdb.d_calendar_date LKP 
on (LKP.row_id = date_format(convert_tz(SRC.opened_at,"GMT","America/Los_Angeles"),'%Y%m%d')  and LKP.source_id=0
)
WHERE COALESCE(LKP.row_key,case when SRC.opened_at is null then 0 else -1 end) <> (TRGT.opened_on_key) 
 


f_problem_task_opened_time_key_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem_task.opened_time_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.problem_task_final SRC
 LEFT JOIN intuit_mdwdb.f_problem_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )

LEFT JOIN intuit_mdwdb.d_calendar_time LKP 
on (LKP.row_id = date_format(convert_tz(SRC.opened_at,"GMT","America/Los_Angeles"),'%H%i')  and LKP.source_id=0
)
WHERE COALESCE(LKP.row_key,case when SRC.opened_at is null then 0 else -1 end)<>  TRGT.opened_time_key
 


f_problem_task_priority_src_code_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem_task.priority_src_code' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.problem_task_final SRC 
 LEFT JOIN intuit_mdwdb.f_problem_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( SRC.priority,'')<> COALESCE(TRGT.priority_src_code ,'')
 


f_problem_task_priority_src_key_mysql.sql :: 


SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem_task.priority_src_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.problem_task_final SRC 
 LEFT JOIN intuit_mdwdb.f_problem_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN intuit_mdwdb.d_lov LKP 
 ON ( concat('PRIORITY','~','PROBLEM_TASK','~','~','~',upper(priority))= LKP.src_rowid 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.priority IS NULL THEN 0 else -1 end)<> (TRGT.priority_src_key) 


f_problem_task_problem_key_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem_task.problem_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.problem_task_final SRC 
 LEFT JOIN intuit_mdwdb.f_problem_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN intuit_mdwdb.d_problem LKP 
 ON ( SRC.problem= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.problem IS NULL THEN 0 else -1 end)<> (TRGT.problem_key)
 


f_problem_task_problem_task_key_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem_task.problem_task_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.problem_task_final SRC 
 LEFT JOIN intuit_mdwdb.f_problem_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN intuit_mdwdb.d_problem_task LKP 
 ON ( SRC.sys_id= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.sys_id IS NULL THEN 0 else -1 end)<> (TRGT.problem_task_key)
 


f_problem_task_problem_task_number_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem_task.problem_task_number' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.problem_task_final SRC 
 LEFT JOIN intuit_mdwdb.f_problem_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( SRC.number,'')<> COALESCE(TRGT.problem_task_number ,'')
 


f_problem_task_reported_type_src_code_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem_task.reported_type_src_code' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.problem_task_final SRC 
 LEFT JOIN intuit_mdwdb.f_problem_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( SRC.contact_type,'')<> COALESCE(TRGT.reported_type_src_code ,'')
 


f_problem_task_reported_type_src_key_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem_task.reported_type_src_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.problem_task_final SRC 
 LEFT JOIN intuit_mdwdb.f_problem_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN intuit_mdwdb.d_lov LKP 
 ON ( concat('CONTACT_TYPE','~','PROBLEM_TASK','~','~','~',upper(contact_type))= LKP.src_rowid 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.contact_type IS NULL THEN 0 else -1 end)<> (TRGT.reported_type_src_key)
 


f_problem_task_row_id_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem_task.row_id' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.problem_task_final SRC 
 LEFT JOIN intuit_mdwdb.f_problem_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( SRC.sys_id,'')<> COALESCE(TRGT.row_id ,'')
 


f_problem_task_severity_src_key_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem_task.severity_src_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.problem_task_final SRC 
 LEFT JOIN intuit_mdwdb.f_problem_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN intuit_mdwdb.d_lov LKP 
 ON ( concat('SUBCATEGORY','~','','~','~','~',upper(null))= LKP.src_rowid 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN null IS NULL THEN 0 else -1 end)<> (TRGT.severity_src_key)
 


f_problem_task_source_id_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem_task.source_id' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.problem_task_final SRC 
 LEFT JOIN intuit_mdwdb.f_problem_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( SRC.sourceinstance,'')<> COALESCE(TRGT.source_id ,'')
 


f_problem_task_state_src_code_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem_task.state_src_code' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.problem_task_final SRC 
 LEFT JOIN intuit_mdwdb.f_problem_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( SRC.state,'')<> COALESCE(TRGT.state_src_code ,'')
 


f_problem_task_state_src_key_mysql.sql :: 


SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem_task.state_src_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.problem_task_final SRC 
 LEFT JOIN intuit_mdwdb.f_problem_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN intuit_mdwdb.d_lov LKP 
 ON ( concat('STATE','~','PROBLEM_TASK','~','~','~',upper(state))= LKP.src_rowid 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.state IS NULL THEN 0 else -1 end)<> (TRGT.state_src_key) 


f_problem_task_time_worked_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem_task.time_worked' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.problem_task_final SRC
 LEFT JOIN intuit_mdwdb.f_problem_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
WHERE  TIMESTAMPDIFF(second,'1970-01-01 00:00:00',SRC.time_worked)<>  COALESCE(TRGT.time_worked,'') 
 


f_problem_task_urgency_src_code_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem_task.urgency_src_code' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.problem_task_final SRC 
 LEFT JOIN intuit_mdwdb.f_problem_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( SRC.urgency,'')<> COALESCE(TRGT.urgency_src_code ,'')
 


d_request_item_active_flag_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_request_item.active_flag' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.sc_req_item_final SRC 
  JOIN intuit_mdwdb.d_request_item TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE ( CASE WHEN SRC.active =1 then 'Y' else 'N' END)<> (TRGT.active_flag )
 


d_request_item_backlog_flag_mysql.sql :: 


SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_request_item.backlog_flag' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.sc_req_item_final SRC 
 LEFT JOIN intuit_mdwdb.d_request_item TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
  JOIN  intuit_mdwdb.f_request_item TRGTF 
 ON (TRGTF.request_item_key =TRGT.row_key
 AND TRGTF.source_id =TRGT.source_id)
  LEFT JOIN intuit_mdwdb.d_lov_map LM
 on TRGTF.state_src_key = LM.src_key and LM.dimension_class='STATE~SC_REQ_ITEM'
WHERE ( CASE WHEN LM.dimension_wh_code IN ('OPEN') THEN 'Y' ELSE 'N' END)<> (TRGT.backlog_flag)

 


d_request_item_changed_by_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_request_item.changed_by' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.sc_req_item_final SRC 
 LEFT JOIN intuit_mdwdb.d_request_item TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( SRC.sys_updated_by,'')<> COALESCE(TRGT.changed_by ,'')
 


d_request_item_changed_on_mysql.sql :: 


SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_request_item.changed_on' ELSE 'SUCCESS' END as Message  FROM intuit_mdsdb.sc_req_item_final SRC  LEFT JOIN intuit_mdwdb.d_request_item TRGT  ON (SRC.sys_id =TRGT.row_id   AND SRC.sourceinstance= TRGT.source_id  ) WHERE convert_tz(SRC.sys_updated_on,"GMT","America/Los_Angeles")<> TRGT.changed_on 
 


d_request_item_closed_on_mysql.sql :: 


SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_request_item.closed_on' ELSE 'SUCCESS' END as Message  FROM intuit_mdsdb.sc_req_item_final SRC  
LEFT JOIN intuit_mdwdb.d_request_item TRGT  ON (SRC.sys_id =TRGT.row_id   AND SRC.sourceinstance= TRGT.source_id  ) 
WHERE convert_tz(coalesce(SRC.closed_at,SRC.sys_updated_on),"GMT","America/Los_Angeles")<> TRGT.closed_on 

 


d_request_item_created_by_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_request_item.created_by' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.sc_req_item_final SRC 
 LEFT JOIN intuit_mdwdb.d_request_item TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( SRC.sys_created_by,'')<> COALESCE(TRGT.created_by ,'')
 


d_request_item_created_on_mysql.sql :: 


SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_request_item.created_on' ELSE 'SUCCESS' END as Message  FROM intuit_mdsdb.sc_req_item_final SRC  LEFT JOIN intuit_mdwdb.d_request_item TRGT  ON (SRC.sys_id =TRGT.row_id   AND SRC.sourceinstance= TRGT.source_id  ) WHERE convert_tz(SRC.sys_created_on,"GMT","America/Los_Angeles")<> TRGT.created_on 
 


d_request_item_description_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_request_item.description' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.sc_req_item_final SRC 
 LEFT JOIN intuit_mdwdb.d_request_item TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( SRC.description,'')<> (TRGT.description)
 


d_request_item_domain_key_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_request_item.domain_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.sc_req_item_final SRC 
 LEFT JOIN intuit_mdwdb.d_request_item TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN intuit_mdwdb.d_domain LKP 
 ON ( SRC.sys_domain= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.sys_domain IS NULL THEN 0 else -1 end)<> (TRGT.domain_key)
 


d_request_item_due_on_mysql.sql :: 


SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_request_item.due_on' ELSE 'SUCCESS' END as Message  FROM intuit_mdsdb.sc_req_item_final SRC  LEFT JOIN intuit_mdwdb.d_request_item TRGT  ON (SRC.sys_id =TRGT.row_id   AND SRC.sourceinstance= TRGT.source_id  ) WHERE date(convert_tz(SRC.due_date,"GMT","America/Los_Angeles"))<> date(TRGT.due_on) 


d_request_item_met_sla_flag_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from intuit_mdwdb.d_request_item a 
where   met_sla_flag <>  CASE  WHEN TIMESTAMPDIFF(day, opened_on, closed_on) <= 4 THEN 'Y' 
 ELSE 'N' end
) g 


d_request_item_multiple_assignment_flag_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_request_item.multiple_assignment_flag' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.sc_req_item_final SRC 
 LEFT JOIN intuit_mdwdb.d_request_item TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE ( CASE WHEN SRC.reassignment_count >= 1 then 'Y' else 'N' END)<> (TRGT.multiple_assignment_flag)
 


d_request_item_opened_on_mysql.sql :: 


SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_request_item.opened_on' ELSE 'SUCCESS' END as Message  FROM intuit_mdsdb.sc_req_item_final SRC  LEFT JOIN intuit_mdwdb.d_request_item TRGT  ON (SRC.sys_id =TRGT.row_id   AND SRC.sourceinstance= TRGT.source_id  ) WHERE DATE_FORMAT(convert_tz(SRC.opened_at,"GMT","America/Los_Angeles"),'%Y%m%d')<> DATE_FORMAT(TRGT.opened_on,'%Y%m%d')  


d_request_item_over_due_flag_mysql.sql :: 


SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,

 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_request_item.over_due_flag' ELSE 'SUCCESS' END as Message

 FROM  intuit_mdwdb.d_request_item REQ_ITM 
WHERE  REQ_ITM.over_due_flag <> CASE WHEN (REQ_ITM.active_flag = 'Y') && (REQ_ITM.due_on < (SELECT MAX(lastupdated) AS lastupdated
FROM intuit_mdwdb.d_o_data_freshness WHERE sourcename like 'ServiceNow%')) THEN 'Y' ELSE 'N' END 


d_request_item_priority_escalated_flag_mysql.sql :: 



	SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
	 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_request_item.priority_escalated_flag' ELSE 'SUCCESS' END as Message from (
	select case when locate('Y',b.res)>0 then 'Y' else 'N' end as priority_escalation,c.sys_id,
	d.priority_escalated_flag as target from (
	select group_concat(a.flag) as res,a.documentkey from (
	select case when newvalue<oldvalue then 'Y' else 'N' end as flag,documentkey from intuit_mdsdb.sys_audit_final 
	 where
	tablename = 'sc_req_item' 
	AND fieldname =  'priority' and oldvalue is not null and newvalue is not null
	)a group by a.documentkey
	)b
	 join intuit_mdsdb.sc_req_item_final c on b.documentkey=c.sys_id
	join intuit_mdwdb.d_request_item d on c.sys_id = d.row_id and c.sourceinstance = d. source_id
	) e where priority_escalation<>target

 


d_request_item_request_item_number_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_request_item.request_item_number' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.sc_req_item_final SRC 
 LEFT JOIN intuit_mdwdb.d_request_item TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( SRC.number,'')<> COALESCE(TRGT.request_item_number ,'')
 


d_request_item_short_description_mysql.sql :: 



 
 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.short_description' ELSE 'SUCCESS' END as Message
 FROM 
 intuit_mdsdb.sc_req_item_final SRC 
 LEFT JOIN intuit_mdwdb.d_request_item TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE length(SRC.short_description)<=255 and SRC.short_description<>TRGT.short_description
  


d_request_item_source_id_mysql.sql :: 


SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_request_item.source_id' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.sc_req_item_final SRC 
 LEFT JOIN intuit_mdwdb.d_request_item TRGT 
 ON SRC.sys_id =TRGT.row_id  

 WHERE ( SRC.sourceinstance)<> (TRGT.source_id ) 


f_request_item_approval_state_src_code_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_item.approval_state_src_code' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.sc_req_item_final SRC 
 LEFT JOIN intuit_mdwdb.f_request_item TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( SRC.approval,'')<> COALESCE(TRGT.approval_state_src_code ,'')
 


f_request_item_approval_state_src_key_mysql.sql :: 


SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_item.approval_state_src_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.sc_req_item_final SRC 
 LEFT JOIN intuit_mdwdb.f_request_item TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN intuit_mdwdb.d_lov LKP 
 ON ( concat('APPROVAL','~','SC_REQ_ITEM','~','~','~',upper(approval))= LKP.src_rowid 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.approval IS NULL THEN 0 else -1 end)<> (TRGT.approval_state_src_key) 


f_request_item_assigned_to_key_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_item.assigned_to_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.sc_req_item_final SRC 
 LEFT JOIN intuit_mdwdb.f_request_item TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN intuit_mdwdb.d_internal_contact LKP 
 ON ( concat('INTERNAL_CONTACT~',SRC.assigned_to)= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.assigned_to IS NULL THEN 0 else -1 end)<> (TRGT.assigned_to_key)
 


f_request_item_assignment_group_key_mysql.sql :: 



SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 case when count(1) >0 THEN 'MDS to DWH data validation failed for f_request_item.assignment_group_key' ELSE 'SUCCESS' 
END as Message
from  intuit_mdsdb.sc_req_item_final src
left JOIN intuit_mdwdb.f_request_item trgt
on (src.sys_id =trgt.row_id AND src.sourceinstance= trgt.source_id)
LEFT JOIN intuit_mdwdb.d_internal_organization o
ON  CONCAT('GROUP~', src.assignment_group)= o.row_id and src.sourceinstance=o.source_id
WHERE 
COALESCE(o.row_key,CASE WHEN src.assignment_group IS NULL THEN 0 else -1 end)<> (trgt.assignment_group_key)
; 


f_request_item_business_duration_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_item.business_duration' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.sc_req_item_final SRC
 LEFT JOIN intuit_mdwdb.f_request_item TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
WHERE  TIMESTAMPDIFF(second,'1970-01-01 00:00:00',SRC.business_duration)<>  COALESCE(TRGT.business_duration,'') 
 


f_request_item_catalog_item_key_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_item.catalog_item_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.sc_req_item_final SRC 
 LEFT JOIN intuit_mdwdb.f_request_item TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN intuit_mdwdb.d_master_item LKP 
 ON ( SRC.cat_item= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.cat_item IS NULL THEN 0 else -1 end)<> (TRGT.catalog_item_key)
 


f_request_item_changed_by_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_item.changed_by' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.sc_req_item_final SRC 
 LEFT JOIN intuit_mdwdb.f_request_item TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( SRC.sys_updated_by,'')<> COALESCE(TRGT.changed_by ,'')
 


f_request_item_changed_on_mysql.sql :: 


SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_item.changed_on' ELSE 'SUCCESS' END as Message  FROM intuit_mdsdb.sc_req_item_final SRC  LEFT JOIN intuit_mdwdb.f_request_item TRGT  ON (SRC.sys_id =TRGT.row_id   AND SRC.sourceinstance= TRGT.source_id  ) WHERE convert_tz(SRC.sys_updated_on,"GMT","America/Los_Angeles")<> TRGT.changed_on 
 


f_request_item_closed_by_key_mysql.sql :: 


 

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_item.closed_by_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.sc_req_item_final SRC 
 LEFT JOIN intuit_mdwdb.f_request_item TRGT
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
  left join intuit_mdwdb.d_lov_map p
on TRGT.state_src_key=p.src_key and dimension_wh_code='CLOSED'
 LEFT JOIN intuit_mdwdb.d_internal_contact LKP 
 ON ( concat('INTERNAL_CONTACT~',SRC.closed_by)= LKP.row_id
AND SRC.sourceinstance= LKP.source_id 
AND COALESCE(CONVERT_TZ (SRC.opened_at,"GMT","America/Los_Angeles"), 
CONVERT_TZ (coalesce(SRC.closed_at,SRC.sys_updated_on),"GMT","America/Los_Angeles")) 
BETWEEN LKP.effective_from AND LKP.effective_to

)
 WHERE  COALESCE(LKP.row_key,CASE WHEN SRC.closed_by  IS NULL THEN 0 ELSE -1 END )<> (TRGT.closed_by_key);
 
 
 


f_request_item_closed_on_key_mysql.sql :: 


SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_item.closed_on_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.sc_req_item_final SRC
 LEFT JOIN intuit_mdwdb.f_request_item TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
JOIN intuit_mdwdb.d_lov_map dlm 
ON TRGT.state_src_key = dlm.src_key
LEFT JOIN intuit_mdwdb.d_calendar_date LKP 
on (LKP.row_id = date_format(convert_tz(coalesce(SRC.closed_at,SRC.sys_updated_on),"GMT","America/Los_Angeles"),'%Y%m%d')  and LKP.source_id=0
)
WHERE case when dlm.dimension_wh_code = 'CLOSED' then (LKP.row_key) else null end <> (TRGT.closed_on_key)

 


f_request_item_company_key_mysql.sql :: 


SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_item.company_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.sc_req_item_final SRC 
 LEFT JOIN intuit_mdwdb.f_request_item TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN intuit_mdwdb.d_internal_organization LKP 
 ON ( CONCAT('SUBSIDIARY~', SRC.company)= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.company IS NULL THEN 0 else -1 end)<> (TRGT.company_key) 


f_request_item_configuration_item_key_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_item.configuration_item_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.sc_req_item_final SRC 
 LEFT JOIN intuit_mdwdb.f_request_item TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN intuit_mdwdb.d_configuration_item LKP 
 ON ( SRC.cmdb_ci= LKP.row_id AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.cmdb_ci  IS NULL THEN 0 ELSE -1 END )
<> (TRGT.configuration_item_key)

  


f_request_item_created_by_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_item.created_by' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.sc_req_item_final SRC 
 LEFT JOIN intuit_mdwdb.f_request_item TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( SRC.sys_created_by,'')<> COALESCE(TRGT.created_by ,'')
 


f_request_item_created_on_mysql.sql :: 


SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_item.created_on' ELSE 'SUCCESS' END as Message  FROM intuit_mdsdb.sc_req_item_final SRC  LEFT JOIN intuit_mdwdb.f_request_item TRGT  ON (SRC.sys_id =TRGT.row_id   AND SRC.sourceinstance= TRGT.source_id  ) WHERE convert_tz(SRC.sys_created_on,"GMT","America/Los_Angeles")<> TRGT.created_on 
 


f_request_item_domain_key_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_item.domain_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.sc_req_item_final SRC 
 LEFT JOIN intuit_mdwdb.f_request_item TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN intuit_mdwdb.d_domain LKP 
 ON ( SRC.sys_domain= LKP.row_id
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.sys_domain IS NULL THEN 0 else -1 end)<> (TRGT.domain_key)
 


f_request_item_due_on_key_mysql.sql :: 


SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_item.due_on_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.sc_req_item_final SRC
 LEFT JOIN intuit_mdwdb.f_request_item TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN intuit_mdwdb.d_calendar_date LKP 
on (LKP.row_id = date_format(convert_tz(SRC.due_date,"GMT","America/Los_Angeles"),'%Y%m%d')  and LKP.source_id=0
)
WHERE coalesce(LKP.row_key,case when SRC.due_date is null then 0 else -1 end)<>  (TRGT.due_on_key)
 


f_request_item_estimated_delivery_on_key_mysql.sql :: 


SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_item.estimated_delivery_on_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.sc_req_item_final SRC
 LEFT JOIN intuit_mdwdb.f_request_item TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN intuit_mdwdb.d_calendar_date LKP 
on (LKP.row_id = date_format(convert_tz(SRC.estimated_delivery,"GMT","America/Los_Angeles"),'%Y%m%d') )
WHERE coalesce(LKP.row_key,case when SRC.estimated_delivery is null then 0 else -1 end) <> (TRGT.estimated_delivery_on_key)

 


f_request_item_estimated_delivery_time_key_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_item.estimated_delivery_time_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.sc_req_item_final SRC
 LEFT JOIN intuit_mdwdb.f_request_item TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN intuit_mdwdb.d_calendar_time LKP 
on (LKP.row_id = date_format(convert_tz(SRC.estimated_delivery,"GMT","America/Los_Angeles"),'%H%i')  
)
WHERE coalesce(LKP.row_key,case when SRC.estimated_delivery is null then 0 else -1 end) <> (TRGT.estimated_delivery_time_key)
 


f_request_item_impact_src_code_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_item.impact_src_code' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.sc_req_item_final SRC 
 LEFT JOIN intuit_mdwdb.f_request_item TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( SRC.impact,'')<> COALESCE(TRGT.impact_src_code ,'')
 


f_request_item_impact_src_key_mysql.sql :: 


SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_item.impact_src_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.sc_req_item_final SRC 
 LEFT JOIN intuit_mdwdb.f_request_item TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN intuit_mdwdb.d_lov LKP 
 ON ( concat('IMPACT','~','SC_REQ_ITEM','~','~','~',upper(impact))= LKP.src_rowid 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.impact IS NULL THEN 0 else -1 end)<> (TRGT.impact_src_key) 


f_request_item_location_key_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_item.location_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.sc_req_item_final SRC 
 LEFT JOIN intuit_mdwdb.f_request_item TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN intuit_mdwdb.d_location LKP 
 ON ( SRC.location= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.location IS NULL THEN 0 else -1 end)<> (TRGT.location_key)
 


f_request_item_open_to_close_duration_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_item.open_to_close_duration' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.sc_req_item_final SRC
 LEFT JOIN intuit_mdwdb.f_request_item TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
    LEFT JOIN intuit_mdwdb.d_lov_map dlm 
ON TRGT.state_src_key = dlm.src_key AND dlm.dimension_wh_code = 'CLOSED'
WHERE  TIMESTAMPDIFF(second,SRC.opened_at,coalesce(SRC.closed_at,SRC.sys_updated_on))<>  (TRGT.open_to_close_duration) 
 


f_request_item_opened_by_department_key_mysql.sql :: 


 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_request.priority_escalated_flag' ELSE 'SUCCESS' END as Message from
intuit_mdsdb.sc_req_item_final SRC
left join intuit_mdsdb.sys_user_final scu
on SRC.opened_by = scu.sys_id

LEFT JOIN intuit_mdwdb.f_request_item TRGT ON SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id

left join intuit_mdwdb.d_internal_organization LKP on LKP.row_id =concat('DEPARTMENT~',scu.department) and SRC.sourceinstance=LKP.source_id 

WHERE COALESCE(LKP.row_key ,CASE WHEN scu.department is null THEN 0 else -1 end)<> (TRGT.opened_by_department_key) 


f_request_item_opened_by_key_mysql.sql :: 



SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_item.opened_by_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.sc_req_item_final SRC 
 LEFT JOIN intuit_mdwdb.f_request_item TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN intuit_mdwdb.d_internal_contact LKP 
 ON ( concat('INTERNAL_CONTACT~',SRC.opened_by)= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id
and COALESCE(CONVERT_TZ (SRC.opened_at,"GMT","America/Los_Angeles"), CONVERT_TZ (coalesce(SRC.closed_at,SRC.sys_updated_on),"GMT","America/Los_Angeles"),'UNSPECIFIED') 
BETWEEN effective_from AND effective_to) 

 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.opened_by IS NULL THEN 0 else -1 end)<> (TRGT.opened_by_key) 


f_request_item_opened_on_key_mysql.sql :: 


SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_item.opened_on_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.sc_req_item_final SRC
 LEFT JOIN intuit_mdwdb.f_request_item TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN intuit_mdwdb.d_calendar_date LKP 
on (LKP.row_id = date_format(convert_tz(SRC.opened_at,"GMT","America/Los_Angeles"),'%Y%m%d')  and LKP.source_id=0
)
WHERE COALESCE(LKP.row_key,case when SRC.opened_at is null then 0 else -1 end) <> (TRGT.opened_on_key) 
 


f_request_item_opened_time_key_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_item.opened_time_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.sc_req_item_final SRC
 LEFT JOIN intuit_mdwdb.f_request_item TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )

LEFT JOIN intuit_mdwdb.d_calendar_time LKP 
on (LKP.row_id = date_format(convert_tz(SRC.opened_at,"GMT","America/Los_Angeles"),'%H%i')  and LKP.source_id=0
)
WHERE COALESCE(LKP.row_key,case when SRC.opened_at is null then 0 else -1 end)<>  (TRGT.opened_time_key) 
 


f_request_item_price_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_item.price' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.sc_req_item_final SRC 
 LEFT JOIN intuit_mdwdb.f_request_item TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE SRC.price<> TRGT.price 
 


f_request_item_priority_src_code_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_item.priority_src_code' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.sc_req_item_final SRC 
 LEFT JOIN intuit_mdwdb.f_request_item TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( SRC.priority,'')<> COALESCE(TRGT.priority_src_code ,'')
 


f_request_item_priority_src_key_mysql.sql :: 


SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_item.priority_src_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.sc_req_item_final SRC 
 LEFT JOIN intuit_mdwdb.f_request_item TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN intuit_mdwdb.d_lov LKP 
 ON ( concat('PRIORITY','~','SC_REQ_ITEM','~','~','~',upper(priority))= LKP.src_rowid 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.priority IS NULL THEN 0 else -1 end)<> (TRGT.priority_src_key)  


f_request_item_quantity_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_item.quantity' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.sc_req_item_final SRC 
 LEFT JOIN intuit_mdwdb.f_request_item TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( SRC.quantity,'')<> (TRGT.quantity)
 


f_request_item_request_item_key_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_item.request_item_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.sc_req_item_final SRC 
 LEFT JOIN intuit_mdwdb.f_request_item TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN intuit_mdwdb.d_request_item LKP 
 ON ( SRC.sys_id= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.sys_id IS NULL THEN 0 else -1 end)<> (TRGT.request_item_key)
 


f_request_item_request_key_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_item.request_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.sc_req_item_final SRC 
 LEFT JOIN intuit_mdwdb.f_request_item TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN intuit_mdwdb.d_request LKP 
 ON ( SRC.request= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.request IS NULL THEN 0 else -1 end)<> (TRGT.request_key)
 


f_request_item_stage_src_code_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_item.stage_src_code' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.sc_req_item_final SRC 
 LEFT JOIN intuit_mdwdb.f_request_item TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( SRC.stage,'')<> COALESCE(TRGT.stage_src_code ,'')
 


f_request_item_stage_src_key_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_item.stage_src_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.sc_req_item_final SRC 
 LEFT JOIN intuit_mdwdb.f_request_item TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN intuit_mdwdb.d_lov LKP 
 ON ( concat('STAGE','~','SC_REQ_ITEM','~','~','~',upper(stage))= LKP.src_rowid 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.stage IS NULL THEN 0 else -1 end)<> (TRGT.stage_src_key)
 


f_request_item_state_src_code_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_item.state_src_code' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.sc_req_item_final SRC 
 LEFT JOIN intuit_mdwdb.f_request_item TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( SRC.state,'')<> (TRGT.state_src_code)
 


f_request_item_state_src_key_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_item.state_src_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.sc_req_item_final SRC 
 LEFT JOIN intuit_mdwdb.f_request_item TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN intuit_mdwdb.d_lov LKP 
 ON ( concat('STATE','~','SC_REQ_ITEM','~','~','~',upper(state))= LKP.src_rowid 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.state IS NULL THEN 0 else -1 end)<> (TRGT.state_src_key)
 


f_request_item_time_worked_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_item.time_worked' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.sc_req_item_final SRC
 LEFT JOIN intuit_mdwdb.f_request_item TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
WHERE  TIMESTAMPDIFF(second,'1970-01-01 00:00:00',SRC.time_worked)<>  COALESCE(TRGT.time_worked,'') 
 


f_request_item_urgency_src_code_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_item.urgency_src_code' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.sc_req_item_final SRC 
 LEFT JOIN intuit_mdwdb.f_request_item TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( SRC.urgency,'')<> COALESCE(TRGT.urgency_src_code ,'')
 


f_request_item_urgency_src_key_mysql.sql :: 



SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_item.urgency_src_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.sc_req_item_final SRC 
 LEFT JOIN intuit_mdwdb.f_request_item TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN intuit_mdwdb.d_lov LKP 
 ON ( concat('URGENCY','~','SC_REQ_ITEM','~','~','~',upper(urgency))= LKP.src_rowid 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.urgency IS NULL THEN 0 else -1 end)<> (TRGT.urgency_src_key) 


d_request_task_active_flag_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_request_task.active_flag' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.sc_task_final SRC 
 LEFT JOIN intuit_mdwdb.d_request_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE ( CASE WHEN SRC.active =1 then 'Y' else 'N' END)<> (TRGT.active_flag )
 


d_request_task_backlog_flag_mysql.sql :: 


 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_request_task.backlog_flag' ELSE 'SUCCESS' END as Message from(
 select ( CASE WHEN LM.dimension_wh_code IN('OPEN') THEN 'Y' ELSE 'N' END)abc, (TRGT.backlog_flag)def
 FROM intuit_mdsdb.sc_task_final SRC 
 LEFT JOIN intuit_mdwdb.d_request_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
  JOIN  intuit_mdwdb.f_request_task TRGTF 
 ON (TRGTF.request_task_key =TRGT.row_key
 AND TRGTF.source_id =TRGT.source_id)
LEFT JOIN intuit_mdwdb.d_lov_map LM
 on TRGTF.state_src_key = LM.src_key  AND LM.dimension_class='STATE~SC_TASK' )a
WHERE abc<>def

 


d_request_task_changed_by_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_request_task.changed_by' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.sc_task_final SRC 
 LEFT JOIN intuit_mdwdb.d_request_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( SRC.sys_updated_by,'')<> COALESCE(TRGT.changed_by ,'')
 


d_request_task_changed_on_mysql.sql :: 


SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_request_task.changed_on' ELSE 'SUCCESS' END as Message  FROM intuit_mdsdb.sc_task_final SRC  LEFT JOIN intuit_mdwdb.d_request_task TRGT  ON (SRC.sys_id =TRGT.row_id   AND SRC.sourceinstance= TRGT.source_id  ) WHERE convert_tz(SRC.sys_updated_on,"GMT","America/Los_Angeles")<> TRGT.changed_on 
 


d_request_task_closed_on_mysql.sql :: 


SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_request_task.closed_on' ELSE 'SUCCESS' END as Message  FROM intuit_mdsdb.sc_task_final SRC  LEFT JOIN intuit_mdwdb.d_request_task TRGT  ON (SRC.sys_id =TRGT.row_id   AND SRC.sourceinstance= TRGT.source_id  ) 
WHERE convert_tz(coalesce(SRC.closed_at,SRC.sys_updated_on),"GMT","America/Los_Angeles")<> TRGT.closed_on 
 


d_request_task_created_by_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_request_task.created_by' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.sc_task_final SRC 
 LEFT JOIN intuit_mdwdb.d_request_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( SRC.sys_created_by,'')<> (TRGT.created_by)
 


d_request_task_created_on_mysql.sql :: 


SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_request_task.created_on' ELSE 'SUCCESS' END as Message  FROM intuit_mdsdb.sc_task_final SRC  LEFT JOIN intuit_mdwdb.d_request_task TRGT  ON (SRC.sys_id =TRGT.row_id   AND SRC.sourceinstance= TRGT.source_id  ) WHERE convert_tz(SRC.sys_created_on,"GMT","America/Los_Angeles")<> TRGT.created_on 
 


d_request_task_description_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_request_task.description' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.sc_task_final SRC 
 LEFT JOIN intuit_mdwdb.d_request_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( SRC.description,'')<> COALESCE(TRGT.description ,'')
 


d_request_task_domain_key_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_request_task.domain_key' ELSE 'SUCCESS' END as Message from(
 select
 COALESCE(LKP.row_key,CASE WHEN SRC.sys_domain IS NULL THEN 0 else -1 end)abc, (TRGT.domain_key)def
 FROM intuit_mdsdb.sc_task_final SRC 
 LEFT JOIN intuit_mdwdb.d_request_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN intuit_mdwdb.d_domain LKP 
 ON ( SRC.sys_domain= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id ))a
 WHERE abc<>def
 


d_request_task_due_on_mysql.sql :: 


SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_request_task.due_on' ELSE 'SUCCESS' END as Message  FROM intuit_mdsdb.sc_task_final SRC  LEFT JOIN intuit_mdwdb.d_request_task TRGT  ON (SRC.sys_id =TRGT.row_id   AND SRC.sourceinstance= TRGT.source_id  ) WHERE convert_tz(SRC.due_date,"GMT","America/Los_Angeles")<> TRGT.due_on 
 


d_request_task_met_sla_flag_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_request_task.met_sla_flag' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.sc_task_final SRC 
 LEFT JOIN intuit_mdwdb.d_request_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE ( CASE WHEN SRC.made_sla =1 then 'Y' else 'N' END)<> (TRGT.met_sla_flag )
 


d_request_task_multiple_assignment_flag_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_request_task.multiple_assignment_flag' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.sc_task_final SRC 
 LEFT JOIN intuit_mdwdb.d_request_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE ( CASE WHEN SRC.reassignment_count >= 1 then 'Y' else 'N' END)<> (TRGT.multiple_assignment_flag )
 


d_request_task_multiple_categorization_flag_mysql.sql :: 



SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_request_task.multiple_categorization_flag' ELSE 'SUCCESS' END as Message FROM(
 SELECT CASE WHEN TA.task_attribute_wh_old_value <> TA.task_attribute_wh_new_value THEN 'Y' ELSE 'N' END ABC,
 (TRGT.priority_escalated_flag) DEF
 FROM intuit_mdsdb.sc_task_final SRC 
 LEFT JOIN intuit_mdwdb.d_request_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 JOIN intuit_mdwdb.f_t_task_activity TA 
 ON (SRC.sys_id =TA.task_row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 AND TA.task_wh_type = 'sc_task' 
AND TA.task_attribute_wh_name =  'category' )A
 WHERE  ABC<>DEF
 


d_request_task_opened_on_mysql.sql :: 


SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_request_task.opened_on' ELSE 'SUCCESS' END as Message  FROM intuit_mdsdb.sc_task_final SRC  LEFT JOIN intuit_mdwdb.d_request_task TRGT  ON (SRC.sys_id =TRGT.row_id   AND SRC.sourceinstance= TRGT.source_id  ) WHERE convert_tz(SRC.opened_at,"GMT","America/Los_Angeles")<> TRGT.opened_on 
 


d_request_task_over_due_flag_mysql.sql :: 



SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,

 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_request_item.over_due_flag' ELSE 'SUCCESS' END as Message

 FROM  intuit_mdwdb.d_request_task REQ_ITM 
WHERE  REQ_ITM.over_due_flag <> CASE WHEN (REQ_ITM.active_flag = 'Y') && (REQ_ITM.due_on < (SELECT MAX(lastupdated) AS lastupdated
FROM intuit_mdwdb.d_o_data_freshness WHERE sourcename like 'ServiceNow%')) THEN 'Y' ELSE 'N' END 


d_request_task_request_task_number_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_request_task.request_task_number' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.sc_task_final SRC 
 LEFT JOIN intuit_mdwdb.d_request_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( SRC.number,'')<> COALESCE(TRGT.request_task_number ,'')
 


d_request_task_short_description_mysql.sql :: 


  
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.short_description' ELSE 'SUCCESS' END as Message
 FROM 
 intuit_mdsdb.sc_task_final SRC 
 LEFT JOIN intuit_mdwdb.d_request_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE char_length(SRC.short_description)<=255 and SRC.short_description<>TRGT.short_description
  


d_request_task_source_id_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_request_task.source_id' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.sc_task_final SRC 
 LEFT JOIN intuit_mdwdb.d_request_task TRGT 
 ON SRC.sys_id =TRGT.row_id  
 
 WHERE SRC.sourceinstance<> TRGT.source_id  


f_request_task_assigned_to_key_mysql.sql :: 


SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_task.assigned_to_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.sc_task_final SRC 
 LEFT JOIN intuit_mdwdb.f_request_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN intuit_mdwdb.d_internal_contact LKP 
 ON ( concat('INTERNAL_CONTACT~',SRC.assigned_to)= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id ) and 
TRGT.pivot_date BETWEEN effective_from AND effective_to
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.assigned_to IS NULL THEN 0 else -1 end)<> TRGT.assigned_to_key
 


f_request_task_assignment_group_key_mysql.sql :: 


SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_task.assignment_group_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.sc_task_final SRC 
 LEFT JOIN intuit_mdwdb.f_request_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN intuit_mdwdb.d_internal_organization LKP 
 ON ( concat('GROUP~',SRC.assignment_group )= LKP.row_id
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.assignment_group IS NULL THEN 0 else -1 end)<> (TRGT.assignment_group_key)
 


f_request_task_changed_by_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_task.changed_by' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.sc_task_final SRC 
 LEFT JOIN intuit_mdwdb.f_request_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( SRC.sys_updated_by,'')<> COALESCE(TRGT.changed_by ,'')
 


f_request_task_changed_on_mysql.sql :: 


SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_task.changed_on' ELSE 'SUCCESS' END as Message  FROM intuit_mdsdb.sc_task_final SRC  LEFT JOIN intuit_mdwdb.f_request_task TRGT  ON (SRC.sys_id =TRGT.row_id   AND SRC.sourceinstance= TRGT.source_id  ) WHERE convert_tz(SRC.sys_updated_on,"GMT","America/Los_Angeles")<> TRGT.changed_on 
 


f_request_task_closed_by_key_mysql.sql :: 


SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_task.closed_by_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.sc_task_final SRC 
 LEFT JOIN intuit_mdwdb.f_request_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN intuit_mdwdb.d_internal_contact LKP 
 ON ( concat('INTERNAL_CONTACT~',SRC.closed_by)= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id
and TRGT.pivot_date BETWEEN LKP.effective_from AND LKP.effective_to)
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.closed_by IS NULL THEN 0 else -1 end)<> (TRGT.closed_by_key) 


f_request_task_closed_on_key_mysql.sql :: 


SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_task.closed_on_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.sc_task_final SRC
 LEFT JOIN intuit_mdwdb.f_request_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
JOIN intuit_mdwdb.d_lov_map dlm 
ON TRGT.state_src_key = dlm.src_key
LEFT JOIN intuit_mdwdb.d_calendar_date LKP 
on (LKP.row_id = date_format(convert_tz(coalesce(SRC.closed_at,SRC.sys_updated_on),"GMT","America/Los_Angeles"),'%Y%m%d')  and LKP.source_id=0
)
WHERE case when dlm.dimension_wh_code = 'CLOSED' then (LKP.row_key) else null end <> (TRGT.closed_on_key)

 


f_request_task_company_key_mysql.sql :: 



SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_request_task.company_key' ELSE 'SUCCESS' END as Message
from (SELECT count(1)  cnt
 FROM intuit_mdsdb.sc_task_final SRC 
 LEFT JOIN intuit_mdwdb.f_request_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN intuit_mdwdb.d_internal_organization LKP 
 ON ( concat('SUBSIDIARY~',company)= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.company IS NULL THEN 0 else -1 end)<> (TRGT.company_key))x 


f_request_task_configuration_item_key_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_task.configuration_item_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.sc_task_final SRC 
 LEFT JOIN intuit_mdwdb.f_request_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN intuit_mdwdb.d_configuration_item LKP 
 ON ( SRC.cmdb_ci= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.cmdb_ci IS NULL THEN 0 else -1 end)<> (TRGT.configuration_item_key)
 


f_request_task_created_by_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_task.created_by' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.sc_task_final SRC 
 LEFT JOIN intuit_mdwdb.f_request_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( SRC.sys_created_by,'')<> COALESCE(TRGT.created_by ,'')
 


f_request_task_created_on_mysql.sql :: 


SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_task.created_on' ELSE 'SUCCESS' END as Message  FROM intuit_mdsdb.sc_task_final SRC  LEFT JOIN intuit_mdwdb.f_request_task TRGT  ON (SRC.sys_id =TRGT.row_id   AND SRC.sourceinstance= TRGT.source_id  ) WHERE convert_tz(SRC.sys_created_on,"GMT","America/Los_Angeles")<> TRGT.created_on 
 


f_request_task_domain_key_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_task.domain_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.sc_task_final SRC 
 LEFT JOIN intuit_mdwdb.f_request_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN intuit_mdwdb.d_domain LKP 
 ON ( SRC.sys_domain= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.sys_domain IS NULL THEN 0 else -1 end)<> (TRGT.domain_key)
 


f_request_task_due_on_key_mysql.sql :: 


SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_task.due_on_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.sc_task_final SRC
 LEFT JOIN intuit_mdwdb.f_request_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN intuit_mdwdb.d_calendar_date LKP 
on (LKP.row_id = date_format(convert_tz(SRC.due_date,"GMT","America/Los_Angeles"),'%Y%m%d')  and LKP.source_id=0
)
WHERE coalesce(LKP.row_key,case when SRC.due_date is null then 0 else -1 end) <> (TRGT.due_on_key)
 


f_request_task_impact_src_code_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_task.impact_src_code' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.sc_task_final SRC 
 LEFT JOIN intuit_mdwdb.f_request_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( SRC.impact,'')<> COALESCE(TRGT.impact_src_code ,'')
 


f_request_task_impact_src_key_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_task.impact_src_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.sc_task_final SRC 
 LEFT JOIN intuit_mdwdb.f_request_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN intuit_mdwdb.d_lov LKP 
 ON ( concat('IMPACT','~','SC_TASK','~','~','~',upper(impact))= LKP.src_rowid 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.impact IS NULL THEN 0 else -1 end)<> (TRGT.impact_src_key)
 


f_request_task_location_key_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_task.location_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.sc_task_final SRC 
 LEFT JOIN intuit_mdwdb.f_request_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN intuit_mdwdb.d_location LKP 
 ON ( SRC.location= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.location IS NULL THEN 0 else -1 end)<> (TRGT.location_key)
 


f_request_task_open_to_close_duration_open_mysql.sql :: 


SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_task.open_to_close_duration' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.sc_task_final SRC
 LEFT JOIN intuit_mdwdb.f_request_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id)
left join intuit_mdwdb.d_lov_map p
on TRGT.state_src_key=p.src_key
WHERE  TIMESTAMPDIFF(second, SRC.opened_at, SRC.closed_at)<>  TRGT.open_to_close_duration
AND dimension_wh_code = 'CLOSED' 


f_request_task_opened_by_department_key_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_task.opened_by_department_key' ELSE 'SUCCESS' END as Message
 
 
 FROM intuit_mdsdb.sc_task_final SRC 
 JOIN intuit_mdwdb.f_request_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN  intuit_mdwdb.d_internal_contact LKP1 
 ON ( concat('INTERNAL_CONTACT~',SRC.opened_by)= LKP1.row_id 
 AND SRC.sourceinstance= LKP1.source_id )
 
 LEFT JOIN   intuit_mdwdb.d_internal_organization LKP
 ON ( concat('DEPARTMENT~',LKP1.department_code)= LKP.row_id 
 AND LKP1.source_id= LKP.source_id )

JOIN   intuit_mdwdb.d_internal_organization LKP2
 ON ( concat('DEPARTMENT~',SRC.opened_by)= LKP2.row_id 
 AND SRC.sourceinstance= LKP2.source_id )
 and LKP.row_id  is null 
 
 WHERE COALESCE(LKP.row_key,LKP2.row_key,CASE WHEN (SRC.opened_by is not null and LKP1.department_code IS NULL 
 or SRC.opened_by is  null) THEN 0 else -1 end)<> (TRGT.opened_by_department_key)
 


f_request_task_opened_by_key_mysql.sql :: 


SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_task.opened_by_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.sc_task_final SRC 
 LEFT JOIN intuit_mdwdb.f_request_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN intuit_mdwdb.d_internal_contact LKP 
 ON ( concat('INTERNAL_CONTACT~',SRC.opened_by )= LKP.row_id
AND SRC.sourceinstance= LKP.source_id ) and COALESCE(CONVERT_TZ (SRC.opened_at,"GMT","America/Los_Angeles"), 
CONVERT_TZ (coalesce(SRC.closed_at,SRC.sys_updated_on),"GMT","America/Los_Angeles"),'UNSPECIFIED') 
BETWEEN effective_from AND effective_to
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.opened_by IS NULL THEN 0 else -1 end)<> (TRGT.opened_by_key) 


f_request_task_opened_on_key_mysql.sql :: 


SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_task.opened_on_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.sc_task_final SRC
 LEFT JOIN intuit_mdwdb.f_request_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN intuit_mdwdb.d_calendar_date LKP 
on (LKP.row_id = date_format(convert_tz(SRC.opened_at,"GMT","America/Los_Angeles"),'%Y%m%d')  and LKP.source_id=0
)
WHERE COALESCE(LKP.row_key,case when SRC.opened_at is null then 0 else -1 end) <> (TRGT.opened_on_key) 
 


f_request_task_priority_src_code_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_task.priority_src_code' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.sc_task_final SRC 
 LEFT JOIN intuit_mdwdb.f_request_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( SRC.priority,'')<> COALESCE(TRGT.priority_src_code ,'')
 


f_request_task_priority_src_key_mysql.sql :: 



SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_task.priority_src_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.sc_task_final SRC 
 LEFT JOIN intuit_mdwdb.f_request_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN intuit_mdwdb.d_lov LKP 
 ON ( concat('PRIORITY','~','SC_TASK','~','~','~',upper(priority))= LKP.src_rowid 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.priority IS NULL THEN 0 else -1 end)<> (TRGT.priority_src_key) 


f_request_task_request_item_key_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_task.request_item_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.sc_task_final SRC 
 LEFT JOIN intuit_mdwdb.f_request_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN intuit_mdwdb.d_request_item LKP 
 ON ( SRC.request_item= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.request_item IS NULL THEN 0 else -1 end)<> (TRGT.request_item_key)
 


f_request_task_request_key_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_task.request_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.sc_task_final SRC 
 LEFT JOIN intuit_mdwdb.f_request_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN intuit_mdwdb.d_request LKP 
 ON ( SRC.request= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.request IS NULL THEN 0 else -1 end)<> (TRGT.request_key)
 


f_request_task_request_task_key_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_task.request_task_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.sc_task_final SRC 
 LEFT JOIN intuit_mdwdb.f_request_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN intuit_mdwdb.d_request_task LKP 
 ON ( SRC.sys_id= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.sys_id IS NULL THEN 0 else -1 end)<> COALESCE(TRGT.request_task_key)
 


f_request_task_source_id_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_task.source_id' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.sc_task_final SRC 
 LEFT JOIN intuit_mdwdb.f_request_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( SRC.sourceinstance,0)<> COALESCE(TRGT.source_id ,0)
 


f_request_task_state_src_code_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_task.state_src_code' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.sc_task_final SRC 
 LEFT JOIN intuit_mdwdb.f_request_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( SRC.state,'')<> COALESCE(TRGT.state_src_code ,'')
 


f_request_task_state_src_key_mysql.sql :: 


SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_task.state_src_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.sc_task_final SRC 
 LEFT JOIN intuit_mdwdb.f_request_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN intuit_mdwdb.d_lov LKP 
 ON ( concat('STATE','~','SC_TASK','~','~','~',upper(state))= LKP.src_rowid 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.state IS NULL THEN 0 else -1 end)<> (TRGT.state_src_key) 


f_request_task_time_worked_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_task.time_worked' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.sc_task_final SRC
 LEFT JOIN intuit_mdwdb.f_request_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
WHERE  TIMESTAMPDIFF(second,'1970-01-01 00:00:00',SRC.time_worked)<>  COALESCE(TRGT.time_worked,'') 
 


f_request_task_urgency_src_code_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_task.urgency_src_code' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.sc_task_final SRC 
 LEFT JOIN intuit_mdwdb.f_request_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( SRC.urgency,'')<> (TRGT.urgency_src_code)
 


f_request_task_urgency_src_key_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_task.urgency_src_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.sc_task_final SRC 
 LEFT JOIN intuit_mdwdb.f_request_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN intuit_mdwdb.d_lov LKP 
 ON ( concat('URGENCY','~','SC_TASK','~','~','~',upper(urgency))= LKP.src_rowid 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.urgency IS NULL THEN 0 else -1 end)<> (TRGT.urgency_src_key)
 


d_survey_instance_survey_key_mysql.sql :: 



SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_survey_instance.survey_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.survey_instance_final SRC 
 LEFT JOIN intuit_mdwdb.d_survey_instance TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN intuit_mdwdb.d_survey LKP 
 ON ( SRC.survey= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.survey IS NULL THEN 0 else -1 end)<> (TRGT.survey_key);
 


d_survey_question_survey_key_mysql.sql :: 


 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_survey_question.survey_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.survey_question_new_final SRC 
 LEFT JOIN intuit_mdwdb.d_survey_question TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN intuit_mdwdb.d_survey LKP 
 ON ( SRC.master= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.master IS NULL THEN 0 else -1 end)<> (TRGT.survey_key)
 


d_change_planned_c_resolve_date_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from intuit_mdsdb.change_task_final a
left join intuit_mdwdb.d_change_task_c c 
on  a.sys_id = c.ROW_ID and a.sourceinstance=c.source_id
where convert_tz(a.u_planned_resolve_date,'GMT','America/los_Angeles')<> c.planned_resolve_date) g  


d_change_planned_c_response_date_mysql.sql :: 



SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from intuit_mdsdb.change_task_final a
left join intuit_mdwdb.d_change_task_c c 
on  a.sys_id = c.ROW_ID and a.sourceinstance=c.source_id
where a.u_planned_response_date <> c.planned_response_date) g 


d_change_request_downtime_statement_c_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM 
(SELECT COUNT(*) as cnt 
FROM intuit_mdsdb.change_request_final SOURC
LEFT JOIN intuit_mdwdb.d_change_request TRGT ON TRGT.row_id =SOURC.sys_id AND TRGT.source_id=SOURC.sourceinstance 
WHERE TRGT.downtime_statement_c <> SOURC.u_downtime_statement)temp;

 


d_change_request_environment_c_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result

,CASE WHEN cnt > 0 THEN 'Data did not Match.' 

ELSE 'Data Matched' END AS Message 

FROM (

SELECT COUNT(*) as cnt 

FROM intuit_mdsdb.change_request_final SOURC

LEFT JOIN intuit_mdsdb.cmdb_ci_environment_final LKP 

ON LKP.sys_id=SOURC.u_environment 

LEFT JOIN intuit_mdwdb.d_change_request TRGT 

ON TRGT.row_id =SOURC.sys_id AND TRGT.source_id=SOURC.sourceinstance 

WHERE TRGT.environment_c <> LKP.name)temp 


d_change_request_expedited_c_flag_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (SELECT COUNT(*) as cnt 
FROM intuit_mdsdb.change_request_final SOURC
LEFT JOIN intuit_mdwdb.d_change_request TRGT ON TRGT.row_id =SOURC.sys_id AND TRGT.source_id=SOURC.sourceinstance 
WHERE TRGT.expedited_c_flag <> CASE WHEN SOURC.u_expedited=1 THEN 'Y' ELSE 'N' END) temp; 


d_change_request_expedited_justification_c_mysql.sql :: 



SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result, CASE WHEN cnt > 0 
THEN 'Data did not Match.' else 'MATCHED'end as result from
(SELECT COUNT(*) as cnt 
FROM intuit_mdsdb.change_request_final SOURC
LEFT JOIN intuit_mdwdb.d_change_request TRGT ON TRGT.row_id =SOURC.sys_id AND TRGT.source_id=SOURC.sourceinstance 
WHERE TRGT.expedited_justification_c <> SOURC.u_expedited_justification)temp;

  


d_change_request_pir_c_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result, CASE WHEN cnt > 0 THEN 'Data did not Match.' 
else 'matched' end as result from
(SELECT COUNT(*) as cnt 
FROM intuit_mdsdb.change_request_final SOURC
LEFT JOIN intuit_mdwdb.d_change_request TRGT ON TRGT.row_id =SOURC.sys_id AND TRGT.source_id=SOURC.sourceinstance 
WHERE TRGT.pir_c <> SOURC.u_pir)temp;

 


d_change_request_template_c_mysql.sql :: 



SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result, CASE WHEN cnt > 0 THEN 'Data did not Match.' else 
'MATCHED' end as result from
(SELECT COUNT(*) as cnt 
FROM intuit_mdsdb.change_request_final SOURC
LEFT JOIN intuit_mdsdb.sys_template_final TF 
ON TF.sys_id=SOURC.u_template
LEFT JOIN intuit_mdwdb.d_change_request TRGT ON TRGT.row_id =SOURC.sys_id AND TRGT.source_id=SOURC.sourceinstance 
WHERE TRGT.template_c <> TF.name)temp;

 


d_change_request_traffic_move_recommended_c_flag_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (SELECT COUNT(*) as cnt 
FROM intuit_mdsdb.change_request_final SOURC
LEFT JOIN intuit_mdwdb.d_change_request TRGT ON TRGT.row_id =SOURC.sys_id AND TRGT.source_id=SOURC.sourceinstance 
WHERE TRGT.traffic_move_recommended_c_flag <> CASE WHEN SOURC.u_traffic_move_recommended = 1 THEN 'Y' ELSE 'N' END)temp;

 


d_change_task_c_actual_c_resolve_date_mysql.sql :: 



SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from intuit_mdsdb.change_task_final a
left join intuit_mdwdb.d_change_task_c c 
on  a.sys_id = c.ROW_ID and a.sourceinstance=c.source_id
where a.u_actual_resolve_date = c.actual_resolve_date) g

 


d_change_task_c_change_task_number_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from intuit_mdsdb.change_task_final a
left join intuit_mdwdb.d_change_task_c c 
on  a.sys_id = c.ROW_ID and a.sourceinstance=c.source_id
where a.number  <> c.change_task_number) g 


d_change_task_c_closed_on_mysql.sql :: 



SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from intuit_mdsdb.change_task_final a
left join intuit_mdwdb.d_change_task_c c 
on  a.sys_id = c.ROW_ID and a.sourceinstance=c.source_id
where convert_tz(a.closed_at,'GMT' ,'America/Los_Angeles') <> c.closed_on) g 


d_change_task_c_description_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from intuit_mdsdb.change_task_final a
left join intuit_mdwdb.d_change_task_c c 
on  a.sys_id = c.ROW_ID and a.sourceinstance=c.source_id
where a.description <> c.description) g 


d_change_task_c_due_on_mysql.sql :: 



SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from intuit_mdsdb.change_task_final a
left join intuit_mdwdb.d_change_task_c c 
on  a.sys_id = c.ROW_ID and a.sourceinstance=c.source_id
where convert_tz(a.due_date,'GMT' ,'America/Los_Angeles') <> c.due_on) g 


d_change_task_c_expected_start_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from intuit_mdsdb.change_task_final a
left join intuit_mdwdb.d_change_task_c c 
on  a.sys_id = c.ROW_ID and a.sourceinstance=c.source_id
where convert_tz(a.expected_start,'GMT' ,'America/Los_Angeles') <> c.expected_start) g 


d_change_task_c_met_sla_flag_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from intuit_mdsdb.change_task_final a
left join intuit_mdwdb.d_change_task_c c 
on  a.sys_id = c.ROW_ID and a.sourceinstance=c.source_id
where (case when a.made_sla = 1 then 'Y' else 'N' end) <> c.met_sla_flag) g 


d_change_task_c_opened_on_mysql.sql :: 



SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from intuit_mdsdb.change_task_final a
left join intuit_mdwdb.d_change_task_c c 
on  a.sys_id = c.ROW_ID and a.sourceinstance=c.source_id
where convert_tz(a.opened_at,'GMT' ,'America/Los_Angeles') <> c.opened_on) g 


d_change_task_c_short_description_mysql.sql :: 



SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from intuit_mdsdb.change_task_final a
left join intuit_mdwdb.d_change_task_c c 
on  a.sys_id = c.ROW_ID and a.sourceinstance=c.source_id
where a.short_description  <> c.short_description) g 


d_change_task_c_time_to_assign_change_task_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from intuit_mdsdb.change_task_final b
left join intuit_mdsdb.sys_audit_final a
on  b.sys_id =a.documentkey
left  JOIN  (select ROW_ID , source_id, time_to_assign_change_task,created_on
from intuit_mdwdb.d_change_task_c) c
on  b.sys_id = c.ROW_ID and b.sourceinstance=c.source_id
where  (tablename='change_task'and fieldname='assigned_to' and a.oldvalue is null) 
and c.time_to_assign_change_task <> coalesce(convert_tz(a.sys_created_on,'GMT','America/Los_Angeles'),c.created_on)
) temp 


d_configuration_item_change_control_c_key_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from 
(
select d.change_control_c_key,
COALESCE((CASE WHEN COALESCE(CONCAT('GROUP~',i.change_control),'UNSPECIFIED') = 'UNSPECIFIED'
						THEN 0
						ELSE (
 (j.row_key) 	)	END	), -1) AS change_control_key 
FROM intuit_mdsdb.cmdb_ci_appl_final i left join intuit_mdwdb.d_internal_organization  j
on j.row_id =COALESCE(CONCAT('GROUP~',i.change_control),'UNSPECIFIED') AND i.sourceinstance=j.source_id
left join intuit_mdwdb.d_configuration_item d on i.sys_id=d.row_id AND i.sourceinstance=d.source_id
)a
where a.change_control_c_key<>COALESCE(a.change_control_key,0))temp 


d_configuration_item_offering_core_c_flag_mysql.sql :: 



SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from 
(SELECT c.sys_id AS sys_id,
		   a.sourceinstance AS sourceinstance,
		  	   CASE
			   WHEN MAX(a.u_core) = 1 THEN 'Y'
			   ELSE 'N'
		   END AS offering_core_c from 		   
    intuit_mdsdb.u_cmdb_ci_offering_final a
	LEFT JOIN intuit_mdsdb.cmdb_rel_ci_final b ON (a.sys_id=b.parent)
	LEFT JOIN intuit_mdsdb.cmdb_ci_final c ON (b.child=c.sys_id)
	GROUP BY 1,2)t 
left join intuit_mdwdb.d_configuration_item d
on t.sys_id=d.row_id and t.sourceinstance = d.source_id
where t.offering_core_c <> d.offering_core_c_flag) temp
 


d_configuration_item_offering_name_c_mysql.sql :: 



SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from 
(SELECT c.sys_id AS sys_id,
		   a.sourceinstance AS sourceinstance,
		   MAX(a.name) AS offering_name_c from 		   
    intuit_mdsdb.u_cmdb_ci_offering_final a
	LEFT JOIN intuit_mdsdb.cmdb_rel_ci_final b ON (a.sys_id=b.parent)
	LEFT JOIN intuit_mdsdb.cmdb_ci_final c ON (b.child=c.sys_id)
	GROUP BY 1,2)t 
left join intuit_mdwdb.d_configuration_item d
on t.sys_id=d.row_id and t.sourceinstance = d.source_id
where t.offering_name_c <> d.offering_name_c) temp 


d_configuration_item_offering_type_c_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from 
(SELECT c.sys_id AS sys_id,
		   a.sourceinstance AS sourceinstance,
		   		   MAX(u_offering_type) AS offering_type_c from 		   
    intuit_mdsdb.u_cmdb_ci_offering_final a
	LEFT JOIN intuit_mdsdb.cmdb_rel_ci_final b ON (a.sys_id=b.parent)
	LEFT JOIN intuit_mdsdb.cmdb_ci_final c ON (b.child=c.sys_id)
	GROUP BY 1,2)t 
left join intuit_mdwdb.d_configuration_item d
on t.sys_id=d.row_id and t.sourceinstance = d.source_id
where t.offering_type_c <> d.offering_type_c) temp
 


d_configuration_item_u_bufg12_c_mysql.sql :: 


 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from intuit_mdsdb.cmdb_ci_final s
join intuit_mdsdb.u_bufg_final c ON (s.u_bufg_l2=c.sys_id)
left join intuit_mdwdb.d_configuration_item t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
where c.u_name <> t.u_bufg12_c) temp
 


d_configuration_item_u_bufg13_c_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from intuit_mdsdb.cmdb_ci_final s
join intuit_mdsdb.u_bufg_final c ON (s.u_bufg_l3=c.sys_id)
left join intuit_mdwdb.d_configuration_item t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
where c.u_name <> t.u_bufg13_c) temp 


d_configuration_item_u_bufg14_c_mysql.sql :: 



SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from intuit_mdsdb.cmdb_ci_final s
join intuit_mdsdb.u_bufg_final c ON (s.u_bufgl4=c.sys_id)
left join intuit_mdwdb.d_configuration_item t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
where c.u_name <> t.bufg14_c) temp
 


d_incident_close_notes_c_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from intuit_mdsdb.incident_final s
left join intuit_mdwdb.d_incident t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
where t.close_notes_c <> s.close_notes) temp 


d_incident_detect_on_c_mysql.sql :: 



SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from intuit_mdsdb.incident_final s
left join intuit_mdwdb.d_incident t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
where t.detect_on_c <>CONVERT_TZ(s.u_detect_date,'GMT','America/Los_Angeles')) temp 


d_incident_engagement_on_c_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from intuit_mdsdb.incident_final s
left join intuit_mdwdb.d_incident t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
where t.engagement_on_c <>CONVERT_TZ(s.u_engagement_timestamp,'GMT','America/Los_Angeles')) temp 


d_incident_first_call_resolution_mysql.sql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from intuit_mdsdb.incident_final b 
left JOIN intuit_mdwdb.d_incident a
ON a.row_id = b.sys_id AND a.source_id = b.sourceinstance
where a.first_call_resolution_flag <> CASE WHEN b.u_fcr=1 THEN 'Y' ELSE 'N'END)g


 


d_incident_major_incident_flag_mysql.sql :: 



SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from intuit_mdsdb.incident_final a
left join intuit_mdwdb.d_incident c 
on  a.sys_id = c.ROW_ID and a.sourceinstance=c.source_id
where c.major_incident_flag <> CASE WHEN a.u_major_incident=1 THEN 'Y' ELSE 'N'END) g 


d_incident_repair_date_on_c_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from intuit_mdsdb.incident_final s
left join intuit_mdwdb.d_incident t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
where t.repair_date_on_c <>CONVERT_TZ(s.u_repair_date,'GMT','America/Los_Angeles')) temp 


d_incident_resolver_group_c_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from intuit_mdsdb.incident_final s
left join intuit_mdwdb.d_incident t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
LEFT JOIN intuit_mdsdb.sys_user_group_final c
ON s.u_resolver_group = c.sys_id
where t.resolver_group_c <> COALESCE(c.name,'UNSPECIFIED')) temp 


d_incident_solution_on_c_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from intuit_mdsdb.incident_final s
left join intuit_mdwdb.d_incident t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
where t.solution_on_c <> CONVERT_TZ(s.u_solution_timestamp,'GMT','America/Los_Angeles')) temp

 


d_incident_started_on_c_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from intuit_mdsdb.incident_final s
left join intuit_mdwdb.d_incident t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
where t.started_on_c <> CONVERT_TZ(s.u_start_date,'GMT','America/Los_Angeles')) temp


 


d_incident_task_c_active_flag_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from intuit_mdsdb.u_incident_task_final s
left join intuit_mdwdb.d_incident_task_c t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
where case when active='0' then 'N' else 'Y' end <> active_flag  ) temp 


d_incident_task_c_backlog_flag_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from intuit_mdsdb.u_incident_task_final  a
left join intuit_mdwdb.d_incident_task_c b
on a.sys_id=b.row_id and a.sourceinstance=b.source_id 
left join (select incident_task_key,source_id,state_src_key from intuit_mdwdb.f_incident_task_c)l1
ON b.row_key=l1.incident_task_key  AND  b.source_id=l1.source_id 
left join intuit_mdwdb.d_lov_map l2
on l1.state_src_key=l2.src_key 
WHERE case when l2.dimension_class = 'STATE~U_INCIDENT_TASK' AND    l2.dimension_wh_code NOT IN( 'RESOLVED','CLOSED') then 'Y' else 'N'
end <> b.backlog_flag ) temp


 


d_incident_task_c_changed_by_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from intuit_mdsdb.u_incident_task_final  a
left join intuit_mdwdb.d_incident_task_c b
on a.sys_id=b.row_id and a.sourceinstance=b.source_id 
WHERE a.sys_updated_by <> b.changed_by ) temp 


d_incident_task_c_changed_on_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from intuit_mdsdb.u_incident_task_final s
left join intuit_mdwdb.d_incident_task_c t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
where CONVERT_TZ(s.sys_updated_on,'GMT','America/Los_Angeles')<>t.changed_on) temp 


d_incident_task_c_closed_on_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from intuit_mdsdb.u_incident_task_final s
left join intuit_mdwdb.d_incident_task_c t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
where CONVERT_TZ(s.closed_at,'GMT','America/Los_Angeles')<>t.closed_on) temp 


d_incident_task_c_created_by_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from intuit_mdsdb.u_incident_task_final  a
left join intuit_mdwdb.d_incident_task_c b
on a.sys_id=b.row_id and a.sourceinstance=b.source_id 
WHERE a.sys_created_by <> b.created_by ) temp 


d_incident_task_c_created_on_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from intuit_mdsdb.u_incident_task_final s
left join intuit_mdwdb.d_incident_task_c t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
where CONVERT_TZ(s.sys_created_on,'GMT','America/Los_Angeles')<>t.created_on) temp 


d_incident_task_c_description_mysql.sql :: 



SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from intuit_mdsdb.u_incident_task_final  a
left join intuit_mdwdb.d_incident_task_c b
on a.sys_id=b.row_id and a.sourceinstance=b.source_id 
WHERE a.description <> b.description ) temp 


d_incident_task_c_domain_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from intuit_mdsdb.u_incident_task_final s
left join intuit_mdwdb.d_incident_task_c t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
where COALESCE(s.sys_domain,'UNSPECIFIED') <> t.domain  ) temp 


d_incident_task_c_dormant_flag_mysql.sql :: 





SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from intuit_mdsdb.u_incident_task_final  a
left join intuit_mdwdb.d_incident_task_c b
on a.sys_id=b.row_id and a.sourceinstance=b.source_id 
left join intuit_mdwdb.f_incident_task_c l1
ON b.row_key=l1.incident_task_key  AND  b.source_id=l1.source_id 
left join intuit_mdwdb.d_lov_map l2
on l1.state_src_key=l2.src_key 
WHERE case when  timestampdiff(day,b.changed_on,(SELECT MAX(lastupdated) AS lastupdated
FROM intuit_mdwdb.d_o_data_freshness WHERE sourcename like 'ServiceNow%'))>30 AND  l2.dimension_wh_code='OPEN' then 'Y' else 'N'
end <> b.dormant_flag ) temp

 


d_incident_task_c_due_on_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from intuit_mdsdb.u_incident_task_final s
left join intuit_mdwdb.d_incident_task_c t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
where CONVERT_TZ(s.due_date,'GMT','America/Los_Angeles')<>t.due_on) temp 


d_incident_task_c_incident_task_key_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from intuit_mdsdb.u_incident_task_final s
left join intuit_mdwdb.f_incident_task_c t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
left join intuit_mdwdb.d_incident_task_c lkp
on s.sys_id=lkp.row_id and s.sourceinstance = lkp.source_id
WHERE lkp.row_key <> t.incident_task_key) temp 


d_incident_task_c_incident_task_number_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from intuit_mdsdb.u_incident_task_final s
left join intuit_mdwdb.d_incident_task_c t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
where s.number<>t.incident_task_number) temp 


d_incident_task_c_incident_task_type_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from intuit_mdsdb.u_incident_task_final  a
left join intuit_mdwdb.d_incident_task_c b
on a.sys_id=b.row_id and a.sourceinstance=b.source_id 
WHERE a.u_sub_type  <> b.incident_task_type ) temp 


d_incident_task_c_last_resolved_on_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from intuit_mdsdb.u_incident_task_final s
left join intuit_mdwdb.d_incident_task_c t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
where CONVERT_TZ(s.u_actual_resolve_date,'GMT','America/Los_Angeles')<>t.last_resolved_on) temp 


d_incident_task_c_met_sla_flag_mysql.sql :: 




SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN count(1) > 0  THEN 'Data did not Match.' ELSE 'Data Matched'  end As Result
from intuit_mdsdb.u_incident_task_final s
LEFT JOIN intuit_mdwdb.d_incident_task_c t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
LEFT JOIN
  (SELECT incident_task_c_key, CASE WHEN (Count(incident_task_c_key)- Sum(CASE WHEN outcome_flag= 'N' THEN 1 ELSE 0 END)) = 0 THEN 'Y' ELSE 'N' END AS outcome_flag
   FROM intuit_mdwdb.f_task_sla
   where incident_task_c_key <> -1
   GROUP BY incident_task_c_key) AS tbd ON t.row_key=tbd.incident_task_c_key
where  t.met_sla_flag <> coalesce(tbd.outcome_flag,case when s.made_sla=1 then 'Y' else 'N' end) 


d_incident_task_c_opened_on_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from intuit_mdsdb.u_incident_task_final s
left join intuit_mdwdb.d_incident_task_c t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
where CONVERT_TZ(s.opened_at,'GMT','America/Los_Angeles')<>t.opened_on) temp 


d_incident_task_c_over_due_flag_mysql.sql :: 




SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1)  as cnt
from intuit_mdsdb.u_incident_task_final s
left join intuit_mdwdb.d_incident_task_c t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
where case when active= 1 and due_date < (SELECT MAX(lastupdated) AS lastupdated
FROM intuit_mdwdb.d_o_data_freshness WHERE sourcename like 'ServiceNow%') then 'Y' else 'N' end <> t.over_due_flag) a; 


d_incident_task_c_short_description_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from intuit_mdsdb.u_incident_task_final  a
left join intuit_mdwdb.d_incident_task_c b
on a.sys_id=b.row_id and a.sourceinstance=b.source_id 
WHERE a.short_description <> b.short_description ) temp 


d_incident_ticket_description_c_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from intuit_mdsdb.incident_final s
left join intuit_mdwdb.d_incident t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
where t.ticket_description_c <> s.description) temp 


d_incident_ticket_short_description_c_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from intuit_mdsdb.incident_final s
left join intuit_mdwdb.d_incident t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
where t.ticket_short_description_c<>SUBSTRING(s.short_description, 200)) temp 


d_internal_contact_department_display_c_mysql.sql :: 



SELECT  CASE WHEN COUNT(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result,
CASE WHEN COUNT(1) > 0 THEN 'MDS to DWH data validation failed between cmdb_ci_final and d_configuration_item' ELSE 'SUCCESS' END AS Message
from intuit_mdwdb.d_internal_contact TRGT join 
intuit_mdsdb.sys_user_final SRC on TRGT.row_id = concat('INTERNAL_CONTACT~',SRC.sys_id )
and TRGT.source_id=SRC.sourceinstance 
where TRGT.department_display_c<>SRC.u_intuitdepartmentdisplay 


d_internal_contact_employee_type_c_mysql.sql :: 


SELECT  CASE WHEN COUNT(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result,
CASE WHEN COUNT(1) > 0 THEN 'MDS to DWH data validation failed between cmdb_ci_final and d_configuration_item' ELSE 'SUCCESS' END AS Message
from intuit_mdwdb.d_internal_contact TRGT join 
intuit_mdsdb.sys_user_final SRC on TRGT.row_id = concat('INTERNAL_CONTACT~',SRC.sys_id )
and TRGT.source_id=SRC.sourceinstance 
where TRGT.employee_type_c<>SRC.u_employee_type 


d_internal_contact_group_display_c_mysql.sql :: 


SELECT  CASE WHEN COUNT(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result,
CASE WHEN COUNT(1) > 0 THEN 'MDS to DWH data validation failed between cmdb_ci_final and d_configuration_item' ELSE 'SUCCESS' END AS Message
from intuit_mdwdb.d_internal_contact TRGT join 
intuit_mdsdb.sys_user_final SRC on TRGT.row_id = concat('INTERNAL_CONTACT~',SRC.sys_id )
and TRGT.source_id=SRC.sourceinstance 
where TRGT.group_display_c<>SRC.u_intuitgroupdisplay 


d_internal_contact_manager_c_key_mysql.sql :: 


SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem.manager_c_key' ELSE 'SUCCESS' END as Message 
  from intuit_mdsdb.sys_user_final b
left join intuit_mdwdb.d_internal_contact a
ON a.row_id = concat('INTERNAL_CONTACT~',b.sys_id ) AND a.source_id = b.sourceinstance 
left join intuit_mdwdb.d_internal_contact c
on   c.row_id = concat('INTERNAL_CONTACT~',b.manager) AND c.source_id = b.sourceinstance 

where a.manager_c_key  <>	CASE 
							WHEN manager is null  THEN 0 
							ELSE COALESCE(c.row_key, -1) END; 
 


d_internal_contact_site_name_c_mysql.sql :: 


SELECT  CASE WHEN COUNT(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result,
CASE WHEN COUNT(1) > 0 THEN 'MDS to DWH data validation failed between cmdb_ci_final and d_configuration_item' ELSE 'SUCCESS' END AS Message
from intuit_mdwdb.d_internal_contact TRGT join 
intuit_mdsdb.sys_user_final SRC on TRGT.row_id = concat('INTERNAL_CONTACT~',SRC.sys_id )
and TRGT.source_id=SRC.sourceinstance 
where TRGT.site_name_c<>SRC.u_intuitusersitename
 


d_kb_knowledge_c_changed_by_mysql.sql :: 



SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
 FROM intuit_mdsdb.kb_knowledge_final src
left join intuit_mdwdb.d_kb_knowledge_c tgt
on src.sys_id=tgt.row_id and src.sourceinstance=tgt.source_id
where src.sys_updated_by <> tgt.changed_by
) temp 


d_kb_knowledge_c_changed_on_mysql.sql :: 



SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
 FROM intuit_mdsdb.m2m_kb_task_final src
left join intuit_mdwdb.f_kb_task_c tgt
on src.sys_id=tgt.row_id and src.sourceinstance=tgt.source_id
where 
CONVERT_TZ(src.sys_updated_on,'GMT','America/Los_Angeles')<>
 tgt.changed_on
) temp 


d_kb_knowledge_c_class_name_mysql.sql :: 



SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
 FROM intuit_mdsdb.kb_knowledge_final src
left join intuit_mdwdb.d_kb_knowledge_c tgt
on src.sys_id=tgt.row_id and src.sourceinstance=tgt.source_id
where src.sys_class_name <> tgt.class_name
) temp 


d_kb_knowledge_c_created_by_mysql.sql :: 



SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
 FROM intuit_mdsdb.kb_knowledge_final src
left join intuit_mdwdb.d_kb_knowledge_c tgt
on src.sys_id=tgt.row_id and src.sourceinstance=tgt.source_id
where src.sys_created_by <> tgt.created_by
) temp 


d_kb_knowledge_c_created_on_mysql.sql :: 



SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
 FROM intuit_mdsdb.kb_knowledge_final src
left join intuit_mdwdb.d_kb_knowledge_c tgt
on src.sys_id=tgt.row_id and src.sourceinstance=tgt.source_id
where convert_tz(src.sys_created_on,'GMT','America/los_Angeles') <> tgt.created_on
) temp 


d_kb_knowledge_c_kb_author_key_mysql.sql :: 



SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
 FROM intuit_mdsdb.kb_knowledge_final src
left join intuit_mdwdb.d_kb_knowledge_c tgt
on src.sys_id=tgt.row_id and src.sourceinstance=tgt.source_id
left join intuit_mdwdb.d_internal_contact lkp
 ON ( concat('INTERNAL_CONTACT~',src.author)= lkp.row_id 
AND src.sourceinstance= lkp.source_id)
where 
lkp.row_key <> tgt.author_key
) temp 


d_kb_knowledge_c_kb_category_mysql.sql :: 




SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
 FROM intuit_mdsdb.kb_knowledge_final src
left join intuit_mdwdb.d_kb_knowledge_c tgt
on src.sys_id=tgt.row_id and src.sourceinstance=tgt.source_id
left join intuit_mdsdb.kb_category_final lkp
 ON lkp.sys_id=src.kb_category and src.sourceinstance=lkp.sourceinstance
where 
lkp.label <> tgt.kb_category
) temp 


d_kb_knowledge_c_kb_knowledge_base_mysql.sql :: 



SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
 FROM intuit_mdsdb.kb_knowledge_final src
left join intuit_mdwdb.d_kb_knowledge_c tgt
on src.sys_id=tgt.row_id and src.sourceinstance=tgt.source_id
left join intuit_mdsdb.kb_knowledge_base_final lkp
on src.kb_knowledge_base = lkp.sys_id and src.sourceinstance=src.sourceinstance
where lkp.title  <> tgt.kb_knowledge_base
) temp 


d_kb_knowledge_c_knowledge_number_mysql.sql :: 



SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
 FROM intuit_mdsdb.kb_knowledge_final src
left join intuit_mdwdb.d_kb_knowledge_c tgt
on src.sys_id=tgt.row_id and src.sourceinstance=tgt.source_id
where src.number<>tgt.knowledge_number
) temp 


d_kb_knowledge_c_published_on_mysql.sql :: 



SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
 FROM intuit_mdsdb.kb_knowledge_final src
left join intuit_mdwdb.d_kb_knowledge_c tgt
on src.sys_id=tgt.row_id and src.sourceinstance=tgt.source_id
where convert_tz(src.published,'GMT','America/Los_Angeles') <> tgt.published_on
) temp 


d_kb_knowledge_c_short_description_mysql.sql :: 



SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
 FROM intuit_mdsdb.kb_knowledge_final src
left join intuit_mdwdb.d_kb_knowledge_c tgt
on src.sys_id=tgt.row_id and src.sourceinstance=tgt.source_id
where src.short_description <> tgt.short_description
) temp 


d_kb_knowledge_c_topic_key_mysql.sql :: 



SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
 FROM intuit_mdsdb.kb_knowledge_final src
left join intuit_mdwdb.d_kb_knowledge_c tgt
on src.sys_id=tgt.row_id and src.sourceinstance=tgt.source_id
left join intuit_mdwdb.d_lov lkp
 ON ( CONCAT('TOPIC','~','KB_KNOWLEDGE','~','~','~',UPPER(src.topic)))= lkp.src_rowid 
AND src.sourceinstance= lkp.source_id 
where 
lkp.row_key <> tgt.topic_key
) temp 


d_kb_knowledge_c_use_count_mysql.sql :: 



SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
 FROM intuit_mdsdb.kb_knowledge_final src
left join intuit_mdwdb.d_kb_knowledge_c tgt
on src.sys_id=tgt.row_id and src.sourceinstance=tgt.source_id
where src.use_count <> tgt.use_count
) temp 


d_kb_knowledge_c_valid_to_mysql.sql :: 



SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
 FROM intuit_mdsdb.kb_knowledge_final src
left join intuit_mdwdb.d_kb_knowledge_c tgt
on src.sys_id=tgt.row_id and src.sourceinstance=tgt.source_id
where convert_tz(src.valid_to,'GMT','America/Los_Angeles') <> tgt.valid_to
) temp 


d_kb_knowledge_c_view_count_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
 FROM intuit_mdsdb.kb_knowledge_final src
left join intuit_mdwdb.d_kb_knowledge_c tgt
on src.sys_id=tgt.row_id and src.sourceinstance=tgt.source_id
where src.sys_view_count <> tgt.view_count
) temp 


d_kb_knowledge_c_workflow_state_key_mysql.sql :: 



SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
 FROM intuit_mdsdb.kb_knowledge_final src
left join intuit_mdwdb.d_kb_knowledge_c tgt
on src.sys_id=tgt.row_id and src.sourceinstance=tgt.source_id
left join intuit_mdwdb.d_lov lkp
 ON ( CONCAT('WORKFLOW_STATE','~','KB_KNOWLEDGE','~','~','~',UPPER(workflow_state)))= lkp.src_rowid 
AND src.sourceinstance= lkp.source_id 
where 
lkp.row_key <> tgt.workflow_state_key
) temp 


d_outage_c_agents_impacted_flag_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from intuit_mdsdb.cmdb_ci_outage_final i
LEFT JOIN intuit_mdsdb.incident_final inf ON i.task_number=inf.sys_id
left join intuit_mdwdb.d_outage_c t on i.sys_id=t.row_id and i.sourceinstance = t.source_id
WHERE (t.agents_impacted_flag) <> CASE WHEN i.u_agents_impacted = 1 THEN 'Y'  ELSE 'N' END  )temp 


d_outage_c_detect_date_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from intuit_mdsdb.cmdb_ci_outage_final s
left join intuit_mdwdb.d_outage_c t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
left join intuit_mdwdb.d_calendar_date  lkp
on lkp.row_id = s.u_detect_date
and lkp.source_id = s.sourceinstance
WHERE lkp.row_key <> t.detect_date) temp  


d_outage_c_executive_summary_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt from intuit_mdsdb.cmdb_ci_outage_final i 
left join intuit_mdsdb.incident_final inf ON i.task_number=inf.sys_id
left join intuit_mdwdb.d_outage_c t on t.row_id=i.sys_id and t.source_id=i.sourceinstance
where t.executive_summary<>inf.u_executive_summary )b
 


d_outage_c_outage_end_date_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt from intuit_mdsdb.cmdb_ci_outage_final i
LEFT JOIN intuit_mdsdb.incident_final inf ON i.task_number=inf.sys_id
left join intuit_mdwdb.d_outage_c t
on i.sys_id=t.row_id and i.sourceinstance = t.source_id
WHERE t.outage_end_date <> CONVERT_TZ(i.END,'GMT' ,'America/Los_Angeles')) temp 
 


d_outage_c_outage_number_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt from intuit_mdsdb.cmdb_ci_outage_final s
 left  JOIN  intuit_mdwdb.d_outage_c t
on  s.SYS_ID= t.ROW_ID and s.sourceinstance=t.source_id
where s.u_number<>t.outage_number )b 


d_outage_c_outage_start_date_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from intuit_mdsdb.cmdb_ci_outage_final s
left join intuit_mdwdb.d_outage_c t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
WHERE CONVERT_TZ(s.begin,'GMT' ,'America/Los_Angeles') <> t.outage_start_date) temp 


d_outage_c_outage_type_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt from intuit_mdsdb.cmdb_ci_outage_final s
 left  JOIN  intuit_mdwdb.d_outage_c t
on  s.SYS_ID= t.ROW_ID and s.sourceinstance=t.source_id
where s.TYPE<>t.outage_type )b
 


d_outage_c_revenue_impacted_flag_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt from intuit_mdsdb.cmdb_ci_outage_final s
 left  JOIN  intuit_mdwdb.d_outage_c t
on  s.SYS_ID= t.ROW_ID and s.sourceinstance=t.source_id
where CASE
			WHEN s.u_revenue_impacted = 1 THEN 'Y'
		ELSE 'N'
		END <>t.revenue_impacted_flag )b
 


d_outage_c_short_description_mysql_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt from intuit_mdsdb.cmdb_ci_outage_final s
 left  JOIN  intuit_mdwdb.d_outage_c t
on  s.SYS_ID= t.ROW_ID and s.sourceinstance=t.source_id
where s.short_description<>t.short_description )b 


d_outage_c_users_impacted_flag_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from intuit_mdsdb.cmdb_ci_outage_final s
 left  JOIN  intuit_mdwdb.d_outage_c t
on  s.SYS_ID= t.ROW_ID and s.sourceinstance=t.source_id
where case when s.u_number_of_users >0 then 'Y' else 'N' end <>t.users_impacted_flag  )b 


d_problem_enterprise_problem_c_flag_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from intuit_mdsdb.problem_final s
left join intuit_mdwdb.d_problem t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
where t.enterprise_problem_c_flag  <> CASE WHEN COALESCE(s.u_enterprise_problem,0)=1 THEN 'Y' ELSE 'N' END) temp 


d_problem_major_problem_c_flag_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from intuit_mdsdb.problem_final s
left join intuit_mdwdb.d_problem t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
where t.major_problem_c_flag  <> CASE WHEN COALESCE(s.u_major_problem,0)=1 THEN 'Y' ELSE 'N'END) temp 


d_problem_met_sla_flag_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from intuit_mdwdb.f_problem s
left join intuit_mdwdb.d_problem t 
on s.row_id=t.row_id and s.source_id=t.source_id
where t.met_sla_flag <> case when s.state_src_code=4 and s.priority_src_code IN ( '1', '2' )AND Timestampdiff(day, t.opened_on,t.post_mortem_schedule_c) BETWEEN 0 AND 2 
THEN 'Y' ELSE 'N' END
) temp

 


d_problem_post_mortem_schedule_c_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from intuit_mdsdb.problem_final s
left join intuit_mdwdb.d_problem t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
where t.post_mortem_schedule_c<>CONVERT_TZ(s.u_post_mortem_schedule_date,'GMT' ,'America/Los_Angeles')) temp 


d_problem_root_cause_description_c_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from intuit_mdsdb.problem_final s
left join intuit_mdwdb.d_problem t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
where t.root_cause_description_c <> s.u_root_cause_description) temp 


d_problem_task_benifit_c_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from intuit_mdwdb.d_problem_task a 
 inner join intuit_mdsdb.problem_task_final b
 on b.sys_id=a.row_id and b.sourceinstance=a.source_id 
where a.benifit_c<>b.u_benefit ) temp 


d_problem_task_executive_summary_c_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from intuit_mdwdb.d_problem_task a 
 inner join intuit_mdsdb.problem_task_final b
 on b.sys_id=a.row_id and b.sourceinstance=a.source_id 
where a.executive_summary_c<>b.u_executive_summary ) temp 


d_problem_task_met_sla_flag_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from intuit_mdsdb.problem_task_final a
left join intuit_mdwdb.d_problem_task c 
on  a.sys_id = c.ROW_ID and a.sourceinstance=c.source_id
where 
c.met_sla_flag <> CASE WHEN(IF(a.u_due_date_extended_count > 0, 0, IF (c.closed_on > c.due_on, 0, 1)))=1 THEN 'Y'
ELSE 'N' END
) g 


d_problem_task_over_due_flag_mysql.sql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from intuit_mdwdb.d_problem_task a
left join intuit_mdwdb.f_problem_task b
on  a.row_id=b.row_id AND a.source_id=b.source_id 
WHERE a.over_due_flag  <>  CASE WHEN a.due_on < (SELECT MAX(lastupdated) AS lastupdated
FROM intuit_mdwdb.d_o_data_freshness WHERE sourcename like 'ServiceNow%') AND b.state_src_code NOT IN (3,4,7)THEN 'Y' ELSE 'N' END) temp 


d_problem_task_pctn_complete_c_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from intuit_mdwdb.d_problem_task a 
 inner join intuit_mdsdb.problem_task_final b
 on b.sys_id=a.row_id and b.sourceinstance=a.source_id 
where a.pctn_complete_c<>b.u_pctn_complete ) temp 


d_problem_task_solving_for_c_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from intuit_mdwdb.d_problem_task a 
 inner join intuit_mdsdb.problem_task_final b
 on b.sys_id=a.row_id and b.sourceinstance=a.source_id 
where a.solving_for_c<>b.u_solving_for ) temp 


d_problem_task_upcoming_over_due_c_flag_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from intuit_mdwdb.d_problem_task a 
 inner join intuit_mdwdb.f_problem_task b on a.row_id=b.row_id and a.source_id=b.source_id 
where a.upcoming_over_due_c_flag <>
case when a.due_on between (SELECT MAX(lastupdated) AS lastupdated
FROM intuit_mdwdb.d_o_data_freshness WHERE sourcename like 'ServiceNow%') and date_add((SELECT MAX(lastupdated) AS lastupdated
FROM intuit_mdwdb.d_o_data_freshness WHERE sourcename like 'ServiceNow%'),INTERVAL 7 DAY)  and  b.state_src_code not in(3,4,7) then 'Y' else  'N' end
  )temp 


d_problem_work_notes_c_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from intuit_mdsdb.problem_final s
left join intuit_mdwdb.d_problem t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
where t.work_notes_c <> s.work_notes) temp 


d_request_item_met_sla_flag_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from intuit_mdwdb.d_request_item a 
where   met_sla_flag <>  CASE  WHEN TIMESTAMPDIFF(day, opened_on, closed_on) <= 4 THEN 'Y' 
 ELSE 'N' end
) g 


f_change_request_approved_to_close_duration_c.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt  
from intuit_mdsdb.change_request_final a
 left  JOIN  intuit_mdwdb.f_change_request b
on  a.sys_id = b.ROW_ID and a.sourceinstance=b.source_id
 where  timestampdiff(SECOND,a.approval_set,a.closed_at) <> b.approved_to_close_duration_c )b

 


f_change_request_client_c_key_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from intuit_mdsdb.change_request_final s
left join intuit_mdwdb.f_change_request t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
left join intuit_mdwdb.d_internal_contact lkp
on COALESCE(CONCAT('INTERNAL_CONTACT~',s.u_client),'UNSPECIFIED')=lkp.row_id and s.sourceinstance = lkp.source_id
where lkp.row_key<>client_c_key) temp 


f_change_request_completion_src_c_key_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from intuit_mdsdb.change_request_final s
left join intuit_mdwdb.f_change_request t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
left join intuit_mdwdb.d_lov lkp
on COALESCE(CONCAT('U_COMPLETION_CODE~CHANGE_REQUEST','~','~','~',s.u_completion_code),'UNSPECIFIED')=lkp.row_id 
and s.sourceinstance = lkp.source_id
where lkp.row_key <> t.completion_src_c_key) temp 


f_change_request_completion_src_code_c_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from intuit_mdsdb.change_request_final s
left join intuit_mdwdb.f_change_request t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
WHERE  t.completion_src_code_c <> s.u_completion_code) temp 


f_change_request_expected_downtime_duration_c_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from intuit_mdsdb.change_request_final s
left join intuit_mdwdb.f_change_request t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
where COALESCE(TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',s.u_expected_downtime_duration),0)
 <> t.expected_downtime_duration_c) temp 


f_change_request_parent_c_key_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt  
from intuit_mdsdb.change_request_final a
 left  JOIN  intuit_mdwdb.f_change_request b
on  a.sys_id = b.ROW_ID and a.sourceinstance=b.source_id
left join (select row_id,row_key from intuit_mdwdb.d_request_task) c
on a.parent = c.row_id
 where  c.row_key <> b.parent_c_key ) temp
 


f_change_request_qa_approver_c_key_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from intuit_mdsdb.change_request_final s
left join intuit_mdwdb.f_change_request t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
left join intuit_mdwdb.d_internal_contact lkp
on COALESCE(CONCAT('INTERNAL_CONTACT~',s.u_qa_approver),'UNSPECIFIED')=lkp.row_id and s.sourceinstance = lkp.source_id
where COALESCE(TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',s.u_expected_downtime_duration),0)
 <> t.expected_downtime_duration_c) temp 


f_change_request_rejection_count_c_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from intuit_mdsdb.change_request_final s
left join intuit_mdwdb.f_change_request t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
where t.rejection_count_c <>s.u_rejection_count) temp 


f_change_request_sub_category_src_c_key_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from intuit_mdsdb.change_request_final s
left join intuit_mdwdb.f_change_request t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
left join intuit_mdwdb.d_lov lkp
on COALESCE(CONCAT('U_SUB_CATEGORY~CHANGE_REQUEST','~','~','~',s.u_sub_category),'UNSPECIFIED')=lkp.row_id 
and s.sourceinstance = lkp.source_id
where lkp.row_key <> t.sub_category_src_c_key) temp 


f_change_request_sub_category_src_code_c_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from intuit_mdsdb.change_request_final s
left join intuit_mdwdb.f_change_request t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
where t.sub_category_src_code_c <> s.u_sub_category) temp 


f_change_task_c-assignment_group_key_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from  intuit_mdsdb.change_task_final a
left join intuit_mdwdb.f_change_task_c c 
on  a.sys_id = c.ROW_ID and a.sourceinstance=c.source_id
LEFT JOIN intuit_mdwdb.d_internal_organization LKP 
 ON COALESCE(CONCAT('GROUP~',a.assignment_group),'UNSPECIFIED') =LKP.row_id 
AND a.sourceinstance= LKP.source_id 
 WHERE COALESCE(LKP.row_key,CASE WHEN a.assignment_group IS NULL THEN 0 else '-1' end)
<> COALESCE(c.assignment_group_key,''))g 


f_change_task_c_assigned_to_key_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from  intuit_mdsdb.change_task_final a
left join intuit_mdwdb.f_change_task_c c 
on  a.sys_id = c.ROW_ID and a.sourceinstance=c.source_id
LEFT JOIN intuit_mdwdb.d_internal_contact LKP 
ON COALESCE(CONCAT('INTERNAL_CONTACT~',a.assigned_to ),'UNSPECIFIED')= LKP.row_id
AND a.sourceinstance= LKP.source_id  
WHERE COALESCE(LKP.row_key, CASE WHEN a.assigned_to IS NULL THEN 0 else '-1' end)
<> COALESCE(c.assigned_to_key,''))g
 


f_change_task_c_change_request_key_mysql.sql :: 


 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.'
ELSE 'Data Matched' END AS Message
FROM (
select count(1) as cnt
from intuit_mdsdb.change_task_final a
left join intuit_mdwdb.f_change_task_c c on a.sys_id=c.row_id 
and a.sourceinstance=c.source_id
left join intuit_mdwdb.d_change_request b on 
a.parent = b.row_id and a.sourceinstance=b.source_id 
where c.change_request_key <> b.row_key) g 


f_change_task_c_change_task_key_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from intuit_mdsdb.change_task_final a
left join intuit_mdwdb.f_change_task_c c 
on  a.sys_id = c.ROW_ID and a.sourceinstance=c.source_id
left join intuit_mdwdb.d_change_task_c b
on  a.sys_id = b.ROW_ID
where c.change_task_key <> b.row_key) g 


f_change_task_c_change_task_number_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from intuit_mdsdb.change_task_final a
left join intuit_mdwdb.f_change_task_c c 
on  a.sys_id = c.ROW_ID and a.sourceinstance=c.source_id
where a.number <> c.change_task_number) g 


f_change_task_c_client_key_mysql.sql :: 


 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.'
ELSE 'Data Matched' END AS Message
FROM (
select count(1) as cnt 
from  intuit_mdsdb.change_task_final a
left join intuit_mdwdb.f_change_task_c c 
on  a.sys_id = c.ROW_ID and a.sourceinstance=c.source_id
LEFT JOIN intuit_mdwdb.d_internal_contact LKP 
ON concat('INTERNAL_CONTACT~',a.u_client)  = LKP.row_id
AND a.sourceinstance= LKP.source_id  
WHERE LKP.row_key <> c.client_key) g 


f_change_task_c_closed_by_key_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from intuit_mdsdb.change_task_final a
left join intuit_mdwdb.f_change_task_c c 
on  a.sys_id = c.ROW_ID and a.sourceinstance=c.source_id
LEFT JOIN intuit_mdwdb.d_internal_contact LKP 
 ON COALESCE(CONCAT('INTERNAL_CONTACT~',a.CLOSED_BY),'UNSPECIFIED')  = LKP.row_id 
AND a.sourceinstance= LKP.source_id 
 WHERE COALESCE(LKP.row_key, CASE WHEN a.closed_by  IS NULL THEN 0 else '-1' end)
<> COALESCE(c.closed_by_key,''))g 


f_change_task_c_closed_on_key_mysql.sql :: 



SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from intuit_mdsdb.change_task_final a
left join intuit_mdwdb.f_change_task_c c 
on  a.sys_id = c.ROW_ID and a.sourceinstance=c.source_id
left  JOIN  intuit_mdwdb.d_calendar_date b
on b.row_id = date_format(convert_tz(a.closed_at,'GMT','America/Los_Angeles'),'%Y%m%d') 
where b.row_key <> c.closed_on_key) g 


f_change_task_c_configuration_item_key_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt from intuit_mdsdb.change_task_final a
left join intuit_mdwdb.f_change_task_c c 
on a.sys_id = c.row_id and a.sourceinstance=c.source_id
LEFT JOIN intuit_mdwdb.d_configuration_item LKP 
on ( a.cmdb_ci = LKP.row_id 
AND a.sourceinstance= LKP.source_id )
WHERE COALESCE(LKP.row_key,CASE WHEN a.cmdb_ci IS NULL THEN 0 else '-1' end)
<> COALESCE(c.configuration_item_key,''))g 


f_change_task_c_due_on_key_mysql.sql :: 



SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from intuit_mdsdb.change_task_final a
left join intuit_mdwdb.f_change_task_c c 
on  a.sys_id = c.ROW_ID and a.sourceinstance=c.source_id
left  JOIN  intuit_mdwdb.d_calendar_date b
on b.row_id = date_format(convert_tz(a.due_date,'GMT' ,'America/Los_Angeles'),'%Y%m%d') 
where b.row_key <> c.due_on_key) g 


f_change_task_c_impact_src_code_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from intuit_mdsdb.change_task_final a
left join intuit_mdwdb.f_change_task_c c 
on  a.sys_id = c.ROW_ID and a.sourceinstance=c.source_id
where a.impact <> c.impact_src_code) g 


f_change_task_c_impact_src_key_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from intuit_mdsdb.change_task_final a
left join intuit_mdwdb.f_change_task_c c 
on  a.sys_id = c.ROW_ID and a.sourceinstance=c.source_id
left join intuit_mdwdb.d_lov b
on concat('IMPACT','~','CHANGE_TASK','~','~','~',upper(a.impact))= b.src_rowid 
 AND a.sourceinstance= b.source_id  

where  COALESCE(b.row_key,CASE WHEN a.impact IS NULL THEN 0 else -1 end)<> c.impact_src_key
) g 


f_change_task_c_opened_by_key_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from intuit_mdsdb.change_task_final a
left join intuit_mdwdb.f_change_task_c c 
on  a.sys_id = c.ROW_ID and a.sourceinstance=c.source_id
LEFT JOIN intuit_mdwdb.d_internal_contact LKP 
 ON   CONCAT('INTERNAL_CONTACT~',a.opened_by) = LKP.row_id 
AND a.sourceinstance= LKP.source_id 
 WHERE COALESCE(LKP.row_key, CASE WHEN a.opened_by  IS NULL THEN 0 else '-1' end)
<> COALESCE(c.opened_by_key,''))g 


f_change_task_c_opened_on_key_mysql.sql :: 



SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from intuit_mdsdb.change_task_final a
left join intuit_mdwdb.f_change_task_c c 
on  a.sys_id = c.ROW_ID and a.sourceinstance=c.source_id
left  JOIN  intuit_mdwdb.d_calendar_date b
on b.row_id = date_format(convert_tz(a.opened_at,'GMT' ,'America/Los_Angeles'),'%Y%m%d') 
where b.row_key <> c.opened_on_key) g 


f_change_task_c_priority_src_code_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from intuit_mdsdb.change_task_final a
left join intuit_mdwdb.f_change_task_c c 
on  a.sys_id = c.ROW_ID and a.sourceinstance=c.source_id
where a.priority <> c.priority_src_code) g 


f_change_task_c_priority_src_key_mysql.sql :: 



SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from intuit_mdsdb.change_task_final a
left join intuit_mdwdb.f_change_task_c c 
on  a.sys_id = c.ROW_ID and a.sourceinstance=c.source_id
left join intuit_mdwdb.d_lov b
on concat('PRIORITY','~','CHANGE_TASK','~','~','~',upper(a.priority))= b.src_rowid 
 AND a.sourceinstance= b.source_id  
where  COALESCE(b.row_key,CASE WHEN a.priority IS NULL THEN 0 else -1 end) <> c.priority_src_key) g 


f_change_task_c_reported_type_src_code_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from intuit_mdsdb.change_task_final a
left join intuit_mdwdb.f_change_task_c c 
on  a.sys_id = c.ROW_ID and a.sourceinstance=c.source_id
where a.contact_type collate utf8_unicode_ci <> c.reported_type_src_code) g 


f_change_task_c_reported_type_src_key_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from intuit_mdsdb.change_task_final a
left join intuit_mdwdb.f_change_task_c c 
on  a.sys_id = c.ROW_ID and a.sourceinstance=c.source_id
left join intuit_mdwdb.d_lov b
on  b.src_rowid =CONCAT('CONTACT_TYPE','~','CHANGE_TASK','~','~','~',UPPER(a.CONTACT_TYPE))
 AND a.sourceinstance= b.source_id  

where  COALESCE(b.row_key,CASE WHEN a.CONTACT_TYPE IS NULL THEN 0 else -1 end)<>c.reported_type_src_key)x 


f_change_task_c_state_src_code_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from intuit_mdsdb.change_task_final a
left join intuit_mdwdb.f_change_task_c c 
on  a.sys_id = c.ROW_ID and a.sourceinstance=c.source_id
where a.state  <> c.state_src_code) g 


f_change_task_c_state_src_key_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from intuit_mdsdb.change_task_final a
left join intuit_mdwdb.f_change_task_c c 
on  a.sys_id = c.ROW_ID and a.sourceinstance=c.source_id
left join intuit_mdwdb.d_lov b
on concat('STATE','~','CHANGE_TASK','~','~','~',upper(a.state))= b.src_rowid 
 AND a.sourceinstance= b.source_id  
 
where COALESCE(b.row_key,CASE WHEN a.state IS NULL THEN 0 else -1 end) <> c.state_src_key
) g 


f_change_task_c_sub_type_src_code_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from intuit_mdsdb.change_task_final a
left join intuit_mdwdb.f_change_task_c c 
on  a.sys_id = c.ROW_ID and a.sourceinstance=c.source_id
where a.u_sub_type  <> c.sub_type_src_code) g  


f_change_task_c_sub_type_src_key_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from intuit_mdsdb.change_task_final a
left join intuit_mdwdb.f_change_task_c c 
on  a.sys_id = c.ROW_ID and a.sourceinstance=c.source_id
left join intuit_mdwdb.d_lov b
on concat('SUB_TYPE','~','CHANGE_TASK','~','~','~',upper(a.u_sub_type))= b.src_rowid 
 AND a.sourceinstance= b.source_id  
where COALESCE(b.row_key,CASE WHEN a.u_sub_type IS NULL THEN 0 else -1 end) <> c.sub_type_src_key) g 


f_change_task_c_time_worked_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from intuit_mdsdb.change_task_final a
left join intuit_mdwdb.f_change_task_c c 
on  a.sys_id = c.ROW_ID and a.sourceinstance=c.source_id
where TIMESTAMPDIFF(SECOND,'1970/01/01 00:00:00',a.time_worked)<>c.time_worked) g 


f_change_task_c_urgency_src_code_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from intuit_mdsdb.change_task_final a
left join intuit_mdwdb.f_change_task_c c 
on  a.sys_id = c.ROW_ID and a.sourceinstance=c.source_id
where a.urgency  <> c.urgency_src_code) g 


f_change_task_c_urgency_src_key_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from intuit_mdsdb.change_task_final a
left join intuit_mdwdb.f_change_task_c c 
on  a.sys_id = c.ROW_ID and a.sourceinstance=c.source_id
left join intuit_mdwdb.d_lov b
on concat('URGENCY','~','CHANGE_TASK','~','~','~',upper(a.urgency))= b.src_rowid 
 AND a.sourceinstance= b.source_id  
where COALESCE(b.row_key,CASE WHEN a.urgency IS NULL THEN 0 else -1 end) <>c.urgency_src_key) g 


f_incident_business_service_c_key_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from intuit_mdsdb.incident_final b left join intuit_mdwdb.d_lov d on 
COALESCE(b.u_business_service,'UNSPECIFIED')=d.row_id
left join intuit_mdwdb.f_incident f on b.sys_id=f.row_id and b.sourceinstance=f.source_id
where d.row_key <>f.business_service_c_key)temp 


f_incident_business_service_code_c_mysql.sql :: 



SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from intuit_mdsdb.incident_final b 
left join intuit_mdwdb.f_incident f on b.sys_id=f.row_id and b.sourceinstance=f.source_id
where  b.u_business_service<>f.business_service_code_c)temp 


f_incident_detect_duration_c_mysql.sql :: 



SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from intuit_mdsdb.incident_final b 
left join intuit_mdwdb.f_incident f on b.sys_id=f.row_id and b.sourceinstance=f.source_id
where    TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',b.u_time_to_detect)<>f.detect_duration_c)temp 


f_incident_detect_on_c_key_mysql.sql :: 



SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from intuit_mdsdb.incident_final b left join intuit_mdwdb.d_calendar_date d on 
COALESCE(DATE_FORMAT(CONVERT_TZ(b.u_detect_date,'GMT' ,'America/Los_Angeles'),'%Y%m%d'),'UNSPECIFIED')=d.row_id
left join intuit_mdwdb.f_incident f on b.sys_id=f.row_id and b.sourceinstance=f.source_id
where d.row_key <>f.detect_on_c_key)temp 


f_incident_engagement_duration_c_mysql.sql :: 



SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from intuit_mdsdb.incident_final b 
left join intuit_mdwdb.f_incident f on b.sys_id=f.row_id and b.sourceinstance=f.source_id
where  TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',b.u_time_to_engage)<>f.engagement_duration_c)temp 


f_incident_engagement_on_c_key_mysql.sql :: 


 
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from intuit_mdsdb.incident_final b left join intuit_mdwdb.d_calendar_date d on 
COALESCE(DATE_FORMAT(CONVERT_TZ(b.u_engagement_timestamp,'GMT' ,'America/Los_Angeles'),'%Y%m%d'),'UNSPECIFIED')=d.row_id
left join intuit_mdwdb.f_incident f on b.sys_id=f.row_id and b.sourceinstance=f.source_id
where d.row_key <>f.engagement_on_c_key)temp 


f_incident_implementation_duration_c_mysql.sql :: 



SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from intuit_mdsdb.incident_final b 
left join intuit_mdwdb.f_incident f on b.sys_id=f.row_id and b.sourceinstance=f.source_id
where   TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',b.u_time_to_implement)<>f.implementation_duration_c)temp 


f_incident_infrastructure_category_src_c_key_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from intuit_mdsdb.incident_final b left join intuit_mdwdb.d_calendar_date d on 
COALESCE(CONCAT('U_INFRASTRUCTURE_CATEGORY','~','INCIDENT','~','~','~',b.u_infrastructure_category),'UNSPECIFIED')=d.row_id
left join intuit_mdwdb.f_incident f on b.sys_id=f.row_id and b.sourceinstance=f.source_id
where d.row_key <>f.infrastructure_category_src_c_key)temp

  


f_incident_infrastructure_category_src_code_c_mysql.sql :: 


 
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from intuit_mdsdb.incident_final b 
left join intuit_mdwdb.f_incident f on b.sys_id=f.row_id and b.sourceinstance=f.source_id
where b.u_infrastructure_category<>f.infrastructure_category_src_code_c)temp

 



 


f_incident_ioc_duration_c_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from intuit_mdsdb.incident_final b 
left join intuit_mdwdb.f_incident f on b.sys_id=f.row_id and b.sourceinstance=f.source_id
where   TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',b.u_time_to_ioc)<>f.ioc_duration_c) temp 


f_incident_opened_by_c_key_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from intuit_mdsdb.incident_final b left join intuit_mdwdb.d_internal_contact d on 
COALESCE(CONCAT('INTERNAL_CONTACT~',b.opened_by),'UNSPECIFIED')=d.row_id and  b.sourceinstance=d.source_id
left join intuit_mdwdb.f_incident f on b.sys_id=f.row_id and b.sourceinstance=f.source_id
where d.row_key <>f.opened_by_c_key)temp 


f_incident_opened_by_key_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from intuit_mdsdb.incident_final a 
left JOIN intuit_mdwdb.f_incident b 
 ON a.sys_id = b.row_id  AND a.sourceinstance = b.source_id 
left join intuit_mdwdb.d_internal_contact   c
on c.row_id = COALESCE(CONCAT('INTERNAL_CONTACT~',a.u_client),'UNSPECIFIED') and a.sourceinstance = c.source_id  
where  c.row_key <> b.opened_by_key
) g 


f_incident_repair_duration_c_mysql.sql :: 



SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from intuit_mdsdb.incident_final b 
left join intuit_mdwdb.f_incident f on b.sys_id=f.row_id and b.sourceinstance=f.source_id
where   TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',b.u_time_to_repair)<>f.repair_duration_c)temp 


f_incident_resolution_duration_c_mysql.sql :: 




SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from intuit_mdsdb.incident_final b 
left join intuit_mdwdb.f_incident f on b.sys_id=f.row_id and b.sourceinstance=f.source_id
where   TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',b.u_resolution_duration)<>f.resolution_duration_c)temp
 


f_incident_response_duration_c_mysql.sql :: 




SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from intuit_mdsdb.incident_final b 
left join intuit_mdwdb.f_incident f on b.sys_id=f.row_id and b.sourceinstance=f.source_id
where  
coalesce(TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',b.u_response_duration),0)<>coalesce(f.response_duration_c,0)
)temp



 


f_incident_solution_duration_c_mysql.sql :: 



SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from intuit_mdsdb.incident_final b 
left join intuit_mdwdb.f_incident f on b.sys_id=f.row_id and b.sourceinstance=f.source_id
where    TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',b.u_time_to_solution)<>f.solution_duration_c)temp 


f_incident_solution_on_c_key_mysql.sql :: 


 
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from intuit_mdsdb.incident_final b left join intuit_mdwdb.d_calendar_date d on 
COALESCE(DATE_FORMAT(CONVERT_TZ(b.u_solution_timestamp,'GMT' ,'America/Los_Angeles'),'%Y%m%d'),'UNSPECIFIED')=d.row_id
left join intuit_mdwdb.f_incident f on b.sys_id=f.row_id and b.sourceinstance=f.source_id
where d.row_key <>f.solution_on_c_key)temp

 


f_incident_started_on_c_key_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from intuit_mdsdb.incident_final b left join intuit_mdwdb.d_calendar_date d on 
COALESCE(DATE_FORMAT(CONVERT_TZ(b.u_start_date,'GMT' ,'America/Los_Angeles'),'%Y%m%d'),'UNSPECIFIED')=d.row_id
left join intuit_mdwdb.f_incident f on b.sys_id=f.row_id and b.sourceinstance=f.source_id
where d.row_key <>f.started_on_c_key)temp 


f_incident_sub_type_c_key_mysql.sql :: 



SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from intuit_mdsdb.incident_final b 
left join intuit_mdwdb.d_lov d on 
COALESCE(CONCAT('SUB_TYPE','~','INCIDENT','~','~','~',b.u_sub_type),'UNSPECIFIED')=d.row_id
left join intuit_mdwdb.f_incident f on b.sys_id=f.row_id and b.sourceinstance=f.source_id
where d.row_key <>f.sub_type_c_key)temp
 


f_incident_symptom_src_c_key_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from intuit_mdsdb.incident_final b left join intuit_mdwdb.d_lov d on 
COALESCE(CONCAT('SYMPTOM','~','INCIDENT','~','~','~',b.u_symptom),'UNSPECIFIED')=d.row_id
left join intuit_mdwdb.f_incident f on b.sys_id=f.row_id and b.sourceinstance=f.source_id
where d.row_key <>f.symptom_src_c_key)temp 


f_incident_symptom_src_code_c_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from intuit_mdsdb.incident_final b 
left join intuit_mdwdb.f_incident f on b.sys_id=f.row_id and b.sourceinstance=f.source_id
where b.u_symptom<>f.symptom_src_code_c)temp 


f_incident_task_c_age_key_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from intuit_mdsdb.u_incident_task_final s
left join intuit_mdwdb.f_incident_task_c t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
LEFT JOIN intuit_mdwdb.d_lov L  
ON ((t.age BETWEEN L.lower_range_value AND L.upper_range_value)	AND L.dimension_class = 'AGEBUCKET_WH~INCIDENT' )
WHERE COALESCE(L.row_key, case when t.age is null or t.age = 0 THEN 0 else -1 end ) 
 <> t.age_key) temp 


f_incident_task_c_age_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from intuit_mdsdb.u_incident_task_final s 
left join intuit_mdwdb.f_incident_task_c f 
on s.sys_id=f.row_id and s.sourceinstance = f.source_id 
JOIN   intuit_mdwdb.d_lov_map br 
ON  f.state_src_key = br.src_key   AND br.dimension_wh_code = 'OPEN' 
JOIN intuit_mdwdb.d_incident_task_c a 
ON a.row_key = f.incident_task_key  AND f.source_id = a.source_id
WHERE DATEDIFF((SELECT MAX(lastupdated) AS lastupdated
FROM intuit_mdwdb.d_o_data_freshness WHERE sourcename like 'ServiceNow%'), a.opened_on) <> f.age ) temp 


f_incident_task_c_assigned_to_key_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from intuit_mdsdb.u_incident_task_final s
left join intuit_mdwdb.f_incident_task_c t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
left join intuit_mdwdb.d_internal_contact lkp
ON COALESCE(CONCAT('INTERNAL_CONTACT~',s.assigned_to ),'UNSPECIFIED')= lkp.row_id
AND s.sourceinstance= lkp.source_id  
WHERE COALESCE(lkp.row_key, CASE WHEN s.assigned_to IS NULL THEN 0 else '-1' end)
<> t.assigned_to_key)x 


f_incident_task_c_assignment_group_key_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from intuit_mdsdb.u_incident_task_final s
left join intuit_mdwdb.f_incident_task_c t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
left join intuit_mdwdb.d_internal_organization lkp
on lkp.row_id = COALESCE(CONCAT('GROUP~',s.assignment_group),'UNSPECIFIED') AND lkp.source_id=s.sourceinstance
WHERE lkp.row_key <> t.assignment_group_key) temp 


f_incident_task_c_business_service_key_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from intuit_mdsdb.u_incident_task_final s
left join intuit_mdwdb.f_incident_task_c t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
left join intuit_mdwdb.d_configuration_item lkp
on 
COALESCE(s.u_business_service,'UNSPECIFIED')
=lkp.row_id and t.source_id = lkp.source_id
where lkp.row_key <> t.business_service_c_key
) temp 


f_incident_task_c_changed_by_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from intuit_mdsdb.u_incident_task_final  a
left join intuit_mdwdb.f_incident_task_c b
on a.sys_id=b.row_id and a.sourceinstance=b.source_id 
WHERE a.sys_updated_by <> b.changed_by ) temp 


f_incident_task_c_changed_on_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from intuit_mdsdb.u_incident_task_final s
left join intuit_mdwdb.f_incident_task_c t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
where CONVERT_TZ(s.sys_updated_on,'GMT','America/Los_Angeles')<>t.changed_on) temp 


f_incident_task_c_close_code_src_code_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from intuit_mdsdb.u_incident_task_final s
left join intuit_mdwdb.f_incident_task_c t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
where s.u_close_code <> t.close_code_src_code) temp 


f_incident_task_c_close_code_src_key_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from intuit_mdsdb.u_incident_task_final s
left join intuit_mdwdb.f_incident_task_c t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
left join intuit_mdwdb.d_lov lkp
on 
CONCAT('CLOSE_CODE','~','INCIDENT_TASK','~','~','~',UPPER(s.u_close_code))
=lkp.row_id and t.source_id = lkp.source_id
where COALESCE(lkp.row_key,CASE WHEN s.u_close_code IS NULL THEN 0 else -1 end) <> t. close_code_src_key
) temp 


f_incident_task_c_closed_by_key_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from intuit_mdsdb.u_incident_task_final s
left join intuit_mdwdb.f_incident_task_c t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
left join intuit_mdwdb.d_internal_contact lkp
on lkp.row_id = COALESCE(CONCAT('INTERNAL_CONTACT~',s.closed_by),'UNSPECIFIED')
and lkp.source_id=t.source_id

WHERE lkp.row_key <> t.closed_by_key) temp 


f_incident_task_c_closed_on_key_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from intuit_mdsdb.u_incident_task_final s
left join intuit_mdwdb.f_incident_task_c t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
left join intuit_mdwdb.d_calendar_date lkp
on lkp.row_id = COALESCE(DATE_FORMAT(CONVERT_TZ(s.closed_at,'GMT' ,'America/Los_Angeles'),'%Y%m%d'),'UNSPECIFIED')

WHERE lkp.row_key <> t.closed_on_key) temp 


f_incident_task_c_created_by_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from intuit_mdsdb.u_incident_task_final  a
left join intuit_mdwdb.f_incident_task_c b
on a.sys_id=b.row_id and a.sourceinstance=b.source_id 
WHERE a.sys_created_by <> b.created_by ) temp 


f_incident_task_c_created_on_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from intuit_mdsdb.u_incident_task_final s
left join intuit_mdwdb.f_incident_task_c t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
where CONVERT_TZ(s.sys_created_on,'GMT','America/Los_Angeles')<>t.created_on) temp 


f_incident_task_c_domain_key_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from intuit_mdsdb.u_incident_task_final s
left join intuit_mdwdb.f_incident_task_c t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
left join intuit_mdwdb.d_domain lkp
on COALESCE(s.sys_domain,'UNSPECIFIED') = lkp.row_id and s.sourceinstance = lkp.source_id
where lkp.row_key <> t.domain_key
) temp 


f_incident_task_c_dormancy_age_key_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from intuit_mdsdb.u_incident_task_final s
left join intuit_mdwdb.f_incident_task_c t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
LEFT JOIN intuit_mdwdb.d_lov L  
ON ( t.dormancy_age BETWEEN L.lower_range_value AND L.upper_range_value)
WHERE L.dimension_class='DORMANCYBUCKET_WH~INCIDENT' and t.dormancy_age_key <> coalesce(L.row_key,-1)) temp 


f_incident_task_c_dormancy_age_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from intuit_mdsdb.u_incident_task_final s 
left join intuit_mdwdb.f_incident_task_c f 
on s.sys_id=f.row_id and s.sourceinstance = f.source_id 
JOIN   intuit_mdwdb.d_lov_map br 
ON  f.state_src_key = br.src_key   AND br.dimension_wh_code = 'OPEN' 
WHERE DATEDIFF((SELECT MAX(lastupdated) AS lastupdated
FROM intuit_mdwdb.d_o_data_freshness WHERE sourcename like 'ServiceNow%'),f.changed_on)<>f.dormancy_age ) temp 


f_incident_task_c_due_on_key_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from intuit_mdsdb.u_incident_task_final s
left join intuit_mdwdb.f_incident_task_c t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
left join intuit_mdwdb.d_calendar_date lkp
on lkp.row_id = COALESCE(DATE_FORMAT(CONVERT_TZ(s.due_date,'GMT' ,'America/Los_Angeles'),'%Y%m%d'),'UNSPECIFIED')
WHERE lkp.row_key <> t.due_on_key) temp 


f_incident_task_c_impact_src_code_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from intuit_mdsdb.u_incident_task_final s
left join intuit_mdwdb.f_incident_task_c t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
where s.impact<>t.impact_src_code
) temp 


f_incident_task_c_impact_src_key_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from intuit_mdsdb.u_incident_task_final s
left join intuit_mdwdb.f_incident_task_c t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
left join intuit_mdwdb.d_lov lkp
on 
CONCAT('IMPACT','~','INCIDENT_TASK','~','~','~',UPPER(s.impact))=lkp.row_id and t.source_id = lkp.source_id
where  COALESCE(lkp.row_key,CASE WHEN s.impact IS NULL THEN 0 else -1 end)<>t.impact_src_key 
) temp 


f_incident_task_c_incident_key_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from intuit_mdsdb.u_incident_task_final s
left join intuit_mdwdb.f_incident_task_c t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
left join intuit_mdwdb.d_incident lkp
on COALESCE(s.u_ud_parent,'UNSPECIFIED') = lkp.row_id and s.sourceinstance = lkp.source_id
where lkp.row_key <> t.incident_key
) temp 


f_incident_task_c_incident_task_number_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from intuit_mdsdb.u_incident_task_final s
left join intuit_mdwdb.f_incident_task_c t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
where s.number<>t.incident_task_number) temp 


f_incident_task_c_last_resolved_on_key_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from intuit_mdsdb.u_incident_task_final s
left join intuit_mdwdb.f_incident_task_c t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
left join intuit_mdwdb.d_calendar_date lkp
on lkp.row_id = COALESCE(DATE_FORMAT(CONVERT_TZ(s.u_actual_resolve_date,'GMT' ,'America/Los_Angeles'),
'%Y%m%d'),'UNSPECIFIED')
LEFT JOIN intuit_mdwdb.d_lov_map br 
 ON t.state_src_key = br.src_key
WHERE    br.dimension_wh_code IN('RESOLVED','CLOSED') AND coalesce(lkp.row_key,case when u_actual_resolve_date is null  THEN 0 else -1 end )<> t.last_resolved_on_key) temp
 


f_incident_task_c_lopen_to_close_duration_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from intuit_mdsdb.u_incident_task_final s
left join intuit_mdwdb.f_incident_task_c t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
where TIMESTAMPDIFF(SECOND,s.opened_at,s.closed_at) <> t.open_to_close_duration
) temp 


f_incident_task_c_open_to_close_duration_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select  count(1) as cnt
from intuit_mdsdb.u_incident_task_final s
left join intuit_mdwdb.f_incident_task_c t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
left join intuit_mdwdb.d_calendar_date lkp
on lkp.row_id = COALESCE(DATE_FORMAT(CONVERT_TZ(s.u_actual_resolve_date,'GMT' ,'America/Los_Angeles'),'%Y%m%d'),'UNSPECIFIED')
LEFT JOIN intuit_mdwdb.d_lov_map br 
 ON t.state_src_key = br.src_key
WHERE  br.dimension_wh_code IN ('RESOLVED','CLOSED') and
 lkp.row_key <> t.last_resolved_on_key) temp 


f_incident_task_c_open_to_resolve_duration_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from intuit_mdsdb.u_incident_task_final s
left join intuit_mdwdb.f_incident_task_c t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
where TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',s.u_resolution_duration) <> t.open_to_resolve_duration
) temp 


f_incident_task_c_open_to_response_duration_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from intuit_mdsdb.u_incident_task_final s
left join intuit_mdwdb.f_incident_task_c t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
where TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',s.u_response_duration) <> t.open_to_response_duration
) temp 


f_incident_task_c_opened_by_c_key_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from intuit_mdsdb.u_incident_task_final s
left join intuit_mdwdb.f_incident_task_c t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
left join intuit_mdwdb.d_internal_contact l
on COALESCE(CONCAT('INTERNAL_CONTACT~',s.opened_by),'UNSPECIFIED')=l.row_id and s.sourceinstance = l.source_id
where l.row_key <>t.opened_by_c_key) temp 


f_incident_task_c_opened_by_department_key_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from intuit_mdsdb.u_incident_task_final s
left join intuit_mdwdb.f_incident_task_c t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
JOIN intuit_mdwdb.d_internal_contact emp 
ON COALESCE(CONCAT('INTERNAL_CONTACT~',s.opened_by),'UNSPECIFIED')=emp.row_id AND s.sourceinstance=emp.source_id
JOIN intuit_mdwdb.d_internal_organization dept 
ON CONCAT('DEPARTMENT~',emp.department_code) = dept.row_id
 AND emp.source_id = dept.source_id
 AND dept.current_flag = 'Y'
where t.opened_by_department_key <> dept.row_key
) temp 


f_incident_task_c_opened_by_key_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from intuit_mdsdb.u_incident_task_final s
left join intuit_mdwdb.f_incident_task_c t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
left join intuit_mdwdb.d_internal_contact lkp
on lkp.row_id = COALESCE(CONCAT('INTERNAL_CONTACT~',s.opened_by),'UNSPECIFIED') AND lkp.source_id=s.sourceinstance
WHERE lkp.row_key <> t.opened_by_key) temp 


f_incident_task_c_opened_on_key_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from intuit_mdsdb.u_incident_task_final s
left join intuit_mdwdb.f_incident_task_c t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
LEFT JOIN intuit_mdwdb.d_calendar_date LKP 
on LKP.row_id = 
COALESCE(DATE_FORMAT(CONVERT_TZ(s.opened_at,'GMT','America/Los_Angeles'),'%Y%m%d'),'UNSPECIFIED')
WHERE LKP.row_key <> t.opened_on_key) temp 


f_incident_task_c_opened_time_key_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from intuit_mdsdb.u_incident_task_final s
left join intuit_mdwdb.f_incident_task_c t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
LEFT JOIN intuit_mdwdb.d_calendar_date LKP 
on LKP.row_id = 
COALESCE(DATE_FORMAT(CONVERT_TZ(s.opened_at,'GMT','America/Los_Angeles'),'%Y%m%d'),'UNSPECIFIED')
WHERE LKP.row_key <> t.opened_on_key) temp 


f_incident_task_c_pending_code_src_code_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from intuit_mdsdb.u_incident_task_final s
left join intuit_mdwdb.f_incident_task_c t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
where s.u_pending_code <> t.pending_code_src_code) temp 


f_incident_task_c_pending_code_src_key_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from intuit_mdsdb.u_incident_task_final s
left join intuit_mdwdb.f_incident_task_c t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
left join intuit_mdwdb.d_lov  lkp
on 
(CONCAT('PENDING_CODE','~','U_INCIDENT_TASK','~','~','~',UPPER(s.u_pending_code))
=lkp.row_id and t.source_id = lkp.source_id)
where COALESCE(lkp.row_key,CASE WHEN s.u_pending_code IS NULL THEN 0 else -1 end) <> t.pending_code_src_key
) temp
 


f_incident_task_c_priority_src_code_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from intuit_mdsdb.u_incident_task_final s
left join intuit_mdwdb.f_incident_task_c t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
where s.priority<>t.priority_src_code
) temp 


f_incident_task_c_priority_src_key_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from intuit_mdsdb.u_incident_task_final s
left join intuit_mdwdb.f_incident_task_c t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
left join intuit_mdwdb.d_lov lkp
on 
(CONCAT('PRIORITY','~','INCIDENT_TASK','~','~','~',UPPER(s.priority))
=lkp.row_id and t.source_id = lkp.source_id)
where COALESCE(lkp.row_key,CASE WHEN s.priority IS NULL THEN 0 else -1 end) <> t.priority_src_key 
) x 


f_incident_task_c_reassignment_count_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from intuit_mdsdb.u_incident_task_final s
left join intuit_mdwdb.f_incident_task_c t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
where s.reassignment_count <> t.reassignment_count
) temp 


f_incident_task_c_reported_type_src_c_key_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from intuit_mdsdb.u_incident_task_final s
left join intuit_mdwdb.f_incident_task_c t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
LEFT JOIN intuit_mdwdb.d_lov l  
ON COALESCE(CONCAT('CONTACT_TYPE~INCIDENT_TASK','~','','~','','~',s.contact_type),'UNSPECIFIED')= l.row_id 
and l.source_id=s.sourceinstance
WHERE t.reported_type_src_c_key<> l.row_key) temp 


f_incident_task_c_resolve_to_close_duration_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select  count(1) as cnt
from intuit_mdsdb.u_incident_task_final s
left join intuit_mdwdb.f_incident_task_c t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
where TIMESTAMPDIFF(SECOND,s.u_actual_resolve_date,s.closed_at) <> t.RESOLVE_TO_CLOSE_DURATION
) temp 


f_incident_task_c_state_src_code_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from intuit_mdsdb.u_incident_task_final s
left join intuit_mdwdb.f_incident_task_c t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
where s.state<>t.state_src_code
) temp 


f_incident_task_c_state_src_key_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from intuit_mdsdb.u_incident_task_final s
left join intuit_mdwdb.f_incident_task_c t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
left join intuit_mdwdb.d_lov lkp
on 
COALESCE(CONCAT('STATE','~','U_INCIDENT_TASK','~','~','~',UPPER(s.state)),'UNSPECIFIED')
=lkp.row_id and t.source_id = lkp.source_id
where lkp.row_key <> t.state_src_key 
) temp 


f_incident_task_c_ticket_count_c_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from intuit_mdsdb.u_incident_task_final s
left join intuit_mdwdb.f_incident_task_c t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
where s.u_ticket_count <> t.ticket_count_c) temp 


f_incident_task_c_time_worked_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from intuit_mdsdb.u_incident_task_final s
left join intuit_mdwdb.f_incident_task_c t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
where TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',s.time_worked) <> t.time_worked
) temp 


f_incident_task_c_urgency_src_code_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from intuit_mdsdb.u_incident_task_final s
left join intuit_mdwdb.f_incident_task_c t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
where s.urgency<>t.urgency_src_code
) temp 


f_incident_task_c_urgency_src_key_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from intuit_mdsdb.u_incident_task_final s
left join intuit_mdwdb.f_incident_task_c t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
left join intuit_mdwdb.d_lov lkp
on 
CONCAT('URGENCY','~','INCIDENT_TASK','~','~','~',UPPER(s.urgency))
=lkp.row_id and t.source_id = lkp.source_id
where  COALESCE(lkp.row_key,CASE WHEN s.urgency IS NULL THEN 0 else -1 end) <> t.urgency_src_key 
) temp 


f_kb_task_c_change_request_key_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
 FROM intuit_mdsdb.m2m_kb_task_final src
join intuit_mdsdb.task_final lkp1
on lkp1.sys_id= src.task and src.sourceinstance=lkp1.sourceinstance
left join intuit_mdwdb.f_kb_task_c tgt
on src.sys_id=tgt.row_id and src.sourceinstance=tgt.source_id
left join intuit_mdwdb.d_change_request lkp
on src.task = lkp.row_id and src.sourceinstance=lkp.source_id
where coalesce(lkp.row_Key,case when lkp1.sys_class_name <>'change_request' 
then 0 else -1 end) <> tgt.change_request_key
) temp 


f_kb_task_c_changed_by_mysql.sql :: 



SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
 FROM intuit_mdsdb.m2m_kb_task_final src
left join intuit_mdwdb.f_kb_task_c tgt
on src.sys_id=tgt.row_id and src.sourceinstance=tgt.source_id
where src.sys_updated_by <> tgt.changed_by
) temp 


f_kb_task_c_changed_on_mysql.sql :: 



SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
 FROM intuit_mdsdb.m2m_kb_task_final src
left join intuit_mdwdb.f_kb_task_c tgt
on src.sys_id=tgt.row_id and src.sourceinstance=tgt.source_id
where convert_tz(src.sys_updated_on,'GMT','America/Los_Angeles') <> tgt.changed_on
) temp 


f_kb_task_c_class_name_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
 FROM intuit_mdsdb.m2m_kb_task_final src
left join intuit_mdwdb.f_kb_task_c tgt
on src.sys_id=tgt.row_id and src.sourceinstance=tgt.source_id
left join intuit_mdsdb.task_final lkp
on src.task=lkp.sys_id and src.sourceinstance=lkp.sourceinstance
where lkp.sys_class_name <> tgt.class_name
) temp 


f_kb_task_c_created_by_mysql.sql :: 



SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
 FROM intuit_mdsdb.m2m_kb_task_final src
left join intuit_mdwdb.f_kb_task_c tgt
on src.sys_id=tgt.row_id and src.sourceinstance=tgt.source_id
where src.sys_created_by <> tgt.created_by
) temp 


f_kb_task_c_created_on_mysql.sql :: 



SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
 FROM intuit_mdsdb.m2m_kb_task_final src
left join intuit_mdwdb.f_kb_task_c tgt
on src.sys_id=tgt.row_id and src.sourceinstance=tgt.source_id
where convert_tz(src.sys_created_on,'GMT','America/Los_Angeles') <> tgt.created_on
) temp 


f_kb_task_c_incident_key_mysql.sql :: 



SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
 FROM intuit_mdsdb.m2m_kb_task_final src
join intuit_mdsdb.task_final lkp1
on lkp1.sys_id= src.task and src.sourceinstance=lkp1.sourceinstance
left join intuit_mdwdb.f_kb_task_c tgt
on src.sys_id=tgt.row_id and src.sourceinstance=tgt.source_id
left join intuit_mdwdb.d_incident lkp
on src.task = lkp.row_id and src.sourceinstance=lkp.source_id
where coalesce(lkp.row_Key,case when lkp1.sys_class_name <>'incident
then 0 else -1 end) <> tgt.incident_key
) temp 


f_kb_task_c_incident_task_key_mysql.sql :: 



SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
 FROM intuit_mdsdb.m2m_kb_task_final src
join intuit_mdsdb.task_final lkp1
on lkp1.sys_id= src.task and src.sourceinstance=lkp1.sourceinstance
left join intuit_mdwdb.f_kb_task_c tgt
on src.sys_id=tgt.row_id and src.sourceinstance=tgt.source_id
left join intuit_mdwdb.d_incident_task_c lkp
on src.task = lkp.row_id and src.sourceinstance=lkp.source_id
where coalesce(lkp.row_Key,case when lkp1.sys_class_name <>'u_incident_task'
then 0 else -1 end) <> tgt.incident_task_key
) temp 


f_kb_task_c_knowledge_key_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
 FROM intuit_mdsdb.m2m_kb_task_final src
left join intuit_mdwdb.f_kb_task_c tgt
on src.sys_id=tgt.row_id and src.sourceinstance=tgt.source_id
left join intuit_mdwdb.d_kb_knowledge_c lkp
on src.kb_knowledge = lkp.row_id and src.sourceinstance=lkp.source_id
where lkp.row_Key <> tgt.kb_knowledge_c_key
) temp 


f_kb_task_c_problem_key_mysql.sql :: 



SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
 FROM intuit_mdsdb.m2m_kb_task_final src
join intuit_mdsdb.task_final lkp1
on lkp1.sys_id= src.task and src.sourceinstance=lkp1.sourceinstance
left join intuit_mdwdb.f_kb_task_c tgt
on src.sys_id=tgt.row_id and src.sourceinstance=tgt.source_id
left join intuit_mdwdb.d_problem lkp
on src.task = lkp.row_id and src.sourceinstance=lkp.source_id
where coalesce(lkp.row_Key,case when lkp1.sys_class_name <>'problem'
then 0 else -1 end) <> tgt.problem_key
) temp 


f_kb_task_c_problem_task_key_mysql.sql :: 



SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
 FROM intuit_mdsdb.m2m_kb_task_final src
join intuit_mdsdb.task_final lkp1
on lkp1.sys_id= src.task and src.sourceinstance=lkp1.sourceinstance
left join intuit_mdwdb.f_kb_task_c tgt
on src.sys_id=tgt.row_id and src.sourceinstance=tgt.source_id
left join intuit_mdwdb.d_problem_task lkp
on src.task = lkp.row_id and src.sourceinstance=lkp.source_id
where coalesce(lkp.row_Key,case when lkp1.sys_class_name <>'problem_task'
then 0 else -1 end) <> tgt.problem_task_key
) temp 


f_kb_task_c_request_item_key_mysql.sql :: 



SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
 FROM intuit_mdsdb.m2m_kb_task_final src
join intuit_mdsdb.task_final lkp1
on lkp1.sys_id= src.task and src.sourceinstance=lkp1.sourceinstance
left join intuit_mdwdb.f_kb_task_c tgt
on src.sys_id=tgt.row_id and src.sourceinstance=tgt.source_id
left join intuit_mdwdb.d_request_item lkp
on src.task = lkp.row_id and src.sourceinstance=lkp.source_id
where coalesce(lkp.row_Key,case when lkp1.sys_class_name <>'request_item'
then 0 else -1 end) <> tgt.request_item_key
) temp 


f_kb_task_c_request_key_mysql.sql :: 



SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
 FROM intuit_mdsdb.m2m_kb_task_final src
join intuit_mdsdb.task_final lkp1
on lkp1.sys_id= src.task and src.sourceinstance=lkp1.sourceinstance
left join intuit_mdwdb.f_kb_task_c tgt
on src.sys_id=tgt.row_id and src.sourceinstance=tgt.source_id
left join intuit_mdwdb.d_request lkp
on src.task = lkp.row_id and src.sourceinstance=lkp.source_id
where coalesce(lkp.row_Key,case when lkp1.sys_class_name <>'request'
then 0 else -1 end) <> tgt.request_key
) temp 


f_kb_task_c_request_task_key_mysql.sql :: 



SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
 FROM intuit_mdsdb.m2m_kb_task_final src
join intuit_mdsdb.task_final lkp1
on lkp1.sys_id= src.task and src.sourceinstance=lkp1.sourceinstance
left join intuit_mdwdb.f_kb_task_c tgt
on src.sys_id=tgt.row_id and src.sourceinstance=tgt.source_id
left join intuit_mdwdb.d_request_task lkp
on src.task = lkp.row_id and src.sourceinstance=lkp.source_id
where coalesce(lkp.row_Key,case when lkp1.sys_class_name <>'sc_task'
then 0 else -1 end) <> tgt.request_task_key
) temp 


f_kb_task_c_task_key_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
FROM intuit_mdsdb.m2m_kb_task_final src
left join intuit_mdwdb.f_kb_task_c tgt
on src.sys_id=tgt.row_id and src.sourceinstance=tgt.source_id
left join intuit_mdwdb.d_task lkp
on src.task = lkp.row_id and src.sourceinstance=lkp.source_id
where coalesce(lkp.row_Key,case when src.task is null then 0 else -1 end) <> tgt.task_key
) temp 


f_outage_c_configuration_item_key_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from intuit_mdsdb.cmdb_ci_outage_final s
left join intuit_mdwdb.f_outage_c t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
left join intuit_mdwdb.d_configuration_item lkp
on lkp.row_id = COALESCE(s.cmdb_ci,'UNSPECIFIED') 
and lkp.source_id = s.sourceinstance
WHERE lkp.row_key <> t.configuration_item_key) temp  


f_outage_c_degraded_duration_mysql.sql :: 


SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem.manager_c_key' ELSE 'SUCCESS' END as Message 
  from intuit_mdsdb.sys_user_final b
left join intuit_mdwdb.d_internal_contact a
ON a.row_id = concat('INTERNAL_CONTACT~',b.sys_id ) AND a.source_id = b.sourceinstance 
left join intuit_mdwdb.d_internal_contact c
on   c.row_id = concat('INTERNAL_CONTACT~',b.manager) AND c.source_id = b.sourceinstance 
where a.manager_c_key  <>	CASE WHEN manager is null  THEN 0 
ELSE COALESCE(c.row_key, -1) END; 


 


f_outage_c_detect_duration_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from intuit_mdsdb.cmdb_ci_outage_final s
left join intuit_mdwdb.f_outage_c t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
WHERE t.detect_duration <> COALESCE(TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',s.u_time_to_detect),0) ) a 


f_outage_c_detect_key_mysql.sql :: 



SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from intuit_mdsdb.cmdb_ci_outage_final s
left join intuit_mdwdb.f_outage_c t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
left join intuit_mdwdb.d_calendar_date lkp
on lkp.row_id = COALESCE(DATE_FORMAT(CONVERT_TZ(s.u_detect_date,'GMT' ,'America/Los_Angeles'),'%Y%m%d'),'UNSPECIFIED') 
WHERE lkp.row_key <> t.detect_key) temp 

 


f_outage_c_incident_row_key_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from intuit_mdsdb.cmdb_ci_outage_final s
left join intuit_mdwdb.f_outage_c t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
left join intuit_mdwdb.d_incident  lkp
on lkp.row_id =s.task_number and lkp.source_id = s.sourceinstance
WHERE lkp.row_key <> t.incident_row_key) temp 
 


f_outage_c_outage_duration_mysql.sql :: 



SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from intuit_mdsdb.cmdb_ci_outage_final s
left join intuit_mdwdb.f_outage_c t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
WHERE t.outage_duration <> COALESCE(TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',s.duration),0) ) a 


f_outage_c_outage_end_key_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message ,cnt
FROM (
select count(1) as cnt
from intuit_mdsdb.cmdb_ci_outage_final s
left join intuit_mdwdb.f_outage_c t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
left join intuit_mdwdb.d_calendar_date  lkp
on lkp.row_id =COALESCE( DATE_FORMAT(CONVERT_TZ(s.END,'GMT' ,'America/Los_Angeles'),'%Y%m%d'),'UNSPECIFIED')
WHERE lkp.row_key <> t.outage_end_key) temp  


f_outage_c_outage_key_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from intuit_mdsdb.cmdb_ci_outage_final s
left join intuit_mdwdb.f_outage_c t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
left join intuit_mdwdb.d_outage_c  lkp
on lkp.row_id =s.sys_id and lkp.source_id = s.sourceinstance
WHERE lkp.row_key <> t.outage_c_key) temp 
 


f_outage_c_outage_severity_src_code_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from intuit_mdsdb.cmdb_ci_outage_final s
left join intuit_mdwdb.f_outage_c t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
WHERE s.u_outage_severity <> t.outage_severity_src_code) temp 
 


f_outage_c_outage_severity_src_key_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from intuit_mdsdb.cmdb_ci_outage_final s
left join intuit_mdwdb.f_outage_c t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
left join intuit_mdwdb.d_lov  lkp
on lkp.row_id =COALESCE(CONCAT('SEVERITY','~','OUTAGE','~','~','~',UPPER(s.u_outage_severity)),'UNSPECIFIED') 
and lkp.source_id = s.sourceinstance
WHERE lkp.row_key <> t.outage_severity_src_key) temp 


f_outage_c_outage_start_key_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from intuit_mdsdb.cmdb_ci_outage_final s
left join intuit_mdwdb.f_outage_c t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
left join intuit_mdwdb.d_calendar_date  lkp
on lkp.row_id =DATE_FORMAT(CONVERT_TZ(COALESCE(s.begin,s.sys_created_on),'GMT' ,'America/Los_Angeles'),'%Y%m%d') 
WHERE lkp.row_key <> t.outage_start_key) temp  


f_outage_c_percentage_impacted_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from intuit_mdsdb.cmdb_ci_outage_final s
left join intuit_mdwdb.f_outage_c t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
WHERE u_percent_of_impact <> t.percentage_impacted) temp 
 


f_outage_c_pivot_date_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from intuit_mdsdb.cmdb_ci_outage_final s
left join intuit_mdwdb.f_outage_c t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
WHERE CONVERT_TZ (s.begin,'GMT','America/Los_Angeles') <> t.pivot_date) temp
 


f_outage_c_repair_duration_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from intuit_mdsdb.cmdb_ci_outage_final s
left join intuit_mdwdb.f_outage_c t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
where TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',s.u_time_to_repair)<> t.repair_duration) temp  


f_outage_c_restore_duration_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from intuit_mdsdb.cmdb_ci_outage_final s
left join intuit_mdwdb.f_outage_c t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
where COALESCE(TIMESTAMPDIFF(SECOND,'1970-01-01  00:00:00',s.u_time_to_restore)
<> t.restore_duration)) temp  


f_outage_c_users_impacted_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from intuit_mdsdb.cmdb_ci_outage_final s
left join intuit_mdwdb.f_outage_c t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
where s.u_number_of_users 
<> t.users_impacted) temp 
 


f_problem_close_code_src_code_c_key_mysql.sql :: 



SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from 
intuit_mdsdb.problem_final  b
left join intuit_mdwdb.f_problem TRG
on TRG.row_id=b.sys_id   and b.SourceInstance =TRG.source_id
left join intuit_mdwdb.d_lov c
on c.src_rowid =  CASE WHEN b.u_close_code IS NULL THEN 'UNSPECIFIED' ELSE UPPER(CONCAT('CLOSE_CODE~PROBLEM','~','~','~',COALESCE(b.u_close_code,''))) end 
AND c.source_id = CASE WHEN b.u_close_code IS NULL THEN 0 ELSE TRG.source_id end 
where TRG.close_code_src_c_key <> COALESCE(c.row_key,-1)) temp 
 


f_problem_close_code_src_code_c_mysql.sql :: 


SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem.close_code_src_code_c' ELSE 'SUCCESS' END as Message
from 
intuit_mdsdb.problem_final  SRC
left join intuit_mdwdb.f_problem TRG
on TRG.row_id=SRC.sys_id   and SRC.SourceInstance =TRG.source_id
where TRG.close_code_src_code_c<>SRC.u_close_code 


f_problem_initial_incident_c_key_mysql.sql :: 



SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from  
intuit_mdsdb.problem_final  SRC
left join intuit_mdwdb.f_problem TRG
on TRG.row_id=SRC.sys_id   and SRC.SourceInstance =TRG.source_id
left join  intuit_mdwdb.d_incident di
on di.row_id=COALESCE(SRC.u_initial_incident,'UNSPECIFIED')
and di.source_id = CASE WHEN SRC.u_initial_incident IS NULL THEN 0 ELSE SRC.SourceInstance end 
where TRG.initial_incident_c_key<>  di.row_key ) temp 


f_problem_number_of_tasks_c_mysql.sql :: 



SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from  
intuit_mdsdb.problem_final  SRC
left join intuit_mdwdb.f_problem TRG
on TRG.row_id=SRC.sys_id   and SRC.SourceInstance =TRG.source_id
where TRG.number_of_tasks_c<>SRC.u_number_of_tasks) temp 


f_problem_post_mortem_schedule_c_key_mysql.sql :: 



SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
from  (
select count(1) as cnt 
from 
intuit_mdsdb.problem_final  SRC
left join intuit_mdwdb.f_problem TRG
on TRG.row_id=SRC.sys_id   and SRC.SourceInstance =TRG.source_id
left join  intuit_mdwdb.d_calendar_date cal_sd 
on cal_sd.row_id=COALESCE(DATE_FORMAT(CONVERT_TZ(SRC.u_post_mortem_schedule_date,'GMT' ,'America/Los_Angeles'),'%Y%m%d'),'UNSPECIFIED') 
 and cal_sd.source_id=0
where TRG.post_mortem_schedule_c_key <> coalesce(cal_sd.row_key,-1)) temp 


f_problem_sub_type_src_code_c_key_mysql.sql :: 



SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
from  (
select count(1) as cnt 
from 
intuit_mdsdb.problem_final  b
left join intuit_mdwdb.f_problem TRG
on TRG.row_id=b.sys_id   and b.SourceInstance =TRG.source_id
left join intuit_mdwdb.d_lov c
on c.src_rowid =  CASE WHEN b.u_sub_type IS NULL THEN 'UNSPECIFIED' ELSE UPPER(CONCAT('sub_type~PROBLEM','~','~','~',COALESCE(b.u_sub_type,''))) end 
AND c.source_id = CASE WHEN b.u_sub_type IS NULL THEN 0 ELSE TRG.source_id end 
where TRG.sub_type_src_c_key <> COALESCE(c.row_key,-1)) temp 


f_problem_sub_type_src_code_c_mysql.sql :: 



SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
from  (
select count(1) as cnt from  
intuit_mdsdb.problem_final  SRC
left join intuit_mdwdb.f_problem TRG
on TRG.row_id=SRC.sys_id   and SRC.SourceInstance =TRG.source_id
where TRG.sub_type_src_code_c<>SRC.u_sub_type
) temp 


f_request_item_reported_type_src_c_key_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from intuit_mdsdb.sc_req_item_final b
left join intuit_mdwdb.f_request_item a 
 on b.sys_id=a.row_id and b.sourceinstance=a.source_id 
left join intuit_mdwdb.d_lov lkp
on lkp.row_id
=CONCAT('CONTACT_TYPE~SC_REQ_ITEM','~','','~','','~',b.contact_type)
where a.reported_type_src_c_key<>COALESCE(lkp.row_key,CASE WHEN b.contact_type IS NULL THEN 0 else -1 end) ) temp 


f_request_state_src_code_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from intuit_mdsdb.sc_request_final a 
left join intuit_mdwdb.f_request b
on a.sys_id=b.row_id and a.sourceinstance=b.source_id
where  b.state_src_code <>   a.state
) g 


f_request_state_src_key_mysql.sql :: 



SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from intuit_mdsdb.sc_request_final a 
left join intuit_mdwdb.f_request b
on a.sys_id=b.row_id and a.sourceinstance=b.source_id
left join intuit_mdwdb.d_lov c
on c.row_id=COALESCE(CONCAT('REQUEST_STATE','~','SC_REQUEST','~','~','~',UPPER(a.state)),'UNSPECIFIED') and a.sourceinstance=c.source_id
where c.row_key <> b.state_src_key
) g 


f_task_sla_incident_task_c_key_mysql.sql :: 


SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN count(1) > 0  THEN 'Data did not Match.' ELSE 'Data Matched'  end As Result
from intuit_mdsdb.task_sla_final tsd
LEFT JOIN intuit_mdsdb.task_final t ON tsd.task = t.sys_id
LEFT JOIN intuit_mdwdb.f_task_sla dfts on tsd.sys_id=dfts.row_id 
  AND tsd.sourceinstance=dfts.source_id
LEFT JOIN intuit_mdwdb.d_incident_task_c b ON tsd.task = b.row_id and b.source_id = tsd.sourceinstance

WHERE CASE WHEN upper(t.sys_class_name) ='U_INCIDENT_TASK' THEN b.row_key
ELSE 0 end <> (dfts.incident_task_c_key) 


f_task_survey_incident_task_c_key_mysql.sql :: 


SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN count(1) > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
from intuit_mdsdb.task_survey_final tsd
LEFT OUTER JOIN intuit_mdsdb.task_final t ON tsd.task = t.sys_id
left outer join intuit_mdsdb.sys_user_final usr on usr.sys_id =tsd.taken_by
left join intuit_workdb.f_task_survey dfts
on tsd.sys_id=dfts.row_id AND tsd.sourceinstance=dfts.source_id
LEFT JOIN intuit_workdb.d_incident_task_c b ON 
tsd.task=b.row_id and tsd.sourceinstance=b.source_id
where  CASE WHEN upper(t.sys_class_name) ='U_INCIDENT_TASK' THEN b.row_key
ELSE 0 END and dfts.incident_task_c_key <> b.row_key; 


Incident_Variable_CONFIG_APPLICATION_KEY_check_mysql.sql :: 


 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt>0 THEN 'PASSTHROUGH NOT MATCHING ON DATA' ELSE 'SUCCESS' END as Message
 FROM(
select count(1) as cnt from(
select a.sys_user_key,b.value,c.name,c.reference,c.row_key
from intuit_mdwdb.f_incident_variable_c a
inner join intuit_mdsdb.question_answer_final b
on a.row_id=b.sys_id
and a.source_id=b.sourceinstance
inner join intuit_mdwdb.d_variable c
on b.question=c.row_id
and b.sourceinstance=c.source_id
inner join intuit_mdwdb.d_configuration_application_c d
on b.value=d.row_id
and b.sourceinstance=d.source_id
where c.reference='cmdb_ci_appl' AND a.configuration_application_key<>d.row_key)a)temp 


Incident_Variable_INCIDENT_KEY_check_mysql.sql :: 


 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt>0 THEN 'PASSTHROUGH NOT MATCHING ON DATA' ELSE 'SUCCESS' END as Message
 FROM(
select count(1) as cnt from(
select a.incident_key,b.value,c.row_key
from intuit_mdwdb.f_incident_variable_c a
inner join intuit_mdsdb.question_answer_final b
on a.row_id=b.sys_id
and a.source_id=b.sourceinstance
inner join intuit_mdwdb.d_incident c
on b.table_sys_id=c.row_id
and b.sourceinstance=c.source_id
where  a.incident_key<>c.row_key)A)TEMP 


Incident_Variable_LOV_check_mysql.sql :: 


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt>0 THEN 'PASSTHROUGH NOT MATCHING ON DATA' ELSE 'SUCCESS' END as Message
 FROM
(select count(1) cnt 
from intuit_mdsdb.question_answer_final b left join intuit_mdwdb.f_incident_variable_c a
 
on a.row_id=b.sys_id
and a.source_id=b.sourceinstance
left join intuit_mdwdb.d_variable_lov_c c
on b.value=c.value
and b.question=c.variable_id
left join intuit_workdb.lsm_ls_variable_list aaa on  b.question=aaa.row_id  where  aaa.table_name ='incident'
and aaa.variable_type='Select Box'

and coalesce(c.row_key, case when b.value is null or  b.question  is null then 0 else -1 end ) <>a.reference_c_key )x 


Incident_Variable_LOV_DUPLICATES_check_mysql.sql :: 


 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt>0 THEN 'PASSTHROUGH NOT MATCHING ON DATA' ELSE 'SUCCESS' END as Message
 FROM(
select count(1) as cnt from(
select row_id,text,value,count(1) from intuit_mdwdb.d_variable_lov_c 
group by 1,2,3
having count(1)>1
)A)TEMP 


Incident_Variable_LOV_Passthrough_check_mysql.sql :: 


 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt>0 THEN 'PASSTHROUGH NOT MATCHING ON DATA' ELSE 'SUCCESS' END as Message
 FROM(
select count(1) as cnt from(
 select a.value as v1,c.value as v2,a.text as t1,c.text as t2,a.question,c.variable_id 
from intuit_mdsdb.question_choice_final a
join intuit_workdb.lsm_ls_variable_list b on a.sys_id=b.row_id
left join intuit_mdwdb.d_variable_lov_c c
on a.sys_id=c.row_id and a.sourceinstance=c.source_id where 
a.value<>c.value or 
a.text<>c.text or 
a.question<>c.variable_id)A)TEMP 


Incident_Variable_Passthrough_check_mysql.sql :: 


 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt>0 THEN 'PASSTHROUGH NOT MATCHING ON DATA' ELSE 'SUCCESS' END as Message
 FROM(
select count(1) as cnt from 
intuit_mdsdb.question_final a
join intuit_workdb.lsm_ls_variable_list b on a.sys_id=b.row_id
left join intuit_mdsdb.sys_choice_final t  on t.name='question' and a.type=t.value
left join intuit_mdwdb.d_variable c
on a.sys_id=c.row_id and a.sourceinstance=c.source_id where a.question_text<>c.question_text or 
a.name<>c.name or
a.Reference<>c.Reference or
a.Choice_table<>c.Choice_table or
a.Choice_field<>c.choice_column or 
t.label<>c.variable_type)temp 


Incident_Variable_SYS_USER_KEY_check_mysql.sql :: 


 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt>0 THEN 'PASSTHROUGH NOT MATCHING ON DATA' ELSE 'SUCCESS' END as Message
 FROM(
select count(1) as cnt from(
select a.sys_user_key,b.value,c.name,c.reference,d.row_key
from intuit_mdwdb.f_incident_variable_c a
inner join intuit_mdsdb.question_answer_final b
on a.row_id=b.sys_id
and a.source_id=b.sourceinstance
inner join intuit_mdwdb.d_variable c
on b.question=c.row_id
and b.sourceinstance=c.source_id
inner join intuit_mdwdb.d_internal_contact d
on concat('INTERNAL_CONTACT~',b.value)=d.row_id
and b.sourceinstance=d.source_id
where c.reference='sys_user' AND a.sys_user_key<>d.row_key)a)temp 


Incident_Variable_VARIABLE_KEY_check_mysql.sql :: 


 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt>0 THEN 'PASSTHROUGH NOT MATCHING ON DATA' ELSE 'SUCCESS' END as Message
 FROM(
select count(1) as cnt from(
select a.variable_key,b.value,c.name,c.reference,c.row_key
from intuit_mdwdb.f_incident_variable_c a
inner join intuit_mdsdb.question_answer_final b
on a.row_id=b.sys_id
and a.source_id=b.sourceinstance
inner join intuit_mdwdb.d_variable c
on b.question=c.row_id
and b.sourceinstance=c.source_id
where  a.variable_key<>c.row_key)A)temp 


Request_Item_ACCESS_1L_KEY_check_mysql.sql :: 


 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt>0 THEN 'PASSTHROUGH NOT MATCHING ON DATA' ELSE 'SUCCESS' END as Message
 FROM(
select count(1) as cnt from(
select access_l1_key,d.row_key
from intuit_mdwdb.f_request_item_variable_c a
inner join intuit_mdsdb.sc_item_option_final b
on a.row_id=b.sys_id
and a.source_id=b.sourceinstance
inner join intuit_mdwdb.d_variable c
on b.item_option_new=c.row_id
and b.sourceinstance=c.source_id
inner join intuit_mdwdb.d_access_l1_c d
on b.value=d.row_id
and b.sourceinstance=d.source_id
where c.choice_table='u_access_l1' AND a.access_l1_key<>d.row_key)A)TEMP 


Request_Item_ACCESS_APPLN_KEY_check_mysql.sql :: 


 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt>0 THEN 'PASSTHROUGH NOT MATCHING ON DATA' ELSE 'SUCCESS' END as Message
 FROM(
select count(1) as cnt from(select a.sys_user_key,b.value,c.name,c.reference,c.row_key
from intuit_mdwdb.f_request_item_variable_c a
inner join intuit_mdsdb.sc_item_option_final b
on a.row_id=b.sys_id
and a.source_id=b.sourceinstance
inner join intuit_mdwdb.d_variable c
on b.item_option_new=c.row_id
and b.sourceinstance=c.source_id
inner join intuit_mdwdb.d_access_application_c d
on b.value=d.row_id
and b.sourceinstance=d.source_id
where c.reference='u_access_application' AND a.access_application_key<>d.row_key)A)TEMP 


Request_Item_ACCESS_ENVIRONMENT_KEY_check_mysql.sql :: 


 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt>0 THEN 'PASSTHROUGH NOT MATCHING ON DATA' ELSE 'SUCCESS' END as Message
 FROM(
select count(1) as cnt from(
select a.sys_user_key,b.value,c.name,c.reference,c.row_key
from intuit_mdwdb.f_request_item_variable_c a
inner join intuit_mdsdb.sc_item_option_final b
on a.row_id=b.sys_id
and a.source_id=b.sourceinstance
inner join intuit_mdwdb.d_variable c
on b.item_option_new=c.row_id
and b.sourceinstance=c.source_id
inner join intuit_mdwdb.d_access_environments_c d
on b.value=d.row_id
and b.sourceinstance=d.source_id
where c.reference='u_access_environments' AND a.access_environment_key<>d.row_key)a)temp 


Request_Item_BUFG_KEY_check_mysql.sql :: 


 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt>0 THEN 'PASSTHROUGH NOT MATCHING ON DATA' ELSE 'SUCCESS' END as Message
 FROM(
select count(1) as cnt from(
select a.bufg_key,d.row_key
from intuit_mdwdb.f_request_item_variable_c a
inner join intuit_mdsdb.sc_item_option_final b
on a.row_id=b.sys_id
and a.source_id=b.sourceinstance
inner join intuit_mdwdb.d_variable c
on b.item_option_new=c.row_id
and b.sourceinstance=c.source_id
inner join intuit_mdwdb.d_bufg_c d
on b.value=d.row_id
and b.sourceinstance=d.source_id
where c.reference='u_bufg' AND a.bufg_key<>d.row_key
)A)TEMP 


Request_Item_CONFIG_APPLN_KEY_check_mysql.sql :: 


 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt>0 THEN 'PASSTHROUGH NOT MATCHING ON DATA' ELSE 'SUCCESS' END as Message
 FROM(
select count(1) as cnt from(
select a.sys_user_key,b.value,c.name,c.reference,c.row_key
from intuit_mdwdb.f_request_item_variable_c a
inner join intuit_mdsdb.sc_item_option_final b
on a.row_id=b.sys_id
and a.source_id=b.sourceinstance
inner join intuit_mdwdb.d_variable c
on b.item_option_new=c.row_id
and b.sourceinstance=c.source_id
inner join intuit_mdwdb.d_configuration_application_c d
on b.value=d.row_id
and b.sourceinstance=d.source_id
where c.reference='cmdb_ci_appl' AND a.configuration_application_key<>d.row_key)a)temp 


Request_Item_REFERENCE_C_KEY_check_mysql.sql :: 


 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt>0 THEN 'PASSTHROUGH NOT MATCHING ON DATA' ELSE 'SUCCESS' END as Message
 FROM(
select count(1) as cnt from(
select a.reference_c_key aa,b.value,c.row_key bb
from intuit_mdwdb.f_request_item_variable_c a
inner join intuit_mdsdb.sc_item_option_final b
on left(a.row_id,32)=b.sys_id
and a.source_id=b.sourceinstance
left join intuit_mdwdb.d_variable_lov_c c
on b.value=c.value
and b.item_option_new=c.variable_id
)asd
where aa<>bb )TEMP 


Request_Item_REQUEST_ITEM_KEY_check_mysql.sql :: 


 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt>0 THEN 'PASSTHROUGH NOT MATCHING ON DATA' ELSE 'SUCCESS' END as Message
 FROM(
select count(1) as cnt from(
select a.request_item_key aa,c.row_key bb
from intuit_mdwdb.f_request_item_variable_c a
inner join intuit_mdsdb.sc_item_option_final b
on a.row_id=b.sys_id
and a.source_id=b.sourceinstance
inner join intuit_mdsdb.sc_item_option_mtom_final d
on d.sc_item_option=b.sys_id
inner join intuit_mdwdb.d_request_item c
on d.request_item=c.row_id and c.source_id=d.sourceinstance
)asd
where aa<>bb )TEMP 


Request_Item_SERVICE_DELIVER_TEAM_14S_KEY_check_mysql.sql :: 


 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt>0 THEN 'PASSTHROUGH NOT MATCHING ON DATA' ELSE 'SUCCESS' END as Message
 FROM(
select count(1) as cnt from(
select a.service_delivery_team_l4s_key,d.row_key
from intuit_mdwdb.f_request_item_variable_c a
inner join intuit_mdsdb.sc_item_option_final b
on a.row_id=b.sys_id
and a.source_id=b.sourceinstance
inner join intuit_mdwdb.d_variable c
on b.item_option_new=c.row_id
and b.sourceinstance=c.source_id
inner join intuit_mdwdb.d_service_delivery_team_l4s_c d
on b.value=d.row_id
and b.sourceinstance=d.source_id
where c.reference='u_service_delivery_team_l4s' AND a.service_delivery_team_l4s_key<>d.row_key)A)TEMP 


Request_Item_SYS_USER_KEY_check_mysql.sql :: 


 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt>0 THEN 'PASSTHROUGH NOT MATCHING ON DATA' ELSE 'SUCCESS' END as Message
 FROM(
select count(1) as cnt from(
select a.sys_user_key,b.value,c.name,c.reference,d.row_key
from intuit_mdwdb.f_request_item_variable_c a
inner join intuit_mdsdb.sc_item_option_final b
on a.row_id=b.sys_id
and a.source_id=b.sourceinstance
inner join intuit_mdwdb.d_variable c
on b.item_option_new=c.row_id
and b.sourceinstance=c.source_id
inner join intuit_mdwdb.d_internal_contact d
on concat('INTERNAL_CONTACT~',b.value)=d.row_id
and b.sourceinstance=d.source_id
where c.reference='sys_user' AND a.sys_user_key<>d.row_key)A)TEMP 


Request_Item_VARIABLE_KEY_check_mysql.sql :: 


 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt>0 THEN 'PASSTHROUGH NOT MATCHING ON DATA' ELSE 'SUCCESS' END as Message
 FROM(
select count(1) as cnt from(
select a.variable_key,b.value,c.name,c.reference,c.row_key
from intuit_mdwdb.f_request_item_variable_c a
inner join intuit_mdsdb.sc_item_option_final b
on a.row_id=b.sys_id
and a.source_id=b.sourceinstance
inner join intuit_mdwdb.d_variable c
on b.item_option_new=c.row_id
and b.sourceinstance=c.source_id
where  a.variable_key<>c.row_key)A)TEMP 


