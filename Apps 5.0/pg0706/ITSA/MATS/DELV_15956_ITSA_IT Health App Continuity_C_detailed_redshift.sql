/* ldb.f_it_health_app_continuity_c_fact   a11
                join          ldb.d_it_health_app_continuity_c          a12
                  on          (a11.it_health_app_continuity_c_key = a12.row_key)
                join          ldb.d_calendar_date_fiscal    a13
                  on          (a11.fiscal_date_key_c = a13.row_key)
                join          ldb.d_calendar_fiscal_quarter               a14
                  on          (a13.quarter_start_date_key = a14.row_key)
                join          ldb.d_calendar_fiscal_year   a15
                  on          (a13.year_start_date_key = a15.row_key) */

				  
Select 'f_it_health_app_continuity_c_fact' AS Table_Name, Count(1) as Row_Count 
FROM ldb.f_it_health_app_continuity_c_fact a 
UNION 
Select 'd_it_health_app_continuity_c' AS Table_Name, Count(1) as Row_Count 
FROM ldb.f_it_health_app_continuity_c_fact a 
JOIN ldb.d_it_health_app_continuity_c b  ON a.it_health_app_continuity_c_key=b.row_key
UNION 
Select 'd_calendar_date_fiscal' AS Table_Name, Count(1) as Row_Count 
FROM ldb.f_it_health_app_continuity_c_fact a 
JOIN ldb.d_calendar_date_fiscal b  ON a.fiscal_date_key_c=b.row_key
UNION 
Select 'd_calendar_fiscal_quarter' AS Table_Name, Count(1) as Row_Count 
FROM ldb.f_it_health_app_continuity_c_fact a 
JOIN ldb.d_calendar_date_fiscal b  ON a.fiscal_date_key_c=b.row_key
JOIN ldb.d_calendar_fiscal_quarter c ON b.quarter_start_date_key=c.row_key
UNION 
Select 'd_calendar_fiscal_year' AS Table_Name, Count(1) as Row_Count 
FROM ldb.f_it_health_app_continuity_c_fact a 
JOIN ldb.d_calendar_date_fiscal b  ON a.fiscal_date_key_c=b.row_key
JOIN ldb.d_calendar_fiscal_quarter c ON b.quarter_start_date_key=c.row_key
JOIN ldb.d_calendar_fiscal_year d ON c.year_start_date_key=d.row_key



 

