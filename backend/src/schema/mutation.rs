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
    fn create_user(_context: &Context, user: UserInput) -> FieldResult<User> {
        // match insert {
        //     Ok(_opt_row) => Ok(User {
        //         id: new_id,
        //         name: user.name,
        //         email: user.email,
        //     }),
        //     Err(err) => {
        //         let msg = match err {
        //             DBError::MySqlError(err) => err.message,
        //             _ => "internal error".to_owned(),
        //         };
        //         Err(FieldError::new(
        //             "Failed to create new user",
        //             graphql_value!({ "internal_error": msg }),
        //         ))
        //     }
        // }
        Ok(User {
            id: "1".to_string(),
            name: user.name,
            email: user.email,
        })
    }

    fn create_product(_context: &Context, product: ProductInput) -> FieldResult<Product> {
        Ok(Product {
            id: "1".to_string(),
            user_id: product.user_id,
            name: product.name,
            price: product.price,
        })
    }
}
