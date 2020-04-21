<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>


<nav aria-label="breadcrumb">
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="/">На главную</a></li>
        <li class="breadcrumb-item active" aria-current="page">Students List</li>
    </ol>
</nav>

<c:if test="${role eq 1}">
    <div class="container">
        <div class="btn-group-vertical">
            <a class="btn btn-outline-primary" href="studentprogress.html" role="button">Просмотреть успеваемость
                выбранных студентов</a>
            <a class="btn btn-outline-primary" href="/student-create" role="button">Создать студента</a>
            <a class="btn btn-outline-primary" href="studentmodifying.html" role="button">Модифицировать выбранного
                студента</a>
            <a class="btn btn-outline-primary" href="#" role="button">Удалить выбранных студентов</a>

        </div>
    </div>
</c:if>

<br>

<br>
<div class="container">
    <p> Список студентов.</p>
</div>

<div class="container">
<div class="row">
<div class="col-md-8">

<table class="table table-striped">
<thead>
<tr>
    <th></th>
    <th>Фамилия</th>
    <th>Имя</th>
    <th>Группа</th>
    <th>Дата поступления</th>
</tr>
</thead>
<tbody>
<c:forEach items="${students}" var="s" varStatus="i">
    <tr>
    <td>
    <c:if test="${role eq 1}">
        <input type="checkbox" value="${s.id}" name="checkboxstudent" id="cbx${i.count}"/>
        <label for="cbx${i.count}"> </label>
    </c:if>
    </td>
    </tr>
    <td>${s.student}</td>
    </tbody>
    </table>
    </div>
    </div>
    </div>

    <%--<form id="formModifyingDiscipline" method="get" action="/discipline-modify">--%>
    <%--    <input type="hidden" id="idModifyDisc" name="idModifyDisc" value="">--%>
    <%--</form>--%>


    <%--<form id="formDeleteDisciplines" method="post" action="/disciplines">--%>
    <%--    <input type="hidden" id="idsDeleteDisc" name="idsDeleteDisc" value="">--%>
    <%--</form>--%>