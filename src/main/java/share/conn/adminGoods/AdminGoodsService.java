package share.conn.adminGoods;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface AdminGoodsService {

	// 상품 리스트
	public List<Map<String, Object>> adGoodsList() throws Exception;

	// 전체 상품 수
	public Integer adAllGoodsNum() throws Exception;
	
	//상품 상세
	public List<Map<String, Object>> adGoodsDetail(Map<String, Object> map) throws Exception;
	
	// 상품 등록
	public void adGoodsinsert(Map<String, Object> map, HttpServletRequest request) throws Exception;
	
	//카테고리 불러오기 (빅카테고리, 스몰카테고리로 카테고리넘 찾기)
	public Map<String,Object> adGoodsSelectCategory(Map<String, Object> map) throws Exception;
	
	// 상품 수정 폼으로 이동
	public List<Map<String, Object>> modifyGoodsForm(Map<String, Object> map) throws Exception;
	
	//상품 이미지 정보
	public List<Map<String, Object>> modifyGoodsFormImage(Map<String, Object> map) throws Exception;
		
	//상품 수정
	public void adGoodsModify(Map<String, Object> map, HttpServletRequest request) throws Exception;

	//상품 삭제
	public void adGoodsDelete(Map<String, Object> map) throws Exception;

	//상품 검색(상품 번호)
	public List<Map<String, Object>> adGoodsNumSearch(String isSearch) throws Exception;

	//상품 검색(상품명)
	public List<Map<String, Object>> adGoodsNameSearch(String isSearch) throws Exception;

	//상품 검색(브랜드명)
	public List<Map<String, Object>> adGoodsCategory2Search(String isSearch) throws Exception;
	
	/*
	 * //상품 할인적용 (상품번호 1개만) public void adGoodsDc(Map<String, Object> map) throws
	 * Exception;
	 * 
	 * //상품 할인적용 (카테고리) public void adCategoryDc(Map<String, Object> map) throws
	 * Exception;
	 * 
	 * //상품 할인취소 (상품번호 1개만) public void adGoodsDcCancel(Map<String, Object> map)
	 * throws Exception;
	 * 
	 * //상품 할인취소 (카테고리) public void adCategoryDcCancel(Map<String, Object> map)
	 * throws Exception;
	 * 
	 * //할인 중인 상품리스트 (가격순 정렬) public List<Map<String, Object>>
	 * adDcGoodsListPriceSort(Map<String, Object> map) throws Exception;
	 * 
	 * //할인 중인 상품리스트 (카테고리 정렬) public List<Map<String, Object>>
	 * adDcGoodsListAllCategory(Map<String, Object> map) throws Exception;
	 */
}
