drop table if exists #STG_TABLE_SCHEMA.hier_base;

create table if not exists #STG_TABLE_SCHEMA.hier_base (
  base_id varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL, 
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
  from_cyclic_level int(15) DEFAULT 99,
  sourceinstance bigint(20) NOT NULL DEFAULT 0,
  link_type varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  link_created datetime DEFAULT NULL,
  curr_level int(15) DEFAULT 0,
  inserted_on datetime DEFAULT NULL
  ,  PRIMARY KEY (base_id, sourceinstance)
);

alter table #STG_TABLE_SCHEMA.hier_base
add index lev_5_idx (lev_5_id, sourceinstance),
add index lev_4_idx (lev_4_id, sourceinstance),
add index lev_3_idx (lev_3_id, sourceinstance),
add index lev_2_idx (lev_2_id, sourceinstance),
add index lev_1_idx (lev_1_id, sourceinstance),
add index sys_idx (sys_id, sourceinstance),
add index cyclic_lev_idx (cyclic_level, sourceinstance);

-- Lev 0 & 1 -- 
insert into #STG_TABLE_SCHEMA.hier_base
(base_id, log_key, sys_id, lev_0_id, lev_1_id, lev_2_id, lev_3_id, lev_4_id, lev_5_id, is_top_flag, sourceinstance, link_type, link_created, curr_level, inserted_on)

select tmp.sys_id, tmp.log_key, CONCAT(tmp.child_id, '~WORK_ITEM'), tmp.child_id, tmp.child_id, tmp.child_id, tmp.child_id, tmp.child_id, tmp.parent_id,
'N', tmp.sourceinstance, tmp.link_type, link_created, 1 as curr_level, current_timestamp as inserted_on
from #STG_TABLE_SCHEMA.issue_changelog_link_temp tmp
where tmp.invalid_flag = 'N';


drop table if exists #STG_TABLE_SCHEMA.hier_data_temp;

create table if not exists #STG_TABLE_SCHEMA.hier_data_temp (
  base_id varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL, 
  log_key int(15) DEFAULT NULL,
  sys_id varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  driver_id varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  lev_0_id varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  lev_1_id varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  lev_2_id varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  lev_3_id varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  lev_4_id varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  lev_5_id varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  lev_6_id varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  lev_7_id varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  is_cyclic_flag varchar(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  sourceinstance bigint(20) NOT NULL DEFAULT 0,
  inserted_on datetime DEFAULT NULL
  
  , PRIMARY KEY (driver_id, sourceinstance)
  , index parent_prec_idx (sys_id, sourceinstance)
);

insert into #STG_TABLE_SCHEMA.hier_data_temp
(base_id, log_key, sys_id, driver_id, lev_0_id, lev_1_id, lev_2_id, lev_3_id, lev_4_id, lev_5_id, sourceinstance, inserted_on)

select distinct tmp_lev1.sys_id, tmp_lev1.log_key, CONCAT(tmp_lev1.child_id, '~WORK_ITEM') as sys_id,
concat(tmp_lev1.child_id, coalesce(tmp_lev1.parent_id, ''), coalesce(tmp_lev2.parent_id, ''), coalesce(tmp_lev3.parent_id, ''), coalesce(tmp_lev4.parent_id, ''), coalesce(tmp_lev5.parent_id, '')) as driver_id, tmp_lev1.child_id lev_0_id, tmp_lev1.parent_id lev_1_id, tmp_lev2.parent_id lev_2_id, tmp_lev3.parent_id lev_3_id, 
tmp_lev4.parent_id lev_4_id, tmp_lev5.parent_id lev_5_id, 
tmp_lev1.sourceinstance, current_timestamp as inserted_on
from #STG_TABLE_SCHEMA.issue_changelog_link_temp tmp_lev1
left join #STG_TABLE_SCHEMA.issue_changelog_link_temp tmp_lev2
on tmp_lev1.parent_id = tmp_lev2.child_id and tmp_lev1.invalid_flag = 'N' and tmp_lev2.invalid_flag = 'N'
left join #STG_TABLE_SCHEMA.issue_changelog_link_temp tmp_lev3
on tmp_lev2.parent_id = tmp_lev3.child_id and tmp_lev3.invalid_flag = 'N'
left join #STG_TABLE_SCHEMA.issue_changelog_link_temp tmp_lev4
on tmp_lev3.parent_id = tmp_lev4.child_id and tmp_lev4.invalid_flag = 'N'
left join #STG_TABLE_SCHEMA.issue_changelog_link_temp tmp_lev5
on tmp_lev4.parent_id = tmp_lev5.child_id and tmp_lev5.invalid_flag = 'N'
where tmp_lev1.invalid_flag = 'N' 
order by tmp_lev1.log_key;

