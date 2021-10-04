select 'request_item_IO_monthLY' as Table_Name,(a.a*1.0/b.b*1.0)*100.0 as failure_probability from 
(select count(1)  a from
(select assignment_group_key,month_start_key,sum(inflow_count),sum(beginning_backlog),sum(outflow_count)outflow,sum(resolved) ,
sum(ending_backlog) ending ,
((sum(beginning_backlog)+sum(inflow_count))-(sum(outflow_count)+sum(resolved))) expected_ending,
(sum(beginning_backlog)+sum(inflow_count)) as validate,
(sum(outflow_count)+sum(resolved)) as validate2,
count(1) FROM mcdonalds_mdwdb.f_n_request_item_io_snapshot_monthly_c
-- where-- month_start_key>='20180101' and month_start_key<='20180101' and 
-- month_start_key<'20180601' and 
-- assignment_group_key>0
group by assignment_group_key,month_start_key)a where expected_ending<>ending) a
 cross join 
(select count(1) b  from (
select assignment_group_key,month_start_key,sum(inflow_count),sum(beginning_backlog),sum(outflow_count)outflow,sum(resolved) ,
sum(ending_backlog) ending ,
((sum(beginning_backlog)+sum(inflow_count))-(sum(outflow_count)+sum(resolved))) expected_ending,
(sum(beginning_backlog)+sum(inflow_count)) as validate,
(sum(outflow_count)+sum(resolved)) as validate2,
count(1) FROM mcdonalds_mdwdb.f_n_request_item_io_snapshot_monthly_c
-- where-- month_start_key>='20180101' and month_start_key<='20180101' and 
-- month_start_key<'20180601' and 
-- assignment_group_key>0
group by assignment_group_key,month_start_key)b1 )as b
union all
select 'request_item_AGM_monthLY' as Table_Name,(a.a*1.0/b.b*1.0)*100.0 as failure_probability from 
(select count(1)  a from (
select assignment_gp_manager_key,a13.grouped_vendor_c_key,month_start_key,sum(inflow_count),sum(beginning_backlog),sum(outflow_count)outflow,sum(resolved) ,
sum(ending_backlog) ending ,
((sum(beginning_backlog)+sum(inflow_count))-(sum(outflow_count)+sum(resolved))) expected_ending,
(sum(beginning_backlog)+sum(inflow_count)) as validate,
(sum(outflow_count)+sum(resolved)) as validate2,
count(1) FROM  mcdonalds_mdwdb.f_n_request_item_agm_io_snapshot_monthly_c
join mcdonalds_mdwdb.d_internal_contact a13 on assignment_gp_manager_key=a13.row_key
-- where   assignment_group_key='11713' and 
-- month_start_key between '20171201' and '20180101'
/*where -- month_start_key>=20180101 and month_start_key<=20180601 and 
month_start_key<'20180601' and 
assignment_gp_manager_key>0*/
group by assignment_gp_manager_key,a13.grouped_vendor_c_key,month_start_key)a where expected_ending<>ending)a
 cross join 
 (select count(1)  b from (
select assignment_gp_manager_key,a13.grouped_vendor_c_key,month_start_key,sum(inflow_count),sum(beginning_backlog),sum(outflow_count)outflow,sum(resolved) ,
sum(ending_backlog) ending ,
((sum(beginning_backlog)+sum(inflow_count))-(sum(outflow_count)+sum(resolved))) expected_ending,
(sum(beginning_backlog)+sum(inflow_count)) as validate,
(sum(outflow_count)+sum(resolved)) as validate2,
count(1) FROM  mcdonalds_mdwdb.f_n_request_item_agm_io_snapshot_monthly_c
join mcdonalds_mdwdb.d_internal_contact a13 on assignment_gp_manager_key=a13.row_key
-- where   assignment_group_key='11713' and 
-- month_start_key between '20171201' and '20180131'
/*where -- month_start_key>=20180101 and month_start_key<=20180601 and 
month_start_key<'20180601' and 
assignment_gp_manager_key>0*/
group by assignment_gp_manager_key,a13.grouped_vendor_c_key,month_start_key)c)b         
union all
select 'request_item_VDR_monthLY' as Table_Name,(a1.cnt*1.0/b.cnt*1.0)*100.0 failure_probability from
(select count(1) cnt  from 
(select   grouped_vendor_name_c, month_start_key,sum(age),
sum(beginning_backlog),sum(inflow_count),sum(outflow_count),sum(resolved ),sum(ending_backlog) ending
,(sum(beginning_backlog)+sum(inflow_count))-(sum(outflow_count)+sum(resolved )) as validate 
-- assignment_group_key,business_service_key,priority_src_key,,age_key,,sum(distinct_inflow_count),sum(distinct_outflow_count)

 -- select distinct sum(beginning_backlog) from mcdonalds_mdwdb.f_n_request_item_vdr_io_snapshot_monthly_c
 from mcdonalds_mdwdb.f_n_request_item_vdr_io_snapshot_monthly_c
 Join mcdonalds_mdwdb.d_internal_contact a12 ON assigned_to_key = a12.row_key 
 /*where  -- month_start_key>=20180101 and month_start_key<=20180601 and 
 month_start_key<'20180601' and 
 grouped_vendor_name_c not in ('UNSPECIFIED')*/
  group by grouped_vendor_name_c, month_start_key order by month_start_key
 )a where ending<>validate)a1
 cross join 
 (select count(1) cnt  from 
(select  grouped_vendor_name_c, month_start_key,sum(age),
sum(beginning_backlog),sum(inflow_count),sum(outflow_count),sum(resolved ),sum(ending_backlog) ending
,(sum(beginning_backlog)+sum(inflow_count))-(sum(outflow_count)+sum(resolved )) as validate 
-- assignment_group_key,business_service_key,priority_src_key,,age_key,,sum(distinct_inflow_count),sum(distinct_outflow_count)

from mcdonalds_mdwdb.f_n_request_item_vdr_io_snapshot_monthly_c
 Join mcdonalds_mdwdb.d_internal_contact a12 ON assigned_to_key = a12.row_key 
 /*where -- month_start_key>=20180101 and month_start_key<=20180601 and 
 month_start_key<'20180601' and 
 grouped_vendor_name_c not in ('UNSPECIFIED')*/
  group by grouped_vendor_name_c, month_start_key order by month_start_key
 )a)b
 union all 
 select 'request_item_IO_WEEKLY' as table_name,(a.a*1.0/b.b*1.0)*100.0 as failure_probability from 
