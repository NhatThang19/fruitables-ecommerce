package vn.knight.fruitables_ecommerce;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
// @SpringBootApplication(exclude =
// org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration.class)
public class FruitablesEcommerceApplication {

	public static void main(String[] args) {
		SpringApplication.run(FruitablesEcommerceApplication.class, args);
	}

}
