pub mod entities;
mod root;

use self::root::{MutationRoot, QueryRoot};
use juniper::{EmptySubscription, RootNode};

pub struct Context {}

impl juniper::Context for Context {}

pub type Schema = RootNode<'static, QueryRoot, MutationRoot, EmptySubscription<Context>>;

pub fn create_schema() -> Schema {
    Schema::new(QueryRoot, MutationRoot, EmptySubscription::new())
}
