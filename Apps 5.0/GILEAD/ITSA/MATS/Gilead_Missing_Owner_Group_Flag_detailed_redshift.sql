
select a.ci_type,
avg(a.missing_owner_group_flag_count) as Missing_Owner_Group_Flag
from ldb.a_configuration_item_aggregator_weekly_c a 
join ldb.d_calendar_date b  on (a.aggregate_c_key = b.row_key)
group by 1;
