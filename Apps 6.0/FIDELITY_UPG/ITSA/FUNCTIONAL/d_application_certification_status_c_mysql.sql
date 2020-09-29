SELECT SRC.u_certification_date, DATEDIFF(date(df.lastupdated),date(CONVERT_TZ(SRC.u_certification_date,'UTC','America/New_York'))),
DATEDIFF(date(df.lastupdated),date(CONVERT_TZ(SRC.u_certification_date,'UTC','America/New_York'))),
DATEDIFF(date(df.lastupdated),date(CONVERT_TZ(SRC.u_certification_date,'UTC','America/New_York'))),
DATEDIFF(date(df.lastupdated),date(CONVERT_TZ(SRC.u_certification_date,'UTC','America/New_York'))),
TRGT.certification_status_c
FROM (select * from fidelity_mdsdb.cmdb_ci_appl_final where cdctype <> 'D') SRC
JOIN fidelity_mdwdb.d_application TRGT
ON (CONCAT('APPLICATION~',SRC.sys_id) = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id )
INNER JOIN ( select source_id, max(lastupdated) as lastupdated from fidelity_mdwdb.d_o_data_freshness where source_id = 2 ) df
ON TRGT.source_id=df.source_id
WHERE CASE
WHEN CONVERT_TZ(SRC.u_certification_date,'UTC','America/New_York') is NULL THEN 'Not Certified'
WHEN DATEDIFF(date(df.lastupdated),date(CONVERT_TZ(SRC.u_certification_date, 'UTC', 'America/New_York')))<150 THEN 'Certified'
WHEN (
DATEDIFF(date(df.lastupdated),date(CONVERT_TZ(SRC.u_certification_date,'UTC', 'America/New_York')))>=150
and DATEDIFF(date(df.lastupdated),date(CONVERT_TZ(SRC.u_certification_date,'UTC', 'America/New_York')))< 180
) THEN 'Approaching Out of Date'
WHEN (
DATEDIFF(date(df.lastupdated),date(CONVERT_TZ(SRC.u_certification_date,'UTC', 'America/New_York')))>=180
) THEN 'Out of Date'
END
<>(TRGT.certification_status_c)