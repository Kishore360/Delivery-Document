

select case when count(*) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(*) > 0 then' dh_all_hierarchies not populated correctly for ''USER GROUP CLASSIFICATION'' ' else 'SUCCESS' end as Message

from #MDS_TABLE_SCHEMA.c_mds_usergrouphierarchy SRC
left join #TABLE_SCHEMA.d_internal_organization IO1
on Level1=IO1.row_id 
left join #TABLE_SCHEMA.d_internal_organization IO2
on Level2=IO2.row_id
left join #TABLE_SCHEMA.d_internal_organization IO3
on Level3=IO3.row_id
left join #TABLE_SCHEMA.d_internal_organization IO4
on Level4=IO4.row_id
where concat(concat(SRC.Level1,'~',1,'~','USER GROUP CLASSIFICATION' ) , SRC.Level1 , coalesce(IO1.row_key,0) ,
SRC.Level2, coalesce(IO2.row_key,0) ,
SRC.Level3, coalesce(IO3.row_key,0) ,
SRC.Level4, coalesce(IO4.row_key,0) )
not in (select concat(row_id,lev_0_id,lev_0_key,lev_1_id,lev_1_key,lev_2_id,lev_2_key,lev_3_id,lev_3_key)
from #TABLE_SCHEMA.dh_all_hierarchies  DH
where hierarchy_class = 'USER GROUP CLASSIFICATION')