(select count(1)  a from
(select assignment_group_key,week_start_key,sum(inflow_count),sum(beginning_backlog),sum(outflow_count)outflow,sum(resolved) ,
sum(ending_backlog) ending ,
((sum(beginning_backlog)+sum(inflow_count))-(sum(outflow_count)+sum(resolved))) expected_ending,
(sum(beginning_backlog)+sum(inflow_count)) as validate,
(sum(outflow_count)+sum(resolved)) as validate2,
count(1) FROM mcdonalds_mdwdb.f_n_request_item_io_snapshot_weekly_c
-- where-- week_start_key>='20180101' and week_start_key<='20180101' and 
-- week_start_key<'20180601' and 
-- assignment_group_key>0
group by assignment_group_key,week_start_key)a where expected_ending<>ending) a
 cross join 
(select count(1) b  from (
select assignment_group_key,week_start_key,sum(inflow_count),sum(beginning_backlog),sum(outflow_count)outflow,sum(resolved) ,
sum(ending_backlog) ending ,
((sum(beginning_backlog)+sum(inflow_count))-(sum(outflow_count)+sum(resolved))) expected_ending,
(sum(beginning_backlog)+sum(inflow_count)) as validate,
(sum(outflow_count)+sum(resolved)) as validate2,
count(1) FROM mcdonalds_mdwdb.f_n_request_item_io_snapshot_weekly_c
-- where-- week_start_key>='20180101' and week_start_key<='20180101' and 
-- week_start_key<'20180601' and 
-- assignment_group_key>0
group by assignment_group_key,week_start_key)b1 )as b
union all

