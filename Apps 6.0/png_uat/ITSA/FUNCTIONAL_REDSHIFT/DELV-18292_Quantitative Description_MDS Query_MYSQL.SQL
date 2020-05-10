SELECT SRC.u_quantitative_description,
Count(distinct SRC.number) as CNT 
FROM png_mdsdb.incident_final SRC 
LEFT JOIN png_mdwdb.d_incident TRGT ON SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
LEFT JOIN png_mdwdb.d_calendar_date DA ON COALESCE(DATE_FORMAT(SRC.opened_at,'%Y%m%d'),'UNSPECIFIED')=DA.row_id
WHERE SRC.cdctype='X'
AND DA.lagging_count_of_month between 0 and 26
GROUP BY 1;