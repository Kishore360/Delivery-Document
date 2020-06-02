 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_request.authorized_flag' ELSE 'SUCCESS' END as Message
-- select SRC.sys_id,TRGT.row_id ,SRC.sourceinstance,TRGT.source_id , SRC.auth_flag,TRGT.authorized_flag
 from (SELECT a.sys_id,a.sourceinstance,
case when SR.documentkey is not null   then 'Y' else 'N' end as auth_flag
 FROM #MDS_TABLE_SCHEMA.change_request_final a
left join
(select distinct documentkey as documentkey from 
(select distinct documentkey,oldvalue,newvalue from #MDS_TABLE_SCHEMA.sys_audit_final where tablename='change_request' and fieldname='state') b
left join (select * from #DWH_TABLE_SCHEMA.d_lov where dimension_class like 'STATE~CHANGE_REQUEST'and dimension_name='Authorize') c
ON b.oldvalue = c.dimension_code
left join (select * from #DWH_TABLE_SCHEMA.d_lov where dimension_class like 'STATE~CHANGE_REQUEST'and dimension_name='Authorize') c1
ON b.newvalue= c1.dimension_code
where (b.oldvalue = c.dimension_code or b.newvalue= c1.dimension_code)
)SR
on a.sys_id=SR.documentkey
where a.cdctype<>'D'
)SRC
left join #DWH_TABLE_SCHEMA.d_change_request TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 where coalesce(SRC.auth_flag,'')<>coalesce(TRGT.authorized_flag,'')
