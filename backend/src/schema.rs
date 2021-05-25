pub mod entities;
mod mutation;
mod query;

use self::{mutation::MutationRoot, query::QueryRoot};
use juniper::{EmptySubscription, RootNode};

pub struct Context {}

impl juniper::Context for Context {}

pub type Schema = RootNode<'static, QueryRoot, MutationRoot, EmptySubscription<Context>>;

pub fn create_schema() -> Schema {
    Schema::new(QueryRoot, MutationRoot, EmptySubscription::new())
}
