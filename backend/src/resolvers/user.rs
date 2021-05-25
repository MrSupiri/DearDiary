use crate::schema::{entities::user::User, Context};
use juniper::{FieldError, FieldResult};

fn all_users() -> Vec<User> {
    return vec![
        User {
            id: "1".to_string(),
            name: "Nicholas Fritsch".to_string(),
            email: "Nicholas.Fritsch22@yahoo.com".to_string(),
        },
        User {
            id: "2".to_string(),
            name: "Reva Bayer".to_string(),
            email: "Reva.Bayer@gmail.com".to_string(),
        },
        User {
            id: "3".to_string(),
            name: "Graham Rodriguez".to_string(),
            email: "Graham94@yahoo.com".to_string(),
        },
    ];
}

pub fn get_users(_ctx: &Context) -> FieldResult<Vec<User>> {
    Ok(all_users())
}

pub fn get_user(_ctx: &Context, id: String) -> FieldResult<User> {
    for user in all_users() {
        if user.id == id {
            return Ok(user);
        }
    }

    return Err(FieldError::new(
        "User Not Found",
        graphql_value!({ "not_found": "user not found" }),
    ));
}
