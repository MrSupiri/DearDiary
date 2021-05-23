use juniper::{EmptySubscription, FieldResult, RootNode};

use super::product::{Product, ProductInput};
use super::user::{User, UserInput};

pub struct Context {
}

impl juniper::Context for Context {}

pub struct QueryRoot;

#[juniper::graphql_object(Context = Context)]
impl QueryRoot {
    #[graphql(description = "List of all users")]
    fn users(_context: &Context) -> FieldResult<Vec<User>> {
        Ok(vec![User { id: "1".to_string(), name: "name".to_string(), email: "email".to_string() }, User { id: "2".to_string(), name: "name2".to_string(), email: "email2".to_string() }])
    }

    #[graphql(description = "Get Single user reference by user ID")]
    fn user(_context: &Context, id: String) -> FieldResult<User> {
        Ok(User { id: id, name: "name".to_string(), email: "email".to_string() })
    }

    #[graphql(description = "List of all users")]
    fn products(_context: &Context) -> FieldResult<Vec<Product>> {
        Ok(vec![Product{id: "1".to_string(), user_id: "1".to_string(), name: "name".to_string(), price: 123.23}, Product{id: "2".to_string(), user_id: "1".to_string(), name: "name2".to_string(), price : 223.23}])
    }

    #[graphql(description = "Get Single user reference by user ID")]
    fn product(_context: &Context, id: String) -> FieldResult<Product> {
        Ok(Product{id: id, user_id: "1".to_string(), name: "name".to_string(), price: 123.23})
    }
}

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
        Ok(User { id: "1".to_string(), name: user.name, email: user.email })
    }

    fn create_product(_context: &Context, product: ProductInput) -> FieldResult<Product> {
        Ok(Product{id: "1".to_string(), user_id: product.user_id, name: product.name, price: product.price})
    }
}

pub type Schema = RootNode<'static, QueryRoot, MutationRoot, EmptySubscription<Context>>;

pub fn create_schema() -> Schema {
    Schema::new(QueryRoot, MutationRoot, EmptySubscription::new())
}
