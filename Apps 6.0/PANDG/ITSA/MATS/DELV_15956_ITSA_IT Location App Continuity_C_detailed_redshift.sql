/* d_calendar_date_fiscal
d_calendar_fiscal_quarter
d_calendar_fiscal_year
d_it_location_continuity_c
f_it_location_continuity_c_fact */



SELECT 'f_it_location_continuity_c_fact' AS Table_Name,Count(1) as CNT 
FROM ldb.f_it_location_continuity_c_fact a
UNION 
SELECT 'd_it_location_continuity_c' AS Table_Name,Count(1) as CNT 
FROM ldb.f_it_location_continuity_c_fact a
JOIN ldb.d_it_location_continuity_c b ON a.it_loc_continuity_c_key=b.row_key 
UNION 
SELECT 'd_calendar_date_fiscal' AS Table_Name,Count(1) as CNT 
FROM ldb.f_it_location_continuity_c_fact a
JOIN ldb.d_calendar_date_fiscal b ON  a.fiscal_date_key_c=b.row_key
UNION 
SELECT 'd_calendar_fiscal_quarter' AS Table_Name,Count(1) as CNT 
FROM ldb.f_it_location_continuity_c_fact a
JOIN ldb.d_calendar_date_fiscal b ON  a.fiscal_date_key_c=b.row_key
JOIN ldb.d_calendar_fiscal_quarter c ON b.quarter_start_date_key=c.row_key 
UNION 
SELECT 'd_calendar_fiscal_year' AS Table_Name,Count(1) as CNT 
FROM ldb.f_it_location_continuity_c_fact a
JOIN ldb.d_calendar_date_fiscal b ON  a.fiscal_date_key_c=b.row_key
JOIN ldb.d_calendar_fiscal_quarter c ON b.quarter_start_date_key=c.row_key 
JOIN ldb.d_calendar_fiscal_year d ON b.year_start_date_key=d.row_key