-- base lev 0 --

update #STG_TABLE_SCHEMA.hier_base base
join (
select base.base_id, base.sys_id, base.sourceinstance,
case 
when base.lev_0_id = base.lev_2_id then 2
when base.lev_0_id = base.lev_3_id then 3
when base.lev_0_id = base.lev_4_id then 4
when base.lev_0_id = base.lev_5_id then 5 end as cycle_level
from #STG_TABLE_SCHEMA.hier_data_temp base
) SQ
on base.base_id = SQ.base_id and base.sourceinstance = SQ.sourceinstance
set base.is_cyclic_flag = case when SQ.cycle_level > 0 then 'Y' else 'N' end, base.cyclic_level = SQ.cycle_level, base.from_cyclic_level = 0;

-- base lev 1 --

update #STG_TABLE_SCHEMA.hier_base base
join (
select base.base_id, base.sys_id, base.sourceinstance,
case 
when base.lev_1_id = base.lev_3_id then 3
when base.lev_1_id = base.lev_4_id then 4
when base.lev_1_id = base.lev_5_id then 5 end as cycle_level
from #STG_TABLE_SCHEMA.hier_data_temp base
) SQ
on base.base_id = SQ.base_id and base.sourceinstance = SQ.sourceinstance
set base.is_cyclic_flag = case when base.is_cyclic_flag = 'Y' then 'Y' when SQ.cycle_level > 0 then 'Y' else 'N' end, 
base.cyclic_level = case when base.cyclic_level is null then SQ.cycle_level when SQ.cycle_level < base.cyclic_level then SQ.cycle_level else base.cyclic_level end, base.from_cyclic_level = 1;

-- base lev 2 --

update #STG_TABLE_SCHEMA.hier_base base
join (
select base.base_id, base.sys_id, base.sourceinstance,
case 
when base.lev_2_id = base.lev_4_id then 4
when base.lev_2_id = base.lev_5_id then 5 end as cycle_level
from #STG_TABLE_SCHEMA.hier_data_temp base
) SQ
on base.base_id = SQ.base_id and base.sourceinstance = SQ.sourceinstance
set base.is_cyclic_flag = case when base.is_cyclic_flag = 'Y' then 'Y' when SQ.cycle_level > 0 then 'Y' else 'N' end, 
base.cyclic_level = case when base.cyclic_level is null then SQ.cycle_level when SQ.cycle_level < base.cyclic_level then SQ.cycle_level else base.cyclic_level end, base.from_cyclic_level = 2;

-- base lev 3 --

update #STG_TABLE_SCHEMA.hier_base base
join (
select base.base_id, base.sys_id, base.sourceinstance,
case 
when base.lev_3_id = base.lev_5_id then 5 end as cycle_level
from #STG_TABLE_SCHEMA.hier_data_temp base
) SQ
on base.base_id = SQ.base_id and base.sourceinstance = SQ.sourceinstance
set base.is_cyclic_flag = case when base.is_cyclic_flag = 'Y' then 'Y' when SQ.cycle_level > 0 then 'Y' else 'N' end, 
base.cyclic_level = case when base.cyclic_level is null then SQ.cycle_level when SQ.cycle_level < base.cyclic_level then SQ.cycle_level else base.cyclic_level end, base.from_cyclic_level = 3;

