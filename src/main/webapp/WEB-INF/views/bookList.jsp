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
</head>
<body>

<!-- Include Navbar -->
<jsp:include page="/WEB-INF/views/includes/navbar.jsp" />

<!-- Main content -->
<div class="container mt-4">
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                <!-- 로그인 화면  시작-->
                <c:if test="${empty cus}">
                  <div class="d-flex mt-3 mb-3 justify-content-center">
                         <form class="form-inline" action="${contextPath}/login" method="post">
                           <label for="username">아이디:</label>
                           <input type="text" class="form-control" placeholder="Enter username" id="username" name="username">
                           <label for="password">Password:</label>
                           <input type="password" class="form-control" placeholder="Enter password" id="password" name="password">
                           <button type="submit" class="btn btn-primary btn-sm">로그인</button>
                         </form>
                    </div>
                  </c:if>
                  <!-- 로그인 화면 끝 -->
                   <c:if test="${not empty cus}">
                          <div class="d-flex mt-3 mb-3 justify-content-center">
                              <form class="form-inline" action="${contextPath}/logout" method="post">
                                <label>Welcome:${cus.customerName}님 방문을 환영합니다.</label>
                                <label>Reserves:${cus.reserves}</label>
                                <button type="submit" class="btn btn-primary btn-sm">로그아웃</button>
                              </form>
                  	    </div>
                   </c:if>
                </div>
                <div class="card-body">
                     <table class="table table-bordered">
                          <thead>
                              <tr>
                                  <th>ID</th>
                                  <th>Title</th>
                                  <th>Price</th>
                                  <th>Author</th>
                                  <th>Pages</th>
                                  <th>CreatedAt</th>
                              </tr>
                          </thead>
                          <tbody>
                              <!-- JSTL c:forEach로 리스트 반복 -->
                              <c:forEach var="book" items="${list}">
                                  <tr>
                                      <td>${book.id}</td>
                                      <td><a href="${contextPath}/bookView/${book.id}">${book.title}</a></td>
                                      <td>${book.price}</td>
                                      <td>${book.author}</td>
                                      <td>${book.page}</td>
                                      <td><fmt:formatDate value="${book.createdAt}" pattern="yyyy-MM-dd"/></td>
                                  </tr>
                              </c:forEach>
                          </tbody>
                      </table>
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
