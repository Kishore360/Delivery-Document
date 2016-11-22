 SELECT CASE WHEN count(1) > 0 THEN 'FaILURE' ELSE 'SUCCESS' END aS Result
,CASE WHEN count(1) > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END aS Message  from 
  wow_mdsdb.u_channels_final  src
 JOIN wow_mdwdb.d_channels_c trgt
on trgt.row_id= src.sys_id and trgt.source_id = src.sourceinstance
where trgt.channel_number<>src.u_channel_number;

