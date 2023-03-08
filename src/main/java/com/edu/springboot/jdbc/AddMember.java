package com.edu.springboot.jdbc;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.TransactionCallbackWithoutResult;
import org.springframework.transaction.support.TransactionTemplate;

//빈을 자동으로 생성하기 위해 어노테이션을 추가한다.
@Service
public class AddMember {
	@Autowired
	ITicketService dao;
	
	@Autowired
	TransactionTemplate transactionTemplate;
	
	/*
	 전파속성
	 	REQUIRED:기존 트랜잭션에 의존한다.
	 		즉, 포함된 메소드나 포함시킨 메소드
	 		어느쪽이든 오류가 발생하면
	 		모든 작업이 rollback처리된다.
	 	REQUIRES_NEW:각각의 트랜잭션을 처리한다.
	 		즉, 포함시킨 메소드에서 에러가 발생되더라도
	 		포함된 메소드에서는 정상처리된다.
	 */
	@Transactional(propagation=Propagation.REQUIRES_NEW)
//	@Transactional(propagation=Propagation.REQUIRED)
	public void memberInsert(TicketDTO ticketDTO, String errFlag) {
		try {
			transactionTemplate.execute(new TransactionCallbackWithoutResult() {
				
				@Override
				protected void doInTransactionWithoutResult(TransactionStatus status) {
					if(errFlag!=null&&errFlag.equals("2")) {
						int money=Integer.parseInt("200원");
					}
					
					int result3=dao.memberRegist(ticketDTO);
					if(result3==1)
						System.out.println("member테이블 입력성공");
				}
			});
		}
		catch(Exception e) {
//			e.printStackTrace();
			System.out.println("member테이블 Rollback됨");
		}
	}
}
