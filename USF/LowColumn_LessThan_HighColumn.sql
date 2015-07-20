

SELECT CASE WHEN COUNT(1)> 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result,CASE WHEN COUNT(1)> 0 THEN '#LOWER_COLUMN > #HIGHER_COLUMN for' || COUNT(1) || ' records in <<tablename>>' ELSE '#LOWER_COLUMN > #HIGHER_COLUMN for no records in <<tablename>> ' END AS Message FROM <<tablename>> WHERE #LOWER_COLUMN > #HIGHER_COLUMN
