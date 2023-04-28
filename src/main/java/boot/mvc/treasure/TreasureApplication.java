package boot.mvc.treasure;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan({"boot.mvc.*"})  // == boot.*
@MapperScan("boot.mvc.*")
public class TreasureApplication {

	public static void main(String[] args) {
		SpringApplication.run(TreasureApplication.class, args);
	}

}
