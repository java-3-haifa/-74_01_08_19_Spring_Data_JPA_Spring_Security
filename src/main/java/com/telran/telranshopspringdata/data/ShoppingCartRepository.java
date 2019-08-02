package com.telran.telranshopspringdata.data;

import com.telran.telranshopspringdata.data.entity.ShoppingCartEntity;
import com.telran.telranshopspringdata.data.entity.UserEntity;
import org.springframework.data.repository.CrudRepository;

public interface ShoppingCartRepository extends CrudRepository<ShoppingCartEntity,String> {
    ShoppingCartEntity findByOwner_Email(String email);

    ShoppingCartEntity findShoppingCartEntityByOwner_Email(String userEmail);
}
