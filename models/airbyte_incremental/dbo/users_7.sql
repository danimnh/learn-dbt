{{ config(
    indexes = [{'columns':['_airbyte_emitted_at'],'type':'btree'}],
    unique_key = '_airbyte_ab_id',
    schema = "dbo",
    tags = [ "top-level" ]
) }}
-- Final base SQL model
-- depends_on: {{ ref('users_7_ab3') }}
select
    {{ adapter.quote('id') }},
    ip,
    bod,
    sid,
    city,
    meta,
    {{ adapter.quote('name') }},
    uuid,
    email,
    gender,
    mobile,
    status,
    os_name,
    country,
    fav_dic,
    is_kids,
    hawaui_id,
    join_date,
    deleted_at,
    is_deleted,
    last_login,
    parent_code,
    parent_date,
    session_key,
    character_id,
    readable_sid,
    forbidden_dic,
    last_login_ip,
    music_fav_dic,
    profile_email,
    approve_policy,
    parent_channel,
    last_login_city,
    extra_last_update,
    follow_topics_dic,
    planets_order_dic,
    recent_series_dic,
    last_login_country,
    music_playlist_dic,
    recent_episode_dic,
    session_last_update,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at,
    _airbyte_users_7_hashid
from {{ ref('users_7_ab3') }}
-- users_7 from {{ source('dbo', '_airbyte_raw_users_7') }}
where 1 = 1
{{ incremental_clause('_airbyte_emitted_at', this) }}

