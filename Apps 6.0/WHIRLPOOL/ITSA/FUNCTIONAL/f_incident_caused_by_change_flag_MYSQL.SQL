SELECT CASE WHEN cnt>0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt>0  THEN 'MDS to DWH data validation failed for f_incident.caused_by_change_flag' ELSE 'SUCCESS' END as Message 
FROM (select count(1) as cnt from whirlpool_mdsdb.incident_final SRC
left join whirlpool_mdwdb.d_incident TRGT
on SRC.sys_id=TRGT.row_id and SRC.sourceinstance=TRGT.source_id
where IF(SRC.caused_by is not null,'Y','N')<>TRGT.caused_by_change_flag
and SRC.cdctype='X')ma
