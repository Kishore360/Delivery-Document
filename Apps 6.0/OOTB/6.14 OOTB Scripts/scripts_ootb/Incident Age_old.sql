select  
dicomp.organization_name as "company name",dio.organization_name as "Assignment group",ci.name as Configuration_item,
'' as Metrics,
concat(cast(sum(fi.age)as integer)/cast(count(fi.row_key)as integer),' days') as "avg of incident age",
concat(round(cast(sum(CASE WHEN dvm.dimension_wh_code = 'RESOLVED'  THEN 1 ELSE 0 end)as numeric)/
cast(count(fi.row_key)as numeric) *100 :: integer),'%') as "Incident fixed rate" ,
sum(case when di.multiple_categorization_flag = 'Y' then 1 else 0 end )as "multiple categorization incidents",
 concat(round(cast(sum(CASE WHEN dvm.dimension_wh_code = 'Y'  THEN 1 ELSE 0 end)as numeric)/
cast(count(fi.row_key)as numeric) *100 :: integer),'%')
as "Multiple categorization incidents percent",
OpnCI.OPENEDINCIDENTSCI
from  #DWH_TABLE_SCHEMA.f_incident fi 
--join #DWH_TABLE_SCHEMA.d_internal_contact dc
--on  fi.opened_by_key = dc.row_key
 join #DWH_TABLE_SCHEMA.d_incident di
on  fi.incident_key = di.row_key
 join #DWH_TABLE_SCHEMA.d_calendar_date dcd
on  fi.opened_on_key = dcd.row_key
join #DWH_TABLE_SCHEMA.d_internal_organization dio 
on fi.assignment_group_key = dio.row_key
 join #DWH_TABLE_SCHEMA.d_internal_organization dicomp 
  on fi.company_key = dicomp.row_key
  join  #DWH_TABLE_SCHEMA.d_lov  dv 
on fi.state_src_key  = dv.row_key
 join  #DWH_TABLE_SCHEMA.d_lov_map dvm
on dvm.dimension_code  = dv.dimension_code
and dvm.dimension_class=dv.dimension_class
--join #DWH_TABLE_SCHEMA.d_domain dom
--on dom.row_key = fi.domain_key
join #DWH_TABLE_SCHEMA.d_configuration_item ci
on fi.configuration_item_key = ci.row_key
join (select cii.name as configuration_item ,sum( CASE WHEN dvmi.dimension_wh_code = 'OPEN'  THEN 1 ELSE 0 end)
 as "OPENEDINCIDENTSCI"
 from #DWH_TABLE_SCHEMA.f_incident fii 
 join #DWH_TABLE_SCHEMA.d_incident dii
 on  fii.incident_key = dii.row_key
 join  #DWH_TABLE_SCHEMA.d_lov  dvi 
on fii.state_src_key  = dvi.row_key
 join  #DWH_TABLE_SCHEMA.d_lov_map dvmi
on dvmi.dimension_code  = dvi.dimension_code
and dvmi.dimension_class=dvi.dimension_class
join #DWH_TABLE_SCHEMA.d_calendar_date dcdi
on  fii.opened_on_key = dcdi.row_key

join #DWH_TABLE_SCHEMA.d_configuration_item cii
on fii.configuration_item_key = cii.row_key
where dcdi.lagging_count_of_month between 0 and 12
group by cii.name

)  OpnCI
on OpnCI.configuration_item= ci.name
where dcd.lagging_count_of_month between 0 and 12
group by  dicomp.organization_name ,dio.organization_name ,ci.name,OpnCI.OPENEDINCIDENTSCI
order by  dicomp.organization_name ,dio.organization_name ,ci.name,OpnCI.OPENEDINCIDENTSCI  asc



