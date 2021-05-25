use crate::schema::user::User;
use crate::schema::Context;

/// Product
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
        // let mut conn = context.dbpool.get().unwrap();
        // let user: Result<Option<Row>, DBError> = conn.first_exec(
        //     "SELECT * FROM user WHERE id=:id",
        //     params! {"id" => &self.user_id},
        // );
        // if let Err(_err) = user {
        //     None
        // } else {
        //     let (id, name, email) = from_row(user.unwrap().unwrap());
        //     Some(User { id, name, email })
        // }
        Some(User {
            id: "1".to_string(),
            name: "name".to_string(),
            email: "email".to_string(),
        })
    }
}

#[derive(GraphQLInputObject)]
#[graphql(description = "Product Input")]
pub struct ProductInput {
    pub user_id: String,
    pub name: String,
    pub price: f64,
}
