select  ci.class as "configuration item class", 
''as metric,sum(case when di.auto_generated_flag = 'Y' then 1 else 0 end) as "autogenerated flag"
from  #DWH_TABLE_SCHEMA.f_incident fi 
left join #DWH_TABLE_SCHEMA.d_incident di
on  fi.incident_key = di.row_key
left join #DWH_TABLE_SCHEMA.d_configuration_item ci 
on fi.configuration_item_key = ci.row_key
left join #DWH_TABLE_SCHEMA.d_calendar_date dcd
on  fi.opened_on_key = dcd.row_key
where dcd.lagging_count_of_month between 0 and 12
and fi.soft_deleted_flag ='N'
group by ci.class
order by ci.class