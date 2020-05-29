-- mapping it to null as part of JIRA ITSM-3461


select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'OPERATIONAL_STATUS validation failed for d_application' ELSE 'SUCCESS' END as Message
from #DWH_TABLE_SCHEMA.d_application TGT
where TGT.OPERATIONAL_STATUS is not NULL and row_key not in (0,-1);
