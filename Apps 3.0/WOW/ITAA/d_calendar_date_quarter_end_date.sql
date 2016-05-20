SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_calendar_date.' ELSE 'SUCCESS' END as Message
FROM  #STG_TABLE_SCHEMA.DS_DATE_SEED SRC
LEFT OUTER JOIN(SELECT MAX(DATE(DATE)) AS QUARTER_END_DATE,
                          MIN(DATE(DATE)) AS QUARTER_START_DATE
    FROM #STG_TABLE_SCHEMA.DS_DATE_SEED
    WHERE DATE BETWEEN '1970-01-01 00:00:00' AND '2030-12-31 00:00:00'
    GROUP BY CAST(CONCAT(DATE_FORMAT(DATE,'%Y'),QUARTER(DATE)) AS SIGNED)) SRC4
ON CAST(DATE_FORMAT(SRC.`DATE`,'%Y') AS SIGNED) = CAST(CONCAT(DATE_FORMAT(SRC4.QUARTER_END_DATE,'%Y'),QUARTER(SRC4.QUARTER_END_DATE)) AS SIGNED) 
LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date TRGT
ON(CONCAT(CONCAT(DATE_FORMAT(SRC.`DATE`,'%Y'),DATE_FORMAT(SRC.`DATE`,'%m')),DATE_FORMAT(SRC.`DATE`,'%d')) =TRGT.row_id)
WHERE SRC.`DATE` BETWEEN '1970-01-01 00:00:00' AND '2030-12-31 00:00:00'
AND SRC4.QUARTER_END_DATE<>TRGT.quarter_end_date
