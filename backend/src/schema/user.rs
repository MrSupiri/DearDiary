use crate::schema::product::Product;
use crate::schema::Context;

/// User
#[derive(Default, Debug)]
pub struct User {
    pub id: String,
    pub name: String,
    pub email: String,
}

#[derive(GraphQLInputObject)]
#[graphql(description = "User Input")]
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
        vec![
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
        ]
    }
}
