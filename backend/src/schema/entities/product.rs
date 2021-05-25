// use juniper::FieldResult;
use super::user::User;
use crate::{resolvers::user::get_user, schema::Context};

// Product
#[derive(Default, Debug)]
pub struct Product {
    pub id: String,
    pub user_id: String,
    pub name: String,
    pub price: f64,
}

#[juniper::graphql_object(Context = Context)]
impl Product {
    fn id(&self) -> &str {
        &self.id
    }
    fn user_id(&self) -> &str {
        &self.user_id
    }
    fn name(&self) -> &str {
        &self.name
    }
    fn price(&self) -> f64 {
        self.price
    }

    fn user(&self, _context: &Context) -> Option<User> {
        match get_user(_context, self.user_id.clone()) {
            Ok(user) => Some(user),
            Err(_) => None,
        }
    }
}

#[derive(GraphQLInputObject)]
#[graphql(description = "Product Input")]
pub struct ProductInput {
    pub user_id: String,
    pub name: String,
    pub price: f64,
}
