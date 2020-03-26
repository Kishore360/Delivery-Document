 SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'Data mismatch for d_apica_checks.timestamp_utc' ELSE 'SUCCESS' END as Message 
from equifax_mdsdb.apica_checks_c a
join equifax_mdwdb.d_apica_checks b
on (a.guid=b.row_id and a.sourceinstance=b.source_id)
where DATE_FORMAT(CAST(a.timestamp_utc as DATETIME),'%Y-%m-%dT%H:%i:%s') <>b.timestamp_utc and a.cdctype<>'D'
and a.cdctype<>'D';