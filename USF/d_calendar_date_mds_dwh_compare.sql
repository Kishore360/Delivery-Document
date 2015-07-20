SELECT CASE WHEN COUNT(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result,
CASE WHEN COUNT(1) >0 THEN 
'MDS to DWH data validation failed for d_calander_date.#DWH_column_NAME' ELSE 'SUCCESS' END AS Message
FROM (SELECT  CONCAT(YEAR(DS_DATE_SEED.DATE)
,CASE WHEN MONTH(DS_DATE_SEED.DATE) < 10 THEN CONCAT('0' 
,MONTH(DS_DATE_SEED.DATE)) ELSE MONTH(DS_DATE_SEED.DATE)  END 
,CASE WHEN DAY(DS_DATE_SEED.DATE) < 10 THEN CONCAT('0' 
, DAY(DS_DATE_SEED.DATE))
ELSE DAY(DS_DATE_SEED.DATE) END ) AS row_id,
#STG_column_NAME as  DATE1
FROM #MDS_TABLE_SCHEMA.DS_DATE_SEED  
)A1
LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date
ON CONVERT(d_calendar_date.row_id USING utf8) = CONVERT(A1.row_id USING utf8) 
AND CALENDAR_CODE ='0'
WHERE CONVERT(d_calendar_date.#DWH_column_NAME USING utf8) <> 
CONVERT(A1.DATE1 USING utf8)

