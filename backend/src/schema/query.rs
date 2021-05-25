use super::{
    entities::{product::Product, user::User},
    Context,
};
use juniper::FieldResult;

pub struct QueryRoot;

#[juniper::graphql_object(Context = Context)]
impl QueryRoot {
    #[graphql(description = "List of all users")]
    fn users(_context: &Context) -> FieldResult<Vec<User>> {
        Ok(vec![
            User {
                id: "1".to_string(),
                name: "name".to_string(),
                email: "email".to_string(),
            },
            User {
                id: "2".to_string(),
                name: "name2".to_string(),
                email: "email2".to_string(),
            },
        ])
    }

    #[graphql(description = "Get Single user reference by user ID")]
    fn user(_context: &Context, id: String) -> FieldResult<User> {
        Ok(User {
            id: id,
            name: "name".to_string(),
            email: "email".to_string(),
        })
    }

    #[graphql(description = "List of all users")]
    fn products(_context: &Context) -> FieldResult<Vec<Product>> {
        Ok(vec![
            Product {
                id: "1".to_string(),
                user_id: "1".to_string(),
                name: "name".to_string(),
                price: 123.23,
            },
            Product {
                id: "2".to_string(),
                user_id: "1".to_string(),
                name: "name2".to_string(),
                price: 223.23,
            },
        ])
    }

    #[graphql(description = "Get Single user reference by user ID")]
    fn product(_context: &Context, id: String) -> FieldResult<Product> {
        Ok(Product {
            id: id,
            user_id: "1".to_string(),
            name: "name".to_string(),
            price: 123.23,
        })
    }
}
