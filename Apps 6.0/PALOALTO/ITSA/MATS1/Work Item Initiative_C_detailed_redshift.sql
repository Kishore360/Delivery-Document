select 'ldb.f_initiative_fact_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_initiative_fact_c a11 
union
select 'ldb.d_work_item_initiative_c a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_initiative_fact_c a11 
join ldb.d_work_item_initiative_c a12 
on (a11.work_item_initiative_c_key = a12.row_key) 
union
select 'ldb.d_calendar_date a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_initiative_fact_c a11 
join ldb.d_calendar_date a13 
on (a11.date_key = a13.row_key) 
union
select 'ldb.d_calendar_month a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_initiative_fact_c a11 
join ldb.d_calendar_date a13 
on (a11.date_key = a13.row_key) 
join ldb.d_calendar_month a14 
on (a13.month_start_date_key = a14.row_key) 
union
select 'ldb.d_calendar_quarter a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_initiative_fact_c a11 
join ldb.d_calendar_date a13 
on (a11.date_key = a13.row_key) join ldb.d_calendar_month a14 
on (a13.month_start_date_key = a14.row_key) 
join ldb.d_calendar_quarter a15 
on (a14.quarter_start_date_key = a15.row_key) 
union
select 'ldb.d_calendar_date_fiscal a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_initiative_fact_c a11 
join ldb.d_calendar_date_fiscal a16 
on (a11.fiscal_date_key_c = a16.row_key) 
union
select 'ldb.d_calendar_week a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_initiative_fact_c a11 
join ldb.d_calendar_date a13 
on (a11.date_key = a13.row_key) 
join ldb.d_calendar_week a17 
on (a13.week_start_date_key = a17.row_key) 
union
select 'ldb.d_calendar_fiscal_period a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_initiative_fact_c a11 
join ldb.d_calendar_date_fiscal a16 
on (a11.fiscal_date_key_c = a16.row_key) 
join ldb.d_calendar_fiscal_period a18 
on (a16.period_start_date_key = a18.row_key) 
union
select 'ldb.d_initiative_business_value_category_c a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_initiative_fact_c a11 
join ldb.d_work_item_initiative_c a12 
on (a11.work_item_initiative_c_key = a12.row_key) 
join ldb.d_initiative_business_value_category_c a19 
on (a12.initiative_business_value_category_key_c = a19.row_key) 
union
select 'ldb.d_initiative_health_c a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_initiative_fact_c a11 
join ldb.d_work_item_initiative_c a12 
on (a11.work_item_initiative_c_key = a12.row_key) 
join ldb.d_initiative_health_c a110 
on (a12.initiative_health_key_c = a110.row_key) 
union
select 'ldb.d_initiative_methdology_c a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_initiative_fact_c a11 
join ldb.d_work_item_initiative_c a12 
on (a11.work_item_initiative_c_key = a12.row_key) 
join ldb.d_initiative_methdology_c a111 
on (a12.initiative_methdology_key_c = a111.row_key) 
union
select 'ldb.d_initiative_phase_c a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_initiative_fact_c a11 
join ldb.d_work_item_initiative_c a12 
on (a11.work_item_initiative_c_key = a12.row_key) 
join ldb.d_initiative_phase_c a112 
on (a12.initiative_phase_key_c_key = a112.row_key) 
union
select 'ldb.d_initiative_size_c a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_initiative_fact_c a11 
join ldb.d_work_item_initiative_c a12 
on (a11.work_item_initiative_c_key = a12.row_key) 
join ldb.d_initiative_size_c a113 
on (a12.initiative_size_key_c = a113.row_key) 
union
select 'ldb.d_calendar_fiscal_quarter a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_initiative_fact_c a11 
join ldb.d_calendar_date_fiscal a16 
on (a11.fiscal_date_key_c = a16.row_key) 
join ldb.d_calendar_fiscal_quarter a114 
on (a16.quarter_start_date_key = a114.row_key) 
union
select 'ldb.d_calendar_year a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_initiative_fact_c a11 
join ldb.d_calendar_date a13 
on (a11.date_key = a13.row_key) join ldb.d_calendar_month a14 
on (a13.month_start_date_key = a14.row_key) join ldb.d_calendar_quarter a15 
on (a14.quarter_start_date_key = a15.row_key) 
join ldb.d_calendar_year a115 
on (a15.year_start_date_key = a115.row_key) 
union
select 'ldb.d_calendar_fiscal_year a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_initiative_fact_c a11 
join ldb.d_calendar_date_fiscal a16 
on (a11.fiscal_date_key_c = a16.row_key) 
join ldb.d_calendar_fiscal_year a116 
on (a16.year_start_date_key = a116.row_key) 

*************************************************************************************************************88


