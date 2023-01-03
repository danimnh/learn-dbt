{{ config(
    indexes = [{'columns':['_airbyte_emitted_at'],'type':'btree'}],
    unique_key = '_airbyte_ab_id',
    schema = "_airbyte_dbo",
    tags = [ "top-level-intermediate" ]
) }}
-- SQL model to cast each column to its adequate SQL type converted from the JSON schema type
-- depends_on: {{ ref('users_7_ab1') }}
select
    cast({{ adapter.quote('id') }} as {{ dbt_utils.type_bigint() }}) as {{ adapter.quote('id') }},
    cast(ip as {{ dbt_utils.type_string() }}) as ip,
    cast(bod as {{ dbt_utils.type_string() }}) as bod,
    cast(sid as {{ dbt_utils.type_float() }}) as sid,
    cast(city as {{ dbt_utils.type_string() }}) as city,
    cast(meta as {{ dbt_utils.type_string() }}) as meta,
    cast({{ adapter.quote('name') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('name') }},
    cast(uuid as {{ dbt_utils.type_bigint() }}) as uuid,
    cast(email as {{ dbt_utils.type_string() }}) as email,
    cast(gender as {{ dbt_utils.type_string() }}) as gender,
    cast(mobile as {{ dbt_utils.type_string() }}) as mobile,
    cast(status as {{ dbt_utils.type_bigint() }}) as status,
    cast(os_name as {{ dbt_utils.type_string() }}) as os_name,
    cast(country as {{ dbt_utils.type_string() }}) as country,
    cast(fav_dic as {{ dbt_utils.type_string() }}) as fav_dic,
    cast(is_kids as {{ dbt_utils.type_bigint() }}) as is_kids,
    cast(hawaui_id as {{ dbt_utils.type_string() }}) as hawaui_id,
    cast(join_date as {{ dbt_utils.type_string() }}) as join_date,
    cast(deleted_at as {{ dbt_utils.type_string() }}) as deleted_at,
    cast(is_deleted as {{ dbt_utils.type_bigint() }}) as is_deleted,
    cast(last_login as {{ dbt_utils.type_bigint() }}) as last_login,
    cast(parent_code as {{ dbt_utils.type_string() }}) as parent_code,
    cast(parent_date as {{ dbt_utils.type_string() }}) as parent_date,
    cast(session_key as {{ dbt_utils.type_bigint() }}) as session_key,
    cast(character_id as {{ dbt_utils.type_bigint() }}) as character_id,
    cast(readable_sid as {{ dbt_utils.type_string() }}) as readable_sid,
    cast(forbidden_dic as {{ dbt_utils.type_string() }}) as forbidden_dic,
    cast(last_login_ip as {{ dbt_utils.type_string() }}) as last_login_ip,
    cast(music_fav_dic as {{ dbt_utils.type_string() }}) as music_fav_dic,
    cast(profile_email as {{ dbt_utils.type_string() }}) as profile_email,
    cast(approve_policy as {{ dbt_utils.type_bigint() }}) as approve_policy,
    cast(parent_channel as {{ dbt_utils.type_string() }}) as parent_channel,
    cast(last_login_city as {{ dbt_utils.type_bigint() }}) as last_login_city,
    cast(extra_last_update as {{ dbt_utils.type_bigint() }}) as extra_last_update,
    cast(follow_topics_dic as {{ dbt_utils.type_string() }}) as follow_topics_dic,
    cast(planets_order_dic as {{ dbt_utils.type_string() }}) as planets_order_dic,
    cast(recent_series_dic as {{ dbt_utils.type_string() }}) as recent_series_dic,
    cast(last_login_country as {{ dbt_utils.type_bigint() }}) as last_login_country,
    cast(music_playlist_dic as {{ dbt_utils.type_string() }}) as music_playlist_dic,
    cast(recent_episode_dic as {{ dbt_utils.type_string() }}) as recent_episode_dic,
    cast(session_last_update as {{ dbt_utils.type_bigint() }}) as session_last_update,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at
from {{ ref('users_7_ab1') }}
-- users_7
where 1 = 1
{{ incremental_clause('_airbyte_emitted_at', this) }}

