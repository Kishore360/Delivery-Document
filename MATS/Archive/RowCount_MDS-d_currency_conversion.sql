

SELECT CASE WHEN  (count_mds = count_dwh) THEN 'SUCCESS' ELSE 'FAILURE' END AS Result
,CASE WHEN (count_mds =count_dwh) THEN 'Data Matched'
ELSE CONCAT( 'MDS-DWH RowCount did not Match for ', DWH.Table_DWH , '. MDS:',count_mds,'DWH : ' ,DWH.Count_DWH)
END AS Message
FROM (SELECT (
	SELECT COUNT(*) FROM(SELECT 
     CONCAT(FROM_CURRENCY_CODE,'~',TO_CURRENCY_CODE,'~',CONVERSION_TYPE,'~',DATE_FORMAT(a.CREATED_ON, '%Y%m%d') ) AS ROW_ID
	FROM 
	(SELECT
	CONCAT(Period,'~',TRIM(from_subsidiary),'~',TRIM(to_subsidiary)) AS R1,
	sourceinstance AS SOURCE_ID,
	(SELECT DISTINCT currency_internalid FROM #MDS_TABLE_SCHEMA.subsidiary_final WHERE NAME = us_exchangerate_delta.from_subsidiary)AS FROM_CURRENCY_CODE,
	(SELECT DISTINCT currency_internalid FROM #MDS_TABLE_SCHEMA.subsidiary_final WHERE NAME = us_exchangerate_delta.to_subsidiary)AS TO_CURRENCY_CODE,
	CASE WHEN cdctype IN ('A','M') THEN 'N' ELSE 'Y' END SOFT_DELETED_FLAG,
	(SELECT DISTINCT DATE(startdate) FROM #MDS_TABLE_SCHEMA.accountingperiod_final WHERE periodname = us_exchangerate_delta.period) AS CREATED_ON
	FROM #MDS_TABLE_SCHEMA.us_exchangerate_delta)a
	LEFT JOIN
	(
	SELECT CONCAT(period,'~',TRIM(from_subsidiary),'~',TRIM(to_subsidiary)) AS R2,
	CONCAT(TRIM(from_subsidiary),'~',TRIM(to_subsidiary),'~_current') AS ROW_ID,'_current' AS CONVERSION_TYPE,Current AS CONVERSION_RATE FROM #MDS_TABLE_SCHEMA.us_exchangerate_delta
	UNION ALL
	SELECT CONCAT(period,'~',TRIM(From_Subsidiary),'~',TRIM(to_subsidiary)) AS R2,
	CONCAT(TRIM(from_subsidiary),'~',TRIM(to_subsidiary),'~_average') AS ROW_ID,'_average' AS CONVERSION_TYPE,Average AS CONVERSION_RATE FROM #MDS_TABLE_SCHEMA.us_exchangerate_delta
	UNION ALL
	SELECT CONCAT(period,'~',TRIM(From_Subsidiary),'~',TRIM(to_subsidiary)) AS R2,
	CONCAT(TRIM(from_subsidiary),'~',TRIM(to_subsidiary),'~_historical') AS ROW_ID,'_historical' AS CONVERSION_TYPE,Historical AS CONVERSION_RATE FROM #MDS_TABLE_SCHEMA.us_exchangerate_delta
	)b
	ON a.R1 = b.R2
	WHERE a.FROM_CURRENCY_CODE IS NOT NULL AND a.TO_CURRENCY_CODE IS NOT NULL
	UNION
	SELECT DISTINCT CONCAT(currency_internalid,'~',currency_internalid,'~','_average') AS ROW_ID
	FROM #MDS_TABLE_SCHEMA.subsidiary_final 
	 UNION
	 SELECT DISTINCT CONCAT(currency_internalid,'~',currency_internalid,'~','_historical') AS ROW_ID
	FROM #MDS_TABLE_SCHEMA.subsidiary_final
	 UNION
	 SELECT DISTINCT CONCAT(currency_internalid,'~',currency_internalid,'~','_current') AS ROW_ID
	FROM #MDS_TABLE_SCHEMA.subsidiary_final)cc) + (SELECT COUNT(*) FROM #MDS_TABLE_SCHEMA.fx_rate_final) AS count_mds) MDS,
(SELECT COUNT(*) Count_DWH, 'd_currency_conversion'  Table_DWH 
FROM #TABLE_SCHEMA.d_currency_conversion WHERE row_key NOT IN (0,-1)) DWH