From: Bhavana Jayaprakash <Bhavana@numerify.com> 
Sent: Wednesday, June 12, 2019 5:13 PM
To: Pavanasurya Subrahmanyam Meduri <pavanasurya.s@numerify.com>
Cc: Sneha Venkatesh <sneha.v@numerify.com>
Subject: Work Item Initiative_C - Paloalto

Report: one pass Work Item Initiative_C
Job: 95068
Report Cache Used: No

Number of Columns Returned:                  78
Number of Temp Tables:                               0

Total Number of Passes:                               3
Number of SQL Passes:                  3
Number of Analytical Passes:                      0

Tables Accessed:
d_calendar_date
d_calendar_date_fiscal
d_calendar_fiscal_period
d_calendar_fiscal_quarter
d_calendar_fiscal_year
d_calendar_month
d_calendar_quarter
d_calendar_week
d_calendar_year
d_initiative_business_value_category_c
d_initiative_health_c
d_initiative_methdology_c
d_initiative_phase_c
d_initiative_size_c
d_work_item_initiative_c
f_initiative_fact_c


SQL Statements:

set query_group to 'MSTRReport=one pass Work Item Initiative_C;'

select    a12.business_leader AS business_leader,
                a12.is_url AS is_url,
                a12.key_initiative AS key_initiative,
                a12.program AS program,
                a12.l_1_business_capability AS l_1_business_capability,
                a12.health_note AS health_note,
                a12.initiative_created_by AS initiative_created_by,
                a12.initiative_modified_by AS initiative_modified_by,
                a16.quarter_start_date_key AS Quarter_Fiscal_Row_Key,
                max(a114.quarter_name) AS quarter_name,
                a16.year_start_date_key AS Year_Fiscal_row_key,
                max(a116.year_name) AS year_name,
                a12.expected_bv_unit_type_c AS expected_bv_unit_type_c,
                a12.current_fiscal_quarter_c AS current_fiscal_quarter_c,
                a12.revised_delivery_quarter_c AS revised_delivery_quarter_c,
                a15.lagging_count_of_quarter AS lagging_count_of_quarter0,
                a17.lagging_count_of_weeks AS lagging_count_of_weeks,
                a14.quarter_start_date_key AS row_key,
                max(a15.quarter_name) AS quarter_name0,
                a13.week_start_date_key AS row_key0,
                max(a17.week_start_day_name) AS week_name,
                a15.year_start_date_key AS row_key1,
                max(a115.year_name) AS year_name0,
                a11.date_key AS Calendar_Date_Row_key,
                max(a13.calendar_date_d) AS calendar_date,
                a12.planned_start_date_c AS planned_start_date_c,
                a12.scrum_manager_c AS scrum_manager_c,
                a12.planned_end_date_c AS planned_end_date_c,
                a12.actual_end_date_c AS actual_end_date_c,
                a12.revised_end_date_c AS revised_end_date_c,
                a12.revised_start_date_c AS revised_start_date_c,
                a12.revised_fy_c AS revised_fy_c,
                a12.end_customer_c AS end_customer_c,
                a12.actual_start_date_c AS actual_start_date_c,
                a12.key_initiative_lookup_c AS key_initiative_lookup_c,
                a12.key_project_c AS key_project_c,
                a12.completion_date_c AS completion_date_c,
                a12.strategic_imperatives_c AS strategic_imperatives_c,
                a12.is_master AS is_master,
                a12.initiative_business_value_category_key_c AS row_key2,
                max(a19.source_dimension_name) AS source_dimension_name,
                a12.initiative_health_key_c AS row_key3,
                max(a110.source_dimension_name) AS source_dimension_name0,
                a12.initiative_phase_key_c_key AS row_key4,
                max(a112.source_dimension_name) AS source_dimension_name1,
                a12.closed_on_time_flag AS closed_on_time_flag,
                a12.upcoming_flag AS upcoming_flag,
                a12.commit_financial_year AS commit_financial_year,
                a12.commit_quarter AS commit_quarter,
                a12.end_date AS end_date,
                a12.department AS department,
                a12.it_product_manager AS it_product_manager,
                a12.start_date AS start_date,
                a11.work_item_initiative_c_key AS row_key5,
                max(a12.initiative_name) AS initiative_name,
                a12.commit_flag AS commit_flag,
                a12.initiative_methdology_key_c AS row_key6,
                max(a111.source_dimension_name) AS source_dimension_name2,
                a12.initiative_size_key_c AS row_key7,
                max(a113.source_dimension_name) AS source_dimension_name3,
                a12.description_c AS description_c,
                a13.calendar_date AS calendar_date_greg,
                a13.month_start_date_key AS month_start_date_key,
                max(a14.month_year) AS month_name,
                a13.lagging_count_of_days AS lagging_count_of_days0,
                a14.lagging_count_of_month AS lagging_count_of_month0,
                a12.epic_id_c AS epic_id_c,
                a12.value_chain_c AS value_chain_c,
                a12.current_fiscal_year_c AS current_fiscal_year_c,
                a11.fiscal_date_key_c AS row_key8,
                max(a16.calendar_date) AS calendar_date0,
                a16.period_start_date_key AS period_start_date_key,
                max(a18.period_name) AS period_name,
                a12.initiative_modified_date AS initiative_modified_date,
                a12.initiative_creation_date AS initiative_creation_date,
                a12.pm_log_url AS pm_log_url,
                a12.business_capabilities AS business_capabilities,
                max(a11.no_of_initiatives) AS WJXBFS1
