SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.reassignment_count_numerify' ELSE 'SUCCESS' END as Message

-- select SRC.sys_id,TRGT.reassignment_count_numerify,SYS.reass_count
from  ( SELECT * FROM #MDS_TABLE_SCHEMA.incident_final WHERE CDCTYPE<>'D') SRC

left join (

select a.documentkey,a.sourceinstance,count(1)  as reass_count
from
(
select documentkey, sys_created_on,sourceinstance,fieldname,oldvalue,newvalue from ( SELECT * FROM #MDS_TABLE_SCHEMA.sys_audit_final WHERE CDCTYPE<>'D')
where tablename='incident' and fieldname='assignment_group' 
) a
left outer join
(
select documentkey, max(sys_created_on) as sys_created_on from ( SELECT * FROM #MDS_TABLE_SCHEMA.sys_audit_final WHERE CDCTYPE<>'D')
where tablename='incident' 
and newvalue in (select dimension_code from cisco_hf1_workdb.d_lov_map where dimension_class like 'STATE~INCIDENT'
AND dimension_wh_code IN ('RESOLVED'))
group by documentkey 
) b
on a.documentkey=b.documentkey where a.sys_created_on < coalesce(b.sys_created_on,'9999-01-01')
and (oldvalue is not null and newvalue is not null )
group by documentkey,sourceinstance

) SYS

on SRC.sys_id=SYS.documentkey
and SRC.sourceinstance=SYS.sourceinstance

left join #DWH_TABLE_SCHEMA.d_incident TRGT
on SRC.sys_id=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
where coalesce(TRGT.reassignment_count_numerify,'')<>coalesce(SYS.reass_count,'0');

