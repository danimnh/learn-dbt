{{ config(
    indexes = [{'columns':['_airbyte_emitted_at'],'type':'btree'}],
    unique_key = '_airbyte_ab_id',
    schema = "_airbyte_dbo",
    tags = [ "top-level-intermediate" ]
) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
-- depends_on: {{ source('dbo', '_airbyte_raw_users_7') }}
select
    {{ json_extract_scalar('_airbyte_data', ['id'], ['id']) }} as {{ adapter.quote('id') }},
    {{ json_extract_scalar('_airbyte_data', ['ip'], ['ip']) }} as ip,
    {{ json_extract_scalar('_airbyte_data', ['bod'], ['bod']) }} as bod,
    {{ json_extract_scalar('_airbyte_data', ['sid'], ['sid']) }} as sid,
    {{ json_extract_scalar('_airbyte_data', ['city'], ['city']) }} as city,
    {{ json_extract_scalar('_airbyte_data', ['meta'], ['meta']) }} as meta,
    {{ json_extract_scalar('_airbyte_data', ['name'], ['name']) }} as {{ adapter.quote('name') }},
    {{ json_extract_scalar('_airbyte_data', ['uuid'], ['uuid']) }} as uuid,
    {{ json_extract_scalar('_airbyte_data', ['email'], ['email']) }} as email,
    {{ json_extract_scalar('_airbyte_data', ['gender'], ['gender']) }} as gender,
    {{ json_extract_scalar('_airbyte_data', ['mobile'], ['mobile']) }} as mobile,
    {{ json_extract_scalar('_airbyte_data', ['status'], ['status']) }} as status,
    {{ json_extract_scalar('_airbyte_data', ['OS_name'], ['OS_name']) }} as os_name,
    {{ json_extract_scalar('_airbyte_data', ['country'], ['country']) }} as country,
    {{ json_extract_scalar('_airbyte_data', ['fav_dic'], ['fav_dic']) }} as fav_dic,
    {{ json_extract_scalar('_airbyte_data', ['is_kids'], ['is_kids']) }} as is_kids,
    {{ json_extract_scalar('_airbyte_data', ['hawaui_id'], ['hawaui_id']) }} as hawaui_id,
    {{ json_extract_scalar('_airbyte_data', ['join_date'], ['join_date']) }} as join_date,
    {{ json_extract_scalar('_airbyte_data', ['deleted_at'], ['deleted_at']) }} as deleted_at,
    {{ json_extract_scalar('_airbyte_data', ['is_deleted'], ['is_deleted']) }} as is_deleted,
    {{ json_extract_scalar('_airbyte_data', ['last_login'], ['last_login']) }} as last_login,
    {{ json_extract_scalar('_airbyte_data', ['parent_code'], ['parent_code']) }} as parent_code,
    {{ json_extract_scalar('_airbyte_data', ['parent_date'], ['parent_date']) }} as parent_date,
    {{ json_extract_scalar('_airbyte_data', ['session_key'], ['session_key']) }} as session_key,
    {{ json_extract_scalar('_airbyte_data', ['character_id'], ['character_id']) }} as character_id,
    {{ json_extract_scalar('_airbyte_data', ['readable_sid'], ['readable_sid']) }} as readable_sid,
    {{ json_extract_scalar('_airbyte_data', ['forbidden_dic'], ['forbidden_dic']) }} as forbidden_dic,
    {{ json_extract_scalar('_airbyte_data', ['last_login_ip'], ['last_login_ip']) }} as last_login_ip,
    {{ json_extract_scalar('_airbyte_data', ['music_fav_dic'], ['music_fav_dic']) }} as music_fav_dic,
    {{ json_extract_scalar('_airbyte_data', ['profile_email'], ['profile_email']) }} as profile_email,
    {{ json_extract_scalar('_airbyte_data', ['approve_policy'], ['approve_policy']) }} as approve_policy,
    {{ json_extract_scalar('_airbyte_data', ['parent_channel'], ['parent_channel']) }} as parent_channel,
    {{ json_extract_scalar('_airbyte_data', ['last_login_city'], ['last_login_city']) }} as last_login_city,
    {{ json_extract_scalar('_airbyte_data', ['extra_last_update'], ['extra_last_update']) }} as extra_last_update,
    {{ json_extract_scalar('_airbyte_data', ['follow_topics_dic'], ['follow_topics_dic']) }} as follow_topics_dic,
    {{ json_extract_scalar('_airbyte_data', ['planets_order_dic'], ['planets_order_dic']) }} as planets_order_dic,
    {{ json_extract_scalar('_airbyte_data', ['recent_series_dic'], ['recent_series_dic']) }} as recent_series_dic,
    {{ json_extract_scalar('_airbyte_data', ['last_login_country'], ['last_login_country']) }} as last_login_country,
    {{ json_extract_scalar('_airbyte_data', ['music_playlist_dic'], ['music_playlist_dic']) }} as music_playlist_dic,
    {{ json_extract_scalar('_airbyte_data', ['recent_episode_dic'], ['recent_episode_dic']) }} as recent_episode_dic,
    {{ json_extract_scalar('_airbyte_data', ['session_last_update'], ['session_last_update']) }} as session_last_update,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at
from {{ source('dbo', '_airbyte_raw_users_7') }} as table_alias
-- users_7
where 1 = 1
{{ incremental_clause('_airbyte_emitted_at', this) }}

