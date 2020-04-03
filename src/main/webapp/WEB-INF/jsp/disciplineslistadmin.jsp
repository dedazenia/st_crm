<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>


<nav aria-label="breadcrumb">
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="/">На главную</a></li>
        <li class="breadcrumb-item active" aria-current="page">Дисциплины</li>
    </ol>
</nav>

<c:if test="${role eq 1}">
    <div class="btn-group-vertical">

        <a class="btn btn-outline-primary" href="/discipline-create" role="button">Создать дисциплину</a>

        <button type="button" class="btn btn-outline-primary">
            <a onclick="modifyDiscipline()" style="color:inherit" role="button"> Модифицировать выбранную
                дисциплину </a>
        </button>

        <button type="button" class="btn btn-outline-primary">
            <a onclick="deleteDisciplines()" style="color:inherit" role="button">Удалить выбранные дисциплины </a>
        </button>

    </div>
</c:if>

<br>
</div>
<br>
<div class="container">
    <p> Список дисциплин.</p>
</div>

<div class="container">
    <div class="row">
        <div class="col-md-8">


            <table class="table table-striped">
                <thead>
                <tr>
                    <th></th>
                    <th>Наименование дисциплины</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${disces}" var="d" varStatus="i">

                    <tr>
                        <td>
                            <c:if test="${role eq 1}">
                                <input type="checkbox" value="${d.id}" name="checkboxdisc" id="cbx${i.count}"/>
                                <label for="cbx${i.count}"> </label>
                            </c:if>
                        </td>
                        <td>${d.discipline}</td>
                    </tr>

                </c:forEach>

                </tbody>
            </table>

        </div>
    </div>
</div>


<form id="formModifyingDiscipline" method="get" action="/discipline-modify">
    <input type="hidden" id="idModifyDisc" name="idModifyDisc" value="">
</form>


<form id="formDeleteDisciplines" method="post" action="/disciplines">
    <input type="hidden" id="idsDeleteDisc" name="idsDeleteDisc" value="">
</form>


