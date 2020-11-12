package kr.or.ddit.config.spring;

import javax.annotation.Resource;
import javax.sql.DataSource;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;

// DataSourceContext 에 등록된 dataSource 스프링 빈을 주입받기 위해 선언
// @Import({DataSourceContext.class})
// 스프링 빈중에 PlatformTransactionManager 타입의 빈이 있으면 해당 빈을 트랜잭션 매니저로 등록
@EnableTransactionManagement
@Configuration
public class TransactionContext {

	
	@Resource(name="dataSource")
	private DataSource dataSource;
	
	
	/*
	<bean id="transactionManager" class="org.springframework.jdbc.datasource.DataSourceTransactionManager">
		<property name="dataSource" ref="dataSource"></property>
	</bean>
	 */
	@Bean
	public PlatformTransactionManager transactionManager() {
		DataSourceTransactionManager transactionManager = new DataSourceTransactionManager(dataSource);
		
		return transactionManager;
	}
	
	
	
	
	/*
	<tx:advice id="txAdvisor" transaction-manager="transactionManager">
		<tx:attributes>
		
			<!-- tx:method name : 트랜잭션을 적용할 메소드의 이름, 패턴 적용
				 		       	  ex)	  
				 				  	select*
				 				  	get*
				 				  	insert* (insertboard, insertmember 등 insert토 시작하는 메소드 이름)
				 				  	* (메소드 전체)
			 -->
			<tx:method name="*" /><!-- * =모든 메서드 등록 -->
			
		</tx:attributes>
	</tx:advice>	
	 */

	/*
	<aop:config>
		<!-- execution, within - 특정 패키지에 담겨있는 클래스를 찾을때, bean-스프링 빈 -->
		<aop:advisor advice-ref="txAdvisor" pointcut="within(kr.or.ddit..service.*)"/> <!-- service에담긴 모든 클래스 포함 -->
	</aop:config>
	*/
	
	
	// 위 두부분에 해당하는 java 설정은 없음
	// @Transaction 어노테이션을 트랜잭션으로 삼을 메소드나, 클래스 단위로 붙여준다.
	// 스프링 빈을 <bean>엘레멘트를 통해 일일이 등록 ==> @Controller, @Service
	
	
	
	
}
