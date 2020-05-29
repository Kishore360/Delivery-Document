 SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'Data mismatch for d_apica_checks.synthetic' ELSE 'SUCCESS' END as Message 
from equifax_mdsdb.apica_checks_c a
join equifax_mdwdb.d_apica_checks b
on (a.guid=b.row_id and a.sourceinstance=b.source_id)
where coalesce(a.synthetic,'UNSPECIFIED')<>b.synthetic
and a.cdctype<>'D';