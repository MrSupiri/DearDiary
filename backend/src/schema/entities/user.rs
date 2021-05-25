use super::product::Product;
use crate::{resolvers::product::get_products_by_user_id, schema::Context};

#[derive(Default, Debug)]
/// User Object
pub struct User {
    pub id: String,
    pub name: String,
    pub email: String,
}

#[derive(GraphQLInputObject)]
/// Create User Input
pub struct UserInput {
    pub name: String,
    pub email: String,
}

#[juniper::graphql_object(Context = Context)]
impl User {
    fn id(&self) -> &str {
        &self.id
    }
    fn name(&self) -> &str {
        &self.name
    }
    fn email(&self) -> &str {
        &self.email
    }

    fn products(&self, _context: &Context) -> Vec<Product> {
        get_products_by_user_id(_context, self.id.clone()).unwrap()
    }
}