select 'request_item_AGM_WEEKLY' as table_name,(a.a*1.0/b.b*1.0)*100.0 as failure_probability from 
(select count(1)  a from (
select assignment_gp_manager_key,a13.grouped_vendor_c_key,week_start_key,sum(inflow_count),sum(beginning_backlog),sum(outflow_count)outflow,sum(resolved) ,
sum(ending_backlog) ending ,
((sum(beginning_backlog)+sum(inflow_count))-(sum(outflow_count)+sum(resolved))) expected_ending,
(sum(beginning_backlog)+sum(inflow_count)) as validate,
(sum(outflow_count)+sum(resolved)) as validate2,
count(1) FROM  mcdonalds_mdwdb.f_n_request_item_agm_io_snapshot_weekly_c
join mcdonalds_mdwdb.d_internal_contact a13 on assignment_gp_manager_key=a13.row_key
-- where   assignment_group_key='11713' and 
-- week_start_key between '20171201' and '20180101'
/*where -- week_start_key>=20180101 and week_start_key<=20180601 and 
week_start_key<'20180601' and 
assignment_gp_manager_key>0*/
group by assignment_gp_manager_key,a13.grouped_vendor_c_key,week_start_key)a where expected_ending<>ending)a
 cross join 
 (select count(1)  b from (
select assignment_gp_manager_key,a13.grouped_vendor_c_key,week_start_key,sum(inflow_count),sum(beginning_backlog),sum(outflow_count)outflow,sum(resolved) ,
sum(ending_backlog) ending ,
((sum(beginning_backlog)+sum(inflow_count))-(sum(outflow_count)+sum(resolved))) expected_ending,
(sum(beginning_backlog)+sum(inflow_count)) as validate,
(sum(outflow_count)+sum(resolved)) as validate2,
count(1) FROM  mcdonalds_mdwdb.f_n_request_item_agm_io_snapshot_weekly_c
join mcdonalds_mdwdb.d_internal_contact a13 on assignment_gp_manager_key=a13.row_key
-- where   assignment_group_key='11713' and 
-- week_start_key between '20171201' and '20180131'
/*where -- week_start_key>=20180101 and week_start_key<=20180601 and 
week_start_key<'20180601' and 
assignment_gp_manager_key>0*/
group by assignment_gp_manager_key,a13.grouped_vendor_c_key,week_start_key)c)b
union all
select 'request_item_VDR_weekLY' as Table_Name,(a1.cnt*1.0/b.cnt*1.0)*100.0 failure_probability from
(select count(1) cnt  from 
(select   grouped_vendor_name_c, week_start_key,sum(age),
sum(beginning_backlog),sum(inflow_count),sum(outflow_count),sum(resolved ),sum(ending_backlog) ending
,(sum(beginning_backlog)+sum(inflow_count))-(sum(outflow_count)+sum(resolved )) as validate 
-- assignment_group_key,business_service_key,priority_src_key,,age_key,,sum(distinct_inflow_count),sum(distinct_outflow_count)

 -- select distinct sum(beginning_backlog) from mcdonalds_mdwdb.f_n_request_item_vdr_io_snapshot_weekly_c
 from mcdonalds_mdwdb.f_n_request_item_vdr_io_snapshot_weekly_c
 Join mcdonalds_mdwdb.d_internal_contact a12 ON assigned_to_key = a12.row_key 
 /*where  -- week_start_key>=20180101 and week_start_key<=20180601 and 
 week_start_key<'20180601' and 
 grouped_vendor_name_c not in ('UNSPECIFIED')*/
  group by grouped_vendor_name_c, week_start_key order by week_start_key
 )a where ending<>validate)a1
 cross join 
 (select count(1) cnt  from 
(select  grouped_vendor_name_c, week_start_key,sum(age),
sum(beginning_backlog),sum(inflow_count),sum(outflow_count),sum(resolved ),sum(ending_backlog) ending
,(sum(beginning_backlog)+sum(inflow_count))-(sum(outflow_count)+sum(resolved )) as validate 
-- assignment_group_key,business_service_key,priority_src_key,,age_key,,sum(distinct_inflow_count),sum(distinct_outflow_count)

from mcdonalds_mdwdb.f_n_request_item_vdr_io_snapshot_weekly_c
 Join mcdonalds_mdwdb.d_internal_contact a12 ON assigned_to_key = a12.row_key 
 /*where -- week_start_key>=20180101 and week_start_key<=20180601 and 
 week_start_key<'20180601' and 
 grouped_vendor_name_c not in ('UNSPECIFIED')*/
  group by grouped_vendor_name_c, week_start_key order by week_start_key
 )a)b
 union all
 select 'request_item_BU_MONTHLY' as table_name,(a.a*1.0/b.b*1.0)*100.0 as failure_probability from 
