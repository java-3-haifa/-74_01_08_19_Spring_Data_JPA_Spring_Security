package com.telran.telranshopspringdata.data;

import com.telran.telranshopspringdata.data.entity.ProductOrderEntity;
import com.telran.telranshopspringdata.data.entity.ShoppingCartEntity;
import org.springframework.data.repository.CrudRepository;

public interface ProductOrderRepository extends CrudRepository<ProductOrderEntity,String> {
    ProductOrderEntity findProductOrderEntityByProductIdAndShoppingCart(String productId, ShoppingCartEntity sce);
}
