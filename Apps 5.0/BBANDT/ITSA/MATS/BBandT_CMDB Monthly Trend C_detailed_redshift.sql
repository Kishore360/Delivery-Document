SELECT 'a_cmdb_aggregator_monthly_c' as Table_Name , Count(1) as Row_Count 
FROM ldb.a_cmdb_aggregator_monthly_c a 
UNION 
SELECT 'd_cmdb_aggregator_monthly_c' as Table_Name , Count(1) as Row_Count 
FROM ldb.a_cmdb_aggregator_monthly_c a 
JOIN ldb.d_cmdb_aggregator_monthly_c b ON a.cmdb_aggregator_monthly_c_key=b.row_key
UNION 
SELECT 'd_calendar_date' as Table_Name , Count(1) as Row_Count 
FROM ldb.a_cmdb_aggregator_monthly_c a 
JOIN ldb.d_calendar_date b ON a.aggregate_c_key=b.row_key
UNION
SELECT 'd_calendar_month' as Table_Name , Count(1) as Row_Count 
FROM ldb.a_cmdb_aggregator_monthly_c a 
JOIN ldb.d_calendar_date b ON a.aggregate_c_key=b.row_key
JOIN ldb.d_calendar_month c ON b.month_start_date_key=c.row_key




