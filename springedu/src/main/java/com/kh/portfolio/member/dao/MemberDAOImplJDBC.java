/*
 * package com.kh.portfolio.member.dao;
 * 
 * import java.sql.Date; import java.sql.ResultSet; import
 * java.sql.SQLException; import java.util.List;
 * 
 * import javax.inject.Inject;
 * 
 * import org.slf4j.Logger; import org.slf4j.LoggerFactory; import
 * org.springframework.jdbc.core.BeanPropertyRowMapper; import
 * org.springframework.jdbc.core.JdbcTemplate; import
 * org.springframework.jdbc.core.RowMapper; import
 * org.springframework.stereotype.Repository;
 * 
 * 
 * import com.kh.portfolio.member.vo.MemberVO;
 * 
 * @Repository // Persistence Layer에서 DAO를 명시하기 위해서 사용 빈으로 등록하기위해 사용
 * 
 * public class MemberDAOImplJDBC implements MemberDAO {
 * 
 * private static final Logger logger =
 * LoggerFactory.getLogger(MemberDAOImplJDBC.class);
 * 
 * @Inject JdbcTemplate jdbcTemplate;
 * 
 * //회원등록
 * 
 * @Override public int joinMember(MemberVO memberVO) {
 * logger.info("MemberDAOImpl.insert(MemberVO memberVO) 호출됨");
 * logger.info(memberVO.toString()); // 문자열로 만들어 리턴 int cnt =0;
 * 
 * //sql문 작성 StringBuffer sql = new StringBuffer(); sql.
 * append("insert into member( id, pw, tel, name, gender, region, birth, cdate) "
 * ); sql.append("values(?,?,?,?,?,?,?,systimestamp) ");
 * 
 * //sql 실행 cnt = jdbcTemplate.update( sql.toString(),
 * memberVO.getId(),memberVO.getPw(),memberVO.getTel(),memberVO.getName(),
 * memberVO.getGender(),memberVO.getRegion(),memberVO.getBirth());
 * 
 * return cnt; }
 * 
 * //회원수정
 * 
 * @Override public int modifyMember(MemberVO memberVO) { int cnt = 0;
 * StringBuffer sql = new StringBuffer(); sql.append("update member " ); sql.
 * append("set tel = ?, name = ?, gender= ?, region = ?, birth = ?, udate = systimestamp "
 * ); sql.append("where id = ?" );
 * 
 * cnt = jdbcTemplate.update( sql.toString(), memberVO.getTel(),
 * memberVO.getName(), memberVO.getGender(), memberVO.getRegion(),
 * memberVO.getBirth(), memberVO.getId()); return cnt; }
 * 
 * //회원 전체조회
 * 
 * @Override public List<MemberVO> selectAllMember() {
 * logger.info("MemberDAOImpl.selectAllMember(String id, String pw) 호출됨");
 * List<MemberVO> list = null; //sql 작성 StringBuffer sql = new StringBuffer();
 * sql.append("select id, pw, tel, name, gender, region, birth, cdate, udate ");
 * sql.append(" from member "); list = jdbcTemplate.query(sql.toString(),
 * getRowMapper()); return list; }
 * 
 * //회원 개별조회
 * 
 * @Override public MemberVO selectMember(String id) {
 * logger.info("MemberDAOImpl.selectMember(String id, String pw) 호출됨"); MemberVO
 * memberVO = null;
 * 
 * StringBuffer sql = new StringBuffer();
 * sql.append("select id, pw, tel, name, gender, region, birth, cdate, udate ");
 * sql.append(" from member "); sql.append(" where id = ? ");
 * 
 * memberVO = jdbcTemplate.queryForObject(sql.toString(), //테이블 컬럼 이름과 자바VO객체
 * 속성이름이 같으면 자동 매핑해줌 new BeanPropertyRowMapper<MemberVO>(MemberVO.class), id);
 * //테이블 컬럼 이름과 자바VO객체 속성 수동매핑 return memberVO; }
 * 
 * //회원 탈퇴
 * 
 * @Override public int outMember(String id, String pw) {
 * logger.info("MemberDAOImpl.outMember(String id, String pw) 호출됨"); int cnt =
 * 0;
 * 
 * StringBuffer sql = new StringBuffer();
 * sql.append("delete from member where id = ? and pw = ?");
 * 
 * cnt = jdbcTemplate.update(sql.toString(),id,pw); return cnt; }
 * 
 * //로그인
 * 
 * @Override public MemberVO loginMember(String id, String pw) {
 * logger.info("MemberDAOImpl.loginMember(String id, String pw) 호출됨"); MemberVO
 * memberVO = null;
 * 
 * StringBuffer sql = new StringBuffer();
 * sql.append("select id, pw, tel, name, gender, region, birth, cdate, udate ");
 * sql.append(" from member "); sql.append(" where id = ? ");
 * sql.append(" and pw = ? ");
 * 
 * memberVO = jdbcTemplate.queryForObject( sql.toString(), new
 * BeanPropertyRowMapper<MemberVO>(MemberVO.class), id,pw); return memberVO;
 * 
 * }
 * 
 * //아이디 찾기
 * 
 * @Override public String findID(String tel, Date birth) {
 * logger.info("MemberDAOImpl.findID(String tel, Date birth) 호출됨!"); String id =
 * null;
 * 
 * StringBuffer sql = new StringBuffer();
 * sql.append("select id from member where tel=? and birth=? ");
 * 
 * id = jdbcTemplate.queryForObject(sql.toString(), String.class, tel, birth);
 * return id; }
 * 
 * 
 * //비밀번호 변경 대상 찾기
 * 
 * @Override public int findPW(MemberVO memberVO) {
 * logger.info("MemberDAOImpl.findPW(MemberVO memberVO 호출됨"); int cnt = 0;
 * 
 * StringBuffer sql = new StringBuffer();
 * sql.append("select count(id) from member ");
 * sql.append(" where id=? and tel=? and birth=? ");
 * 
 * cnt = jdbcTemplate.queryForObject( sql.toString(), Integer.class,
 * memberVO.getId(), memberVO.getTel(),memberVO.getBirth());
 * 
 * return cnt; }
 * 
 * //비밀번호 변경
 * 
 * @Override public int changePW(String id, String pw) {
 * logger.info("MemberDAOImpl.changePW(String id, String pw) 호출됨"); int cnt = 0;
 * StringBuffer sql = new StringBuffer(); sql.append("update member " );
 * sql.append("set pw = ? " ); sql.append("where id = ? " );
 * 
 * cnt = jdbcTemplate.update(sql.toString(),pw,id); return cnt; }
 * 
 * 
 * 
 * //MEMBER db테이블과 자바객체MemberVO를 수동매핑 private RowMapper<MemberVO> getRowMapper()
 * { RowMapper<MemberVO> rowMapper = new RowMapper<MemberVO>() {
 * 
 * @Override public MemberVO mapRow(ResultSet rs, int rowNum) throws
 * SQLException { MemberVO memberVO = new MemberVO();
 * memberVO.setId(rs.getString("id")); memberVO.setPw(rs.getString("pw"));
 * memberVO.setTel(rs.getString("tel")); memberVO.setName(rs.getString("Name"));
 * memberVO.setGender(rs.getString("gender"));
 * memberVO.setRegion(rs.getString("region"));
 * memberVO.setBirth(rs.getDate("birth"));
 * memberVO.setCdate(rs.getTimestamp("cdate"));
 * memberVO.setUdate(rs.getTimestamp("udate")); return memberVO; } }; return
 * rowMapper; }
 * 
 * 
 * }
 */