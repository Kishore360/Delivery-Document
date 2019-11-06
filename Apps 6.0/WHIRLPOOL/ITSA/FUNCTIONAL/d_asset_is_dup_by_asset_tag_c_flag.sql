SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_asset.is_dup_by_asset_tag_c_flag' ELSE 'SUCCESS' END as Message
from
whirlpool_mdwdb.d_asset
left join
(select d_asset.asset_tag from 
whirlpool_mdwdb.f_asset a
join whirlpool_mdwdb.d_asset d_asset
on a.asset_key=d_asset.row_key
-- and d_asset.soft_deleted_flag='N'
and d_asset.asset_tag<>'UNSPECIFIED'
group by d_asset.asset_tag 
having count(1)>1)X
ON X.asset_tag=d_asset.asset_tag
where d_asset.is_dup_by_asset_tag_c_flag<> CASE WHEN X.asset_tag is not null then 'Y' else 'N' end
