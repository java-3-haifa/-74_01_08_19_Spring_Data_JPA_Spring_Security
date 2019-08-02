# Lesson #74 01/08/19 SpringDataJPA with SpringSecurity

## Added classes to classwork:
[ChangeProductPriceDto.java](https://github.com/java-3-haifa/-74_01_08_19_Spring_Data_JPA_Spring_Security/blob/master/src/main/java/com/telran/telranshopspringdata/controller/dto/ChangeProductPriceDto.java)
[ProductStatisticDto.java](https://github.com/java-3-haifa/-74_01_08_19_Spring_Data_JPA_Spring_Security/blob/master/src/main/java/com/telran/telranshopspringdata/controller/dto/ProductStatisticDto.java)
[UserStatisticDto.java](https://github.com/java-3-haifa/-74_01_08_19_Spring_Data_JPA_Spring_Security/blob/master/src/main/java/com/telran/telranshopspringdata/controller/dto/UserStatisticDto.java)

## HomeTask:
1. Add relation to UserEntity and UserDetailsEntity
2. Add Security logic for all User methods
3. Finish [UserServiceImpl.java](https://github.com/java-3-haifa/-74_01_08_19_Spring_Data_JPA_Spring_Security/blob/master/src/main/java/com/telran/telranshopspringdata/service/UserServiceImpl.java)
4. Add classes and logic for implemets all methods in [AdminController.java](https://github.com/java-3-haifa/-74_01_08_19_Spring_Data_JPA_Spring_Security/blob/master/src/main/java/com/telran/telranshopspringdata/controller/AdminController.java)

- For statistic you can use [OrderEntity](https://github.com/java-3-haifa/-74_01_08_19_Spring_Data_JPA_Spring_Security/blob/master/src/main/java/com/telran/telranshopspringdata/data/entity/OrderEntity.java) or create one more Entity for it

### Description for methods:

*Method should add new Product and return ID which was generated for this product*
```java
public String addProduct(@RequestBody ProductDto dto);
```

*Method should change price for product (the price change should not affect the cart or user orders)*
```java
public String changeProductPrice(@RequestBody ChangeProductPriceDto dto);
```

*Method should add new Category and return ID which was generated for this category*
```java
public String addCategory(@RequestBody CategoryDto dto);
```

*Method should return product or products which bought most times*
```java
public List<ProductStatisticDto> getMostPopularProduct();
```

*Method should return product or products which made a big profit*
```java
public List<ProductStatisticDto> getMostProfitableProduct();
```

*Method should return user or users which bought the most products*
```java
public List<UserStatisticDto> getMostActiveUser();
```

*Method should return user or users which spent the most money*
```java
public List<UserStatisticDto> getMostProfitableUser();
```

### DataBase connection
Change [application.properties](https://github.com/java-3-haifa/-74_01_08_19_Spring_Data_JPA_Spring_Security/blob/master/src/main/resources/application.properties) for connect your DataBase

```properties
>>>>> spring.datasource.url=jdbc:mysql://[database_host]:[database_port]/[database_name]?useSSL=false&useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC
>>>>> spring.datasource.username=[Your database user name]
>>>>> spring.datasource.password=[Your database password]
```

### HTTP Requests Examples
[Requests for admin](https://github.com/java-3-haifa/-74_01_08_19_Spring_Data_JPA_Spring_Security/blob/master/RequestsAdmin.http)

[Requests for users](https://github.com/java-3-haifa/-74_01_08_19_Spring_Data_JPA_Spring_Security/blob/master/RequestsUser.http)

### DataBase dump

[Database dump file](https://github.com/java-3-haifa/-74_01_08_19_Spring_Data_JPA_Spring_Security/blob/master/database_dump.sql)

### ERD
![database schema](https://github.com/java-3-haifa/-74_01_08_19_Spring_Data_JPA_Spring_Security/blob/master/ERD.png)