(select count(1)  a from
(select businessunit_custom_c_key,month_start_key,sum(inflow_count),sum(beginning_backlog),sum(outflow_count)outflow,sum(resolved) ,
sum(ending_backlog) ending ,
((sum(beginning_backlog)+sum(inflow_count))-(sum(outflow_count)+sum(resolved))) expected_ending,
(sum(beginning_backlog)+sum(inflow_count)) as validate,
(sum(outflow_count)+sum(resolved)) as validate2,
count(1) FROM mcdonalds_mdwdb.f_n_request_item_hie_io_snapshot_monthly_c
-- where-- month_start_key>='20180101' and month_start_key<='20180101' and 
-- month_start_key<'20180601' and 
-- businessunit_custom_c_key>0
group by businessunit_custom_c_key,month_start_key)a where expected_ending<>ending) a
 cross join 
(select count(1) b  from (
select businessunit_custom_c_key,month_start_key,sum(inflow_count),sum(beginning_backlog),sum(outflow_count)outflow,sum(resolved) ,
sum(ending_backlog) ending ,
((sum(beginning_backlog)+sum(inflow_count))-(sum(outflow_count)+sum(resolved))) expected_ending,
(sum(beginning_backlog)+sum(inflow_count)) as validate,
(sum(outflow_count)+sum(resolved)) as validate2,
count(1) FROM mcdonalds_mdwdb.f_n_request_item_hie_io_snapshot_monthly_c
-- where-- month_start_key>='20180101' and month_start_key<='20180101' and 
-- month_start_key<'20180601' and 
-- businessunit_custom_c_key>0
group by businessunit_custom_c_key,month_start_key)b1 )as b
union all
 select 'request_item_BU_weekLY' as table_name,(a.a*1.0/b.b*1.0)*100.0 as failure_probability from 
(select count(1)  a from
(select businessunit_custom_c_key,week_start_key,sum(inflow_count),sum(beginning_backlog),sum(outflow_count)outflow,sum(resolved) ,
sum(ending_backlog) ending ,
((sum(beginning_backlog)+sum(inflow_count))-(sum(outflow_count)+sum(resolved))) expected_ending,
(sum(beginning_backlog)+sum(inflow_count)) as validate,
(sum(outflow_count)+sum(resolved)) as validate2,
count(1) FROM mcdonalds_mdwdb.f_n_request_item_hie_io_snapshot_weekly_c
-- where-- week_start_key>='20180101' and week_start_key<='20180101' and 
-- week_start_key<'20180601' and 
-- businessunit_custom_c_key>0
group by businessunit_custom_c_key,week_start_key)a where expected_ending<>ending) a
 cross join 
(select count(1) b  from (
select businessunit_custom_c_key,week_start_key,sum(inflow_count),sum(beginning_backlog),sum(outflow_count)outflow,sum(resolved) ,
sum(ending_backlog) ending ,
((sum(beginning_backlog)+sum(inflow_count))-(sum(outflow_count)+sum(resolved))) expected_ending,
(sum(beginning_backlog)+sum(inflow_count)) as validate,
(sum(outflow_count)+sum(resolved)) as validate2,
count(1) FROM mcdonalds_mdwdb.f_n_request_item_hie_io_snapshot_weekly_c
-- where-- week_start_key>='20180101' and week_start_key<='20180101' and 
-- week_start_key<'20180601' and 
-- businessunit_custom_c_key>0
group by businessunit_custom_c_key,week_start_key)b1 )as b