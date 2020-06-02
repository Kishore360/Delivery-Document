drop table if exists #STG_TABLE_SCHEMA.hier_base;

create table if not exists #STG_TABLE_SCHEMA.hier_base (
  log_key int(15) DEFAULT NULL,
  sys_id varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  lev_0_id varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  lev_1_id varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  lev_2_id varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  lev_3_id varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  lev_4_id varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  lev_5_id varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  lev_6_id varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  lev_7_id varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  is_top_flag varchar(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  is_cyclic_flag varchar(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  cyclic_level int(15) DEFAULT 0,
  sourceinstance bigint(20) NOT NULL DEFAULT 0,
  link_type varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  link_created datetime DEFAULT NULL,
  curr_level int(15) DEFAULT 0,
  inserted_on datetime DEFAULT NULL,
  
  PRIMARY KEY (log_key, sourceinstance)
);

-- Lev 0 & 1 -- 
insert into #STG_TABLE_SCHEMA.hier_base
(log_key, sys_id, lev_0_id, lev_1_id, lev_2_id, lev_3_id, lev_4_id, lev_5_id, lev_6_id, is_top_flag, sourceinstance, link_type, link_created, curr_level, inserted_on)

select log_key, CONCAT(tmp.child_id, '~WORK_ITEM'), tmp.child_id, tmp.child_id, tmp.child_id, tmp.child_id, tmp.child_id, tmp.child_id, tmp.parent_id,
'N', tmp.child_sourceinstance, tmp.link_type, link_created, 1 as curr_level, current_timestamp as inserted_on
from #STG_TABLE_SCHEMA.flat_hier_temp tmp
where tmp.invalid_flag = 'N';

-- Lev 2 -- 
update #STG_TABLE_SCHEMA.hier_base bs
join #STG_TABLE_SCHEMA.flat_hier_temp tmp
on tmp.child_id = bs.lev_6_id and tmp.child_sourceinstance = bs.sourceinstance and bs.curr_level = 1
set bs.lev_5_id = bs.lev_6_id, bs.lev_6_id = tmp.parent_id, bs.curr_level = bs.curr_level + 1, bs.inserted_on = current_timestamp
where tmp.invalid_flag = 'N';

-- Lev 3 -- 
update #STG_TABLE_SCHEMA.hier_base bs
join #STG_TABLE_SCHEMA.flat_hier_temp tmp
on tmp.child_id = bs.lev_6_id and tmp.child_sourceinstance = bs.sourceinstance and bs.curr_level = 2
set bs.lev_4_id = bs.lev_5_id, bs.lev_5_id = bs.lev_6_id, bs.lev_6_id = tmp.parent_id, bs.curr_level = bs.curr_level + 1, bs.inserted_on = current_timestamp
where tmp.invalid_flag = 'N';

-- Lev 4 -- 
update #STG_TABLE_SCHEMA.hier_base bs
join #STG_TABLE_SCHEMA.flat_hier_temp tmp
on tmp.child_id = bs.lev_6_id and tmp.child_sourceinstance = bs.sourceinstance and bs.curr_level = 3
set bs.lev_3_id = bs.lev_4_id, bs.lev_4_id = bs.lev_5_id, bs.lev_5_id = bs.lev_6_id, bs.lev_6_id = tmp.parent_id, bs.curr_level = bs.curr_level + 1, bs.inserted_on = current_timestamp
where tmp.invalid_flag = 'N';

-- Lev 5 -- 
update #STG_TABLE_SCHEMA.hier_base bs
join #STG_TABLE_SCHEMA.flat_hier_temp tmp
on tmp.child_id = bs.lev_6_id and tmp.child_sourceinstance = bs.sourceinstance and bs.curr_level = 4
set bs.lev_2_id = bs.lev_3_id, bs.lev_3_id = bs.lev_4_id, bs.lev_4_id = bs.lev_5_id, bs.lev_5_id = bs.lev_6_id, bs.lev_6_id = tmp.parent_id, bs.curr_level = bs.curr_level + 1, bs.inserted_on = current_timestamp
where tmp.invalid_flag = 'N';

-- Lev 6 -- 
update #STG_TABLE_SCHEMA.hier_base bs
join #STG_TABLE_SCHEMA.flat_hier_temp tmp
on tmp.child_id = bs.lev_6_id and tmp.child_sourceinstance = bs.sourceinstance and bs.curr_level = 5
set bs.lev_1_id = bs.lev_2_id, bs.lev_2_id = bs.lev_3_id, bs.lev_3_id = bs.lev_4_id, bs.lev_4_id = bs.lev_5_id, bs.lev_5_id = bs.lev_6_id, bs.lev_6_id = tmp.parent_id, bs.curr_level = bs.curr_level + 1, bs.inserted_on = current_timestamp
where tmp.invalid_flag = 'N';