from      ldb.f_initiative_fact_c    a11
                join        ldb.d_work_item_initiative_c     a12
                  on         (a11.work_item_initiative_c_key = a12.row_key)
                join        ldb.d_calendar_date      a13
                  on         (a11.date_key = a13.row_key)
                join        ldb.d_calendar_month  a14
                  on         (a13.month_start_date_key = a14.row_key)
                join        ldb.d_calendar_quarter a15
                  on         (a14.quarter_start_date_key = a15.row_key)
                join        ldb.d_calendar_date_fiscal          a16
                  on         (a11.fiscal_date_key_c = a16.row_key)
                join        ldb.d_calendar_week    a17
                  on         (a13.week_start_date_key = a17.row_key)
                join        ldb.d_calendar_fiscal_period     a18
                  on         (a16.period_start_date_key = a18.row_key)
                join        ldb.d_initiative_business_value_category_c        a19
                  on         (a12.initiative_business_value_category_key_c = a19.row_key)
                join        ldb.d_initiative_health_c             a110
                  on         (a12.initiative_health_key_c = a110.row_key)
                join        ldb.d_initiative_methdology_c  a111
                  on         (a12.initiative_methdology_key_c = a111.row_key)
                join        ldb.d_initiative_phase_c              a112
                  on         (a12.initiative_phase_key_c_key = a112.row_key)
                join        ldb.d_initiative_size_c   a113
                  on         (a12.initiative_size_key_c = a113.row_key)
                join        ldb.d_calendar_fiscal_quarter   a114
                  on         (a16.quarter_start_date_key = a114.row_key)
                join        ldb.d_calendar_year      a115
                  on         (a15.year_start_date_key = a115.row_key)
                join        ldb.d_calendar_fiscal_year          a116
                  on         (a16.year_start_date_key = a116.row_key)
where   (a14.lagging_count_of_month_d between 0 and 12
and a12.epic_id_c is not null)
group by              a12.business_leader,
                a12.is_url,
                a12.key_initiative,
                a12.program,
                a12.l_1_business_capability,
                a12.health_note,
                a12.initiative_created_by,
                a12.initiative_modified_by,
                a16.quarter_start_date_key,
                a16.year_start_date_key,
                a12.expected_bv_unit_type_c,
                a12.current_fiscal_quarter_c,
                a12.revised_delivery_quarter_c,
                a15.lagging_count_of_quarter,
                a17.lagging_count_of_weeks,
                a14.quarter_start_date_key,
                a13.week_start_date_key,
                a15.year_start_date_key,
                a11.date_key,
                a12.planned_start_date_c,
                a12.scrum_manager_c,
                a12.planned_end_date_c,
                a12.actual_end_date_c,
                a12.revised_end_date_c,
                a12.revised_start_date_c,
                a12.revised_fy_c,
                a12.end_customer_c,
                a12.actual_start_date_c,
                a12.key_initiative_lookup_c,
                a12.key_project_c,
                a12.completion_date_c,
                a12.strategic_imperatives_c,
                a12.is_master,
                a12.initiative_business_value_category_key_c,
                a12.initiative_health_key_c,
                a12.initiative_phase_key_c_key,
                a12.closed_on_time_flag,
                a12.upcoming_flag,
                a12.commit_financial_year,
                a12.commit_quarter,
                a12.end_date,
                a12.department,
                a12.it_product_manager,
                a12.start_date,
                a11.work_item_initiative_c_key,
                a12.commit_flag,
                a12.initiative_methdology_key_c,
                a12.initiative_size_key_c,
                a12.description_c,
                a13.calendar_date,
                a13.month_start_date_key,
                a13.lagging_count_of_days,
                a14.lagging_count_of_month,
                a12.epic_id_c,
                a12.value_chain_c,
                a12.current_fiscal_year_c,
                a11.fiscal_date_key_c,
                a16.period_start_date_key,
                a12.initiative_modified_date,
                a12.initiative_creation_date,
                a12.pm_log_url,
                a12.business_capabilities


[Analytical engine calculation steps:
]