-- Lev 2 -- 
update #STG_TABLE_SCHEMA.hier_base bs
join #STG_TABLE_SCHEMA.issue_changelog_link_temp tmp
on tmp.child_id = bs.lev_5_id and tmp.sourceinstance = bs.sourceinstance and bs.curr_level = 1
set bs.lev_4_id = bs.lev_5_id, bs.lev_5_id = tmp.parent_id, bs.curr_level = bs.curr_level + 1, bs.inserted_on = current_timestamp
where tmp.invalid_flag = 'N';

-- Lev 3 -- 
update #STG_TABLE_SCHEMA.hier_base bs
join #STG_TABLE_SCHEMA.issue_changelog_link_temp tmp
on tmp.child_id = bs.lev_5_id and tmp.sourceinstance = bs.sourceinstance and bs.curr_level = 2
set bs.lev_3_id = bs.lev_4_id, bs.lev_4_id = bs.lev_5_id, bs.lev_5_id = tmp.parent_id, bs.curr_level = bs.curr_level + 1, bs.inserted_on = current_timestamp
where tmp.invalid_flag = 'N';

-- Lev 4 -- 
update #STG_TABLE_SCHEMA.hier_base bs
join #STG_TABLE_SCHEMA.issue_changelog_link_temp tmp
on tmp.child_id = bs.lev_5_id and tmp.sourceinstance = bs.sourceinstance and bs.curr_level = 3
set bs.lev_2_id = bs.lev_3_id, bs.lev_3_id = bs.lev_4_id, bs.lev_4_id = bs.lev_5_id, bs.lev_5_id = tmp.parent_id, bs.curr_level = bs.curr_level + 1, bs.inserted_on = current_timestamp
where tmp.invalid_flag = 'N';

-- Lev 5 -- 
update #STG_TABLE_SCHEMA.hier_base bs
join #STG_TABLE_SCHEMA.issue_changelog_link_temp tmp
on tmp.child_id = bs.lev_5_id and tmp.sourceinstance = bs.sourceinstance and bs.curr_level = 4
set bs.lev_1_id = bs.lev_2_id, bs.lev_2_id = bs.lev_3_id, bs.lev_3_id = bs.lev_4_id, bs.lev_4_id = bs.lev_5_id, bs.lev_5_id = tmp.parent_id, bs.curr_level = bs.curr_level + 1, bs.inserted_on = current_timestamp
where tmp.invalid_flag = 'N';


-- Cyclic --
-- Lev 2 -- 
update #STG_TABLE_SCHEMA.hier_base bs
set bs.lev_5_id = bs.lev_0_id, bs.lev_4_id = bs.lev_0_id, bs.lev_3_id = bs.lev_0_id, bs.lev_2_id = bs.lev_0_id, bs.lev_1_id = bs.lev_0_id, bs.inserted_on = current_timestamp
where bs.is_cyclic_flag = 'Y' and bs.cyclic_level = 1;

-- Lev 3 -- 
update #STG_TABLE_SCHEMA.hier_base bs
set bs.lev_5_id = bs.lev_1_id, bs.lev_4_id = bs.lev_0_id, bs.lev_3_id = bs.lev_0_id, bs.lev_2_id = bs.lev_0_id, bs.lev_1_id = bs.lev_0_id, bs.inserted_on = current_timestamp
where bs.is_cyclic_flag = 'Y' and bs.cyclic_level = 2;

-- Lev 4 -- 
update #STG_TABLE_SCHEMA.hier_base bs
set bs.lev_5_id = bs.lev_2_id, bs.lev_4_id = bs.lev_1_id, bs.lev_3_id = bs.lev_0_id, bs.lev_2_id = bs.lev_0_id, bs.lev_1_id = bs.lev_0_id, bs.inserted_on = current_timestamp
where bs.is_cyclic_flag = 'Y' and bs.cyclic_level = 3;

