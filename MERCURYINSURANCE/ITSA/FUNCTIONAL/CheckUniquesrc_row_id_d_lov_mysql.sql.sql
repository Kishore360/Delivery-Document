 select case when count(1) <> 1 then 'FAILURE' else 'SUCCESS' end as Result,case when count(1) <> 1 then 'multiple source_id, src_rowid exists in d_lov' else 'SUCCESS' end as  FROM ( SELECT 1)A
