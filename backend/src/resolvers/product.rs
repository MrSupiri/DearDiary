use crate::schema::{entities::product::Product, Context};
use juniper::{FieldError, FieldResult};

fn all_products() -> Vec<Product> {
    return vec![
        Product {
            id: "1".to_string(),
            user_id: "1".to_string(),
            name: "Generic Steel Table".to_string(),
            price: 901.00,
        },
        Product {
            id: "2".to_string(),
            user_id: "2".to_string(),
            name: "Sleek Cotton Ball".to_string(),
            price: 223.23,
        },
    ];
}

pub fn get_products(_ctx: &Context) -> FieldResult<Vec<Product>> {
    Ok(all_products())
}

pub fn get_product(_ctx: &Context, id: String) -> FieldResult<Product> {
    for product in all_products() {
        if product.id == id {
            return Ok(product);
        }
    }

    return Err(FieldError::new(
        "Product Not Found",
        graphql_value!({ "not_found": "product not found" }),
    ));
}

pub fn get_products_by_user_id(_ctx: &Context, user_id: String) -> FieldResult<Vec<Product>> {
    let mut user_products: Vec<Product> = Vec::new();

    for product in all_products() {
        if product.user_id == user_id {
            user_products.push(product);
        }
    }
    Ok(user_products)
}
