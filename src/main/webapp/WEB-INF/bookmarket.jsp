<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>
			Book Lender Dashboard
		</title>
		<link rel="stylesheet" type="text/css" href="/css/style2.css">
		<script type="text/javascript" src="js/app2.js"></script>
	</head>
	<body>
		<header>
			<div>
				<h3>
					Hello, <c:out value="${name}"/>, Welcome to...
				</h3>
				<h1>
					The Book Broker!
				</h1>
				<h3>
					Available Books to Borrow
				</h3>
			</div>
			<div>
				<form method="GET" action="/books/">
					<button type="submit" class="link" >
						back to the shelves
					</button>
				</form>
			</div>
		</header>
		<main class="column">
			<table>
	        	<thead>
			        <tr>
			            <th>Id</th>
			            <th>Title</th>
			            <th>Author Name</th>
			            <th>Owner</th>
			            <th>Actions</th>
			        </tr>
			    </thead>
	        	<tbody>
					<c:forEach var="book" items="${booksList}">
						<tr>
	                        <td><c:out value="${book.getId()}"/></td>
	                        <td>
	                        	<form method="GET" action="/books/${book.getId()}">
									<button type="submit" class="link" >
										<c:out value="${book.getTitle()}"/>
									</button>
								</form>
	                        </td>
	                        <td><c:out value="${book.getAuthor()}"/></td>
	                        <td><c:out value="${book.getUser().getName()}"/></td>
	                        <td>
	                        	<c:if test="${book.getUser().getEmail().equals(user)}">
		                        	<div class="row">
			                        	<form method="GET" action="/books/${book.getId()}/edit">
											<button type="submit" class="link" >
												edit
											</button>
										</form>
										<form method="POST" action="/books/${book.getId()}/delete">
									    	<input type="hidden" name="_method" value="DELETE" />
											<button type="submit" class="link" >
												delete
											</button>
										</form> 
									</div>
								</c:if>
								<c:if test="${! book.getUser().getEmail().equals(user)}">
		                        	<form method="POST" action="/books/${book.getId()}/borrow">
										<button type="submit" class="link" >
											borrow
										</button>
									</form>
								</c:if>
							</td>
						</tr>
	            	</c:forEach>
				</tbody>
			</table>
			<h3>
				Books I'm Borrowing...
			</h3>
			<table>
	        	<thead>
			        <tr>
			            <th>Id</th>
			            <th>Title</th>
			            <th>Author Name</th>
			            <th>Owner</th>
			            <th>Actions</th>
			        </tr>
			    </thead>
	        	<tbody>
					<c:forEach var="book" items="${booksBorrowList}">
						<tr>
	                        <td><c:out value="${book.getId()}"/></td>
	                        <td>
	                        	<form method="GET" action="/books/${book.getId()}">
									<button type="submit" class="link" >
										<c:out value="${book.getTitle()}"/>
									</button>
								</form>
	                        </td>
	                        <td><c:out value="${book.getAuthor()}"/></td>
	                        <td><c:out value="${book.getUser().getName()}"/></td>
	                        <td>
	                        	<form method="POST" action="/books/${book.getId()}/return">
									<button type="submit" class="link" >
										return
									</button>
								</form>
							</td>
						</tr>
	            	</c:forEach>
				</tbody>
			</table>
		</main>
		<footer>
			<p>
                Developed by <a href="https://github.com/AMontoya224" target="_blank">Andres Montoya</a> 
            </p>
		</footer>
	</body>
</html>