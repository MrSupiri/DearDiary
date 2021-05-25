use super::{
    entities::{
        product::{Product, ProductInput},
        user::{User, UserInput},
    },
    Context,
};
use juniper::FieldResult;

pub struct MutationRoot;

#[juniper::graphql_object(Context = Context)]
impl MutationRoot {
    /// Create new user
    fn create_user(_context: &Context, user: UserInput) -> FieldResult<User> {
        Ok(User {
            id: "1".to_string(),
            name: user.name,
            email: user.email,
        })
    }

    /// Create new product
    fn create_product(_context: &Context, product: ProductInput) -> FieldResult<Product> {
        Ok(Product {
            id: "1".to_string(),
            user_id: product.user_id,
            name: product.name,
            price: product.price,
        })
    }
}
