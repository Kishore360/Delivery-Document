select a.ci_type,avg(a.missing_gxp_classification_flag_count) as Missing_GxP_Classificatipon_Flag
from ldb.a_configuration_item_aggregator_weekly_c a 
join ldb.d_calendar_date b  on (a.aggregate_c_key = b.row_key)
group by 1;