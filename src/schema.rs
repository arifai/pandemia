table! {
    access_tokens (token) {
        token -> Text,
        user_id -> Int8,
        created -> Timestamp,
        valid_thru -> Timestamp,
    }
}

table! {
    user_keys (id) {
        id -> Int8,
        user_id -> Int8,
        pub_key -> Text,
        secret_key -> Text,
        created -> Timestamp,
        active -> Bool,
    }
}

table! {
    user_passhash (user_id) {
        user_id -> Int8,
        passhash -> Varchar,
        deprecated -> Bool,
        ver -> Int4,
        created -> Timestamp,
    }
}

table! {
    users (id) {
        id -> Int8,
        full_name -> Varchar,
        email -> Varchar,
        phone_num -> Varchar,
        active -> Bool,
        register_time -> Timestamp,
    }
}

table! {
    addresses (id) {
        id -> Int8,
        user_id -> Int8,
        kind -> Int4,
        address -> Text,
        regency -> Varchar,
        province -> Varchar,
        country -> Varchar,
        phone_num -> Varchar,
        active -> Bool,
        notes -> Text,
    }
}

table! {
    register_users (token) {
        token -> Varchar,
        full_name -> Varchar,
        email -> Varchar,
        phone_num -> Varchar,
        register_time -> Timestamp,
        code -> Varchar,
    }
}

table! {
    admin_access_tokens (token) {
        token -> Text,
        admin_id -> Int8,
        created -> Timestamp,
        valid_thru -> Timestamp,
    }
}

table! {
    admin_passhash (id) {
        id -> Int8,
        admin_id -> Int8,
        passhash -> Varchar,
        deprecated -> Bool,
        ver -> Int4,
        created -> Timestamp,
    }
}

table! {
    admins (id) {
        id -> Int8,
        name -> Varchar,
        email -> Varchar,
        phone_num -> Varchar,
        labels -> Array<Text>,
        active -> Bool,
        register_time -> Timestamp,
    }
}

table! {
    reset_password_admins (admin_id) {
        admin_id -> Int8,
        token -> Varchar,
        created -> Timestamp,
        expiration -> Nullable<Timestamp>,
    }
}

joinable!(access_tokens -> users (user_id));
joinable!(user_keys -> users (user_id));
joinable!(user_passhash -> users (user_id));
joinable!(addresses -> users (user_id));
joinable!(admin_access_tokens -> admins (admin_id));
joinable!(admin_passhash -> admins (admin_id));
joinable!(reset_password_admins -> admins (admin_id));

allow_tables_to_appear_in_same_query!(
    access_tokens,
    user_keys,
    user_passhash,
    users,
    register_users,
    addresses,
    admin_access_tokens,
    admin_passhash,
    admins,
    reset_password_admins
);

