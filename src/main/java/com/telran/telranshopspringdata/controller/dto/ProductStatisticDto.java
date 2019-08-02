package com.telran.telranshopspringdata.controller.dto;

import lombok.*;

import java.math.BigDecimal;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@Builder
public class ProductStatisticDto {
    private String productName;
    private String productCategory;
    private int numberOfPurchases;
    private BigDecimal totalAmount;
}
