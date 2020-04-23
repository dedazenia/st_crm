<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>


<nav aria-label="breadcrumb">
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="/">На главную</a></li>
        <li class="breadcrumb-item active" aria-current="page">Студенты</li>
    </ol>
</nav>

<c:if test="${role eq 1}">
    <div class="container">
        <div class="btn-group-vertical" style="color:inherit" >

            <button type="button" class="btn btn-outline-primary">
                <a onclick="showMarksForSelectStudent()" style="color:inherit" role="button" aria-pressed="true"> Просмотреть успеваемость
                    студента</a>
            </button>

            <a class="btn btn-outline-primary" href="/student-create" role="button">Создать студента</a>

            <button type="button" class="btn btn-outline-primary">
                <a onclick="modifySelectStudent()" style="color:inherit" role="button" aria-pressed="true"> Модифицировать выбранного
                    студента</a>
            </button>

            <button type="button" class="btn btn-outline-primary">
                <a onclick="deleteSelectStudents()" style="color:inherit" role="button" aria-pressed="true"> Удалить студента</a>
            </button>
        </div>
    </div>
</c:if>
<br>
<br>
<div class="col-md-8">
    <table class="table table-hover">
        <thead class="thead-dark">
        <tr>
            <c:if test="${role eq 1}">
                <th></th>
            </c:if>
            <th>Фамилия</th>
            <th>Имя</th>
            <th>Группа</th>
            <th>Дата зачисления</th>
        </tr>
        </thead>
        <c:forEach items="${studentos}" var="s">
            <tr>
                <c:if test="${role eq 1}">
                    <th>
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="${s.id}"
                                   id="defaultCheck2">
                        </div>
                    </th>
                </c:if>
                <th>
                        ${s.name}
                </th>
                <th>
                        ${s.surname}
                </th>
                <th>
                        ${s.group}
                </th>
                <th>
                        ${s.date}
                </th>
            </tr>
        </c:forEach>
    </table>
</div>


<form id="formMarksStudent" method="get" action="/student-progress">
    <input type="hidden" id="idStudentProgress" name="idStudentProgress" value="">
</form>
<form id="formModifyingStudent" method="get" action="/student-modify">
    <input type="hidden" id="idModifyStudent" name="idModifyStudent" value="">
</form>

<form id="formDeleteStudent" method="post" action="/students">
    <input type="hidden" id="idsDeleteStud" name="idsDeleteStud" value="">
</form>