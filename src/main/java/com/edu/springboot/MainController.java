package com.edu.springboot;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.TransactionCallbackWithoutResult;
import org.springframework.transaction.support.TransactionTemplate;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.edu.springboot.jdbc.AddMember;
import com.edu.springboot.jdbc.IMemberService;
import com.edu.springboot.jdbc.ITicketService;
import com.edu.springboot.jdbc.MemberDTO;
import com.edu.springboot.jdbc.PayDTO;
import com.edu.springboot.jdbc.TicketDTO;

@Controller
public class MainController {
	@RequestMapping("/")
	public String home() {
		return "home";
	}
	
	//서비스 인터페이스를 통해 Mapper의 메소드를 호출하므로
		//여기서 자동주입 받는다.
	private SqlSession sqlSession;
	@Autowired
	IMemberService dao;
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//회원 목록
	@GetMapping("/list.do")
	public String member1(Model model) {
		//Mapper에서 반환한 List컬렉션을 Model에 저장한 후 뷰를 호출한다.
		model.addAttribute("memberList", dao.select());
		return "list";
	}
	
	//회원 등록
	//get방식일때는 등록 페이지만 매핑
	@GetMapping("/regist.do")
	public String member2() {
		return "regist";
	}
	//post방식일때는 DB에 등록 처리
	@PostMapping("/regist.do")
	public String member3(MemberDTO memberDTO) {
		//전송된 폼값은 커맨드객체를 통해 한꺼번에 받은 후 DAO로 전달한다.
		int result=dao.insert(memberDTO);
		if(result==1) System.out.println("입력되었습니다.");
		return "redirect:login.do";
	}
	
	//회원 수정
	/*
	 get방식일때는 수정페이지로 진입한다.
	 이때 기존 게시물을 인출하여 수정폼에 입력한다.
	 */
	@GetMapping("/edit.do")
	public String member4(MemberDTO memberDTO, Model model) {
		//아이디로 전송된 파라미터를 이용해서 하나의 레코드를 인출한다.
		memberDTO=dao.selectOne(memberDTO);
		model.addAttribute("dto", memberDTO);
		return "edit";
	}
	//post방식일때는 수정처리한다.
	@PostMapping("/edit.do")
	public String member5(MemberDTO memberDTO) {
		int result=dao.update(memberDTO);
		if(result==1) System.out.println("수정되었습니다.");
		return "redirect:list.do";
	}
	
	//회원 삭제
	@GetMapping("/delete.do")
	public String member6(MemberDTO memberDTO) {
		//파라미터로 전달된 아이디에 해당하는 레코드를 삭제한다.
		int result=dao.delete(memberDTO);
		if(result==1) System.out.println("삭제되었습니다.");
		//삭제가 완료되면 리스트로 리다이렉트한다.
		return "redirect:list.do";
	}
	
	@RequestMapping("/ticket.do")
	public String member7() {
		return "ticket";
	}

	@RequestMapping("/login.do")
	public String login(Model model) {
		return "login";
	}
	
	//로그인 처리:session내장객체 사용
	@RequestMapping("/loginAction.do")
	public ModelAndView loginAction(HttpServletRequest req,
			HttpSession session) {
		//폼값으로 전송된 id, pass를 login()메소드로 전달하여 Mapper를 호출한다.
		MemberDTO dto=sqlSession
				.getMapper(IMemberService.class)
				.login(req.getParameter("id"), req.getParameter("pass"));
		
		//Model객체에 속성저장과 View 반환을 동시에 처리할 수 있는 객체
		ModelAndView mv=new ModelAndView();
		//Mapper에서 회원인증에 실패한 경우
		if(dto==null) {
			//로그인 실패 메세지를 모델객체에 저장한다.
			mv.addObject("LoginNG", "아이디/패스워드가 틀렸습니다.");
			//로그인 페이지를 화면에 출력한다.
			mv.setViewName("login");
			return mv;
		}
		else {
			//로그인에 성공한 경우에는 세션영역에 DTO객체를 저장한다.
			session.setAttribute("siteUserInfo", dto);
		}
		
		/*
		 로그인 처리 후 backUrl이 있는 경우라면 해당 페이지로 이동시킨다.
		 만약 값이 없다면 로그인 페이지로 이동시킨다.
		 backUrl은 글쓰기 페이지로 진입시 로그인정보가 없는 경우
		 파라미터로 전달된 쓰기 페이지의 View경로이다.
		 */
		String backUrl=req.getParameter("backUrl");
		if(backUrl==null || backUrl.equals("")) {
			mv.setViewName("login");
		}
		else {
			mv.setViewName(backUrl);
		}
		return mv;
	}
	
	@RequestMapping(value="/logout.do", method=RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping("/baseball.do")
	public String ticket1() {
		return "baseball";
	}
	@RequestMapping("/soccer.do")
	public String ticket2() {
		return "soccer";
	}
	@RequestMapping("/basketball.do")
	public String ticket3() {
		return "basketball";
	}
	@RequestMapping("/volleyball.do")
	public String ticket4() {
		return "volleyball";
	}
	@RequestMapping("/board.do")
	public String ticket5() {
		return "board";
	}
	@RequestMapping("/qna.do")
	public String ticket6() {
		return "qna";
	}
	
	//서비스 인터페이스 자동주입
	@Autowired
	ITicketService dao;
	
	//트랜잭션 서비스 자동주입-트랜잭션 템플릿 사용
	@Autowired
	TransactionTemplate transactionTemplate;
	
	//추가작업 클래스:회원 테이블에 구매한 사람의 로그를 기록한다.
	@Autowired
	AddMember addMember;
	
	//티켓구매
	@RequestMapping(value="/buyTicket.do", method = RequestMethod.GET)
	public String buy1() {
		return "buy";
	}
	
	//티켓구매를 위한 트랜잭션 처리
	@RequestMapping(value="/buyTicket.do", method = RequestMethod.POST)
	public String buy2(TicketDTO ticketDTO, PayDTO payDTO,
			HttpServletRequest req, Model model) {
		//구매 성공시 포워드할 뷰 페이지
		String viewPath="success";
		/*
		 트랜잭션 매니저에서 사용했던 Status객체 생성 부분은 삭제한다.
		 */
		try {
			/*
			 템플릿내에 익명클래스를 통해 오버라이딩된 메소드로
			 모든 비즈니스 로직을 옮겨주면 된다.
			 템플릿을 사용하면 별도의 commit, rollback이 없어도
			 알아서 처리된다.
			 */
			transactionTemplate.execute(new TransactionCallbackWithoutResult() {
				
				@Override
				protected void doInTransactionWithoutResult(TransactionStatus status) {
					String errFlag=req.getParameter("err_flag");
					
					//회원 정보 입력(추가작업)
					addMember.memberInsert(ticketDTO, errFlag);
					
					//DB처리 1:구매금액에 관련한 처리.
						//구매수*10000원
					payDTO.setAmount(ticketDTO.getT_count()*10000);
					int result1=dao.payInsert(payDTO);
					if(result1==1) System.out.println("transaction_pay 입력성공");
					
					//비즈니스로직 처리(의도적인 에러발생)
					if(errFlag!=null&&errFlag.equals("1")) {
						/*
						 구매페이지에서 체크박스에 체크한 경우 이 부분이
						 실행되어 NumberFormatException이 발생된다.
						 단위 작업 내에서 발생된 예외이므로
						 try문 안에서의 모든 작업이 rollback된다.
						 */
						int money=Integer.parseInt("100원");
					}
					
					//DB처리 2:티켓구매개수에 대한 처리.
						//6장 이상이면 제약조건 위배로 에러 발생됨.
					int result2=dao.ticketInsert(ticketDTO);
					if(result2==1) System.out.println("transaction_ticket 입력성공");
					
					model.addAttribute("ticketDTO", ticketDTO);
					model.addAttribute("payDTO", payDTO);
				}
			});
			
		}
		catch(Exception e) {
			e.printStackTrace();
			//작업중 하나라도 오류가 발생되면 모든 작업은 롤백한 후
				//에러페이지로 포워드한다.
			viewPath="error";
		}
		return viewPath;
	}
}
