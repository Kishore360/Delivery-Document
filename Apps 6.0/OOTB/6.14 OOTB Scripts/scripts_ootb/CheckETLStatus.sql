select case when jobstatus='COMPLETED' and count(*)=1 then 'SUCCESS' else 'FAILURE' end as RESULT
,case when jobstatus='COMPLETED' and count(*)=1 then 'SUCCESS' else case when count(*)=0 then 'ETL is not run' else 'Latest Main ETL has Failed' end end as RESULT
from jobmm_job
where jobname='Main'
and externalparentjobid = (select externalparentjobid from jobmm_job
where jobname='Main' order by jobendtimestamp desc limit 1)