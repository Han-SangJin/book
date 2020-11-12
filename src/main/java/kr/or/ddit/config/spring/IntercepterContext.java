package kr.or.ddit.config.spring;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

import kr.or.ddit.mvc.interceptor.PerFormanceCheckInterceptor;
import kr.or.ddit.mvc.interceptor.SessionCheckInterceptor;

//@Configuration
public class IntercepterContext extends WebMvcConfigurerAdapter {
	
	/*
	 <mvc:interceptors>
		<mvc:interceptor>
			<mvc:mapping path="/**"/>
			<bean class="kr.or.ddit.mvc.interceptor.PerFormanceCheckInterceptor"></bean>
		</mvc:interceptor>
		 
		exclude 포함하지 않음
		<mvc:interceptor>
			<mvc:mapping path="/**"/>
			<mvc:exclude-mapping path="/login/**"/>
			<mvc:exclude-mapping path="/js/**"/>
			<mvc:exclude-mapping path="/css/**"/>
			<mvc:exclude-mapping path="/resources/**"/>
			<bean class="kr.or.ddit.mvc.interceptor.SessionCheckInterceptor"></bean>
		</mvc:interceptor>
	</mvc:interceptors>
	 */
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(new PerFormanceCheckInterceptor()).addPathPatterns("/**");
		registry.addInterceptor(new SessionCheckInterceptor()).addPathPatterns("/**")
															  .excludePathPatterns("/login/**"
																	  			  ,"/js/**"
																	  			  ,"/css/**"
																	  			  ,"/resources/**");
	}
	
	
}