-- Lev 5 -- 
update #STG_TABLE_SCHEMA.hier_base bs
set bs.lev_5_id = bs.lev_3_id, bs.lev_4_id = bs.lev_2_id, bs.lev_3_id = bs.lev_1_id, bs.lev_2_id = bs.lev_0_id, bs.lev_1_id = bs.lev_0_id, bs.inserted_on = current_timestamp
where bs.is_cyclic_flag = 'Y' and bs.cyclic_level = 4;

-- Lev 6 -- 
update #STG_TABLE_SCHEMA.hier_base bs
set bs.lev_5_id = bs.lev_4_id, bs.lev_4_id = bs.lev_3_id, bs.lev_3_id = bs.lev_2_id, bs.lev_2_id = bs.lev_1_id, bs.lev_1_id = bs.lev_0_id, bs.inserted_on = current_timestamp
where bs.is_cyclic_flag = 'Y' and bs.cyclic_level = 5;

-- breaking hierarchy if cyclic is forming same precedence hierarchy or lower precedence hierarchy --

update #STG_TABLE_SCHEMA.hier_base hier
join (
select distinct hier.log_key, hier.sys_id, hier.lev_4_id, CAST(lev_4_parent_prec.parent_precedence AS UNSIGNED) lev_4_parent_precedence, hier.lev_5_id, CAST(lev_5_parent_prec.parent_precedence AS UNSIGNED) lev_5_parent_precedence, 
case when hier.cyclic_level = 2 then base.lev_2_id 
     when hier.cyclic_level = 3 then base.lev_3_id
     when hier.cyclic_level = 4 then base.lev_4_id
     when hier.cyclic_level = 5 then base.lev_5_id end as cyclic_lev_id, 
	 CAST(cyclic_lev_parent_prec.parent_precedence AS UNSIGNED) cyclic_lev_parent_precedence
from #STG_TABLE_SCHEMA.hier_base hier
join #STG_TABLE_SCHEMA.issue_changelog_link_temp lev_5_parent_prec
on lev_5_parent_prec.parent_id = hier.lev_5_id and lev_5_parent_prec.sourceinstance = hier.sourceinstance
join #STG_TABLE_SCHEMA.issue_changelog_link_temp lev_4_parent_prec
on lev_4_parent_prec.parent_id = hier.lev_4_id and lev_4_parent_prec.sourceinstance = hier.sourceinstance
join #STG_TABLE_SCHEMA.hier_data_temp base
on hier.sys_id = base.sys_id and hier.sourceinstance = base.sourceinstance
join #STG_TABLE_SCHEMA.issue_changelog_link_temp cyclic_lev_parent_prec
on cyclic_lev_parent_prec.parent_id = 
case when hier.cyclic_level = 2 then base.lev_2_id 
     when hier.cyclic_level = 3 then base.lev_3_id
     when hier.cyclic_level = 4 then base.lev_4_id
     when hier.cyclic_level = 5 then base.lev_5_id end
 and cyclic_lev_parent_prec.sourceinstance = hier.sourceinstance
where hier.is_cyclic_flag = 'Y'
) SQ
on SQ.log_key = hier.log_key and SQ.sys_id = hier.sys_id
set hier.lev_5_id = hier.lev_4_id, hier.lev_4_id = hier.lev_3_id, hier.lev_3_id = hier.lev_2_id, hier.lev_2_id = hier.lev_1_id, hier.lev_1_id = hier.lev_0_id
where (SQ.lev_4_parent_precedence = SQ.lev_5_parent_precedence = SQ.cyclic_lev_parent_precedence) 
or ((SQ.lev_4_parent_precedence <= SQ.lev_5_parent_precedence) and (SQ.lev_5_parent_precedence >= SQ.cyclic_lev_parent_precedence));

-- use #STG_TABLE_SCHEMA;

-- delete hier 
-- from #STG_TABLE_SCHEMA.hier_base hier
-- where cyclic_level = 2 and from_cyclic_level = 0 and is_cyclic_flag = 'Y';