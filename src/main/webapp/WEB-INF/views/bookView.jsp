<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>JSP Template with Bootstrap and JSTL</title>

    <!-- Bootstrap 4 CDN -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
     <style>
         .review-toggle{
            cursor : pointer;
            color : #17a2b8;
            font-weight : bold;
            text-decoration: underline;
         }
         .review-toggle:hover{
            color: #1391a0;
         }
    </style>
     <script>
          function toggle() {
              var reviewForm = document.getElementById("review-form");
              if (reviewForm.style.display === "none" || reviewForm.style.display === "") {
                  reviewForm.style.display = "block";
              } else {
                  reviewForm.style.display = "none";
              }
          }
      </script>
</head>
<body>

<!-- Include Navbar -->
<jsp:include page="/WEB-INF/views/includes/navbar.jsp" />

<!-- Main content -->
<div class="container mt-4">
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">책 상세보기(ID : ${book.id})</div>
                <div class="card-body">
                         <table class="table table-bordered">
                    	         <tr>
                    	           <td>번호</td>
                    	           <td>${book.id}</td>
                    	         </tr>
                    	         <tr>
                    	           <td>제목</td>
                    	           <td>${book.title}</td>
                    	         </tr>
                    	         <tr>
                    	           <td>가격</td>
                    	           <td>${book.price}</td>
                    	         </tr>
                    	         <tr>
                    	           <td>저자</td>
                    	           <td>${book.author}</td>
                    	         </tr>
                    	         <tr>
                    	           <td>페이지</td>
                    	           <td>${book.page}</td>
                    	         </tr>
                   	             <tr>
                    	           <td>등록일자</td>
                    	           <td>${book.createdAt}</td>
                    	         </tr>
                    	  </table>
                    	  <!-- 수정, 삭제, 목록, 구매(장바구니~~) -->
                           <table class="table text-center">
                                      <tr>
                                        <td>
                                          <a class="btn btn-sm btn-primary">수정</a>
                                          <a class="btn btn-sm btn-warning">삭제</a>
                                          <a href="${contextPath}/bookList" class="btn btn-sm btn-info">목록</a>
                                        </td>
                                        <td width="100">수량</td>
                                        <td><input type="number" class="form-control"/></td>
                                        <td>
                                           <button class="btn btn-sm btn-danger">장바구니담기</button>
                                        </td>
                                      </tr>
                            </table>
                            <!-- 작성된 리뷰가 있으면 출력 / 없으면 리뷰가 없습니다. -->
                           <h3>리뷰 리스트(평점평균 : <span class="badge badge-danger">${avgRating}</span>/5)</h3>
                           <table class="table">
                             <c:if test="${not empty reviews}">
                              <c:forEach var="review" items="${reviews}">
                                   <tr>
                                     <td>작성일 : <fmt:formatDate value="${review.createdAt}" pattern="yyyy-MM-dd" /></td>
                                     <td>${review.content}<td>
                                     <td>평점 : <span class="badge badge-danger">${review.cost}</span></td>
                                     <td><a href="${contextPath}/reviewRemove/${review.id}/${book.id}" class="btn btn-warning btn-sm">삭제</a></td>
                                   </tr>
                              </c:forEach>
                             </c:if>
                             <c:if test="${empty reviews}">
                              <tr>
                                <td colspan="3">등록된 리뷰가 없습니다.</td>
                              </tr>
                             </c:if>
                           </table>
                            <!-- 리뷰 : 내용, 작성자(로그인), 평점(1~5) -->
                             <div class="text-center mt-4">
                                   <span class="review-toggle" onclick="toggle()">리뷰 및 평점 쓰기</span>
                             </div>
                              <div id="review-form" class="mt-3 mb-3" style="display:none;">
                                <h3>리뷰 작성</h3>
                                       <form action="${contextPath}/reviewAdd" method="post">
                                       <input type="hidden" name="book_id" value="${book.id}"/>
                                       <input type="hidden" name="customer_id" value="${cus.id}"/>
                                       <table class="table">
                                          <tr>
                                            <td>내용</td>
                                            <td><textarea rows="2" name="content" class="form-control"></textarea></td>
                                          </tr>
                                          <tr>
                                            <td>평점</td>
                                            <td>
                                              <select class="form-control" name="cost">
                                                <option value="1">1점-매우 나쁨</option>
                                                <option value="2">2점-나쁨</option>
                                                <option value="3">3점-보통</option>
                                                <option value="4">4점-좋음</option>
                                                <option value="5">5점-매우 좋음</option>
                                              </select>
                                            </td>
                                          </tr>
                                          <tr>
                                          <td colspan="2">
                                             <button type="submit" class="btn btn-sm btn-primary">리뷰등록</button>
                                          <td>
                                          </tr>
                                       </table>
                                      </form>
                         </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Include Footer -->
<jsp:include page="/WEB-INF/views/includes/footer.jsp" />

<!-- jQuery and Bootstrap 4 JS via CDN -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
