package annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target(ElementType.METHOD)//적용대상 메서드
@Retention(RetentionPolicy.RUNTIME)//적용시점 런타임
public @interface PrintAnnotation {//소스단
	String value() default "-"; //디폴트 엘리먼트
	int number() default 15; 
}

