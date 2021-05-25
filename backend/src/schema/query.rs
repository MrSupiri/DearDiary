use super::{
    entities::{product::Product, user::User},
    Context,
};
use crate::resolvers::{
    product::{get_product, get_products},
    user::{get_user, get_users},
};
use juniper::FieldResult;

pub struct QueryRoot;

#[juniper::graphql_object(Context = Context)]
impl QueryRoot {
    /// List of all users
    fn users(ctx: &Context) -> FieldResult<Vec<User>> {
        get_users(ctx)
    }

    /// Get Single user reference by user ID
    fn user(ctx: &Context, id: String) -> FieldResult<User> {
        get_user(ctx, id)
    }

    /// List of all users
    fn products(ctx: &Context) -> FieldResult<Vec<Product>> {
        get_products(ctx)
    }

    /// Get Single user reference by user ID
    fn product(ctx: &Context, id: String) -> FieldResult<Product> {
        get_product(ctx, id)
    }
}
