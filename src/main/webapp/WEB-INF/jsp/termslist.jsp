<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>


<nav aria-label="breadcrumb">
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="/">На главную</a></li>
        <li class="breadcrumb-item active" aria-current="page">Семестры</li>
    </ol>
</nav>


<div class="form-group col-sm-3">
    <select type="text" id="select1" class="form-control">
        <c:forEach items="${terms}" var="t">
            <c:choose>
                <c:when test="${t.id eq selectedTerm.id}">
                    <option id="opt2" value="${t.id}" selected>${t.name}</option>
                </c:when>
                <c:otherwise>
                    <option id="opt2" value="${t.id}">${t.name}</option>
                </c:otherwise>
            </c:choose>

        </c:forEach>
    </select>

    <button onclick="selectTermOnTermsList()" id="btn" class="btn btn-primary my-1">
        Выбрать
    </button>
</div>


<br>

<div class="container">
    <p> Длительность семестра <b> ${selectedTerm.duration}</b></p>
</div>
<div class="container">
    Список дисциплин семестра
</div>

<div class="container">
    <div class="row">
        <div class="col-md-4">

            <table class="table">
                <thead class="thead-dark">
                <tr>
                    <th scope="col">Наименование дисциплины</th>

                </tr>
                </thead>
                <tbody>
                <c:forEach items="${selectedTerm.disciplines}" var="d">
                    <tr>
                        <th scope="row"> ${d.discipline}</th>
                    </tr>

                </c:forEach>

                </tbody>
            </table>

        </div>
        <div class="col-md-4 offset-md-3">
            <div class="btn-group-vertical">
                <div class="p-2 bd-highlight">
                    <a href="/terms-create" class="btn btn-primary btn-lg btn-block">Создать семестр</a>
                </div>
                <div class="p-2 bd-highlight">
                    <a onclick="modifySelectTerm()" class="btn btn-primary btn-lg btn-block" role="button">Модифицировать
                        текущий
                        семестр</a>
                </div>
                <div class="p-2 bd-highlight">
                    <a onclick="deleteSelectTerm()" class="btn btn-primary btn-lg btn-block">Удалить текущий семестр</a>
                </div>
            </div>
        </div>
    </div>
</div>

<form id="selectTerm" method="get" action="/terms-list">
    <input type="hidden" id="idTerm" name="idTerm" value="">
</form>
<form id="delSelectTerm" method="post" action="/terms-list">
    <input type="hidden" id="idDelTerm" name="idDelTerm" value="">
</form>
<<form id="formModifyingTerm" method="get" action="/terms-modify">
<input type="hidden" id="idsOldDisciplines" name="idsOldDisciplines" value="">
<input type="hidden" id="idModifyTerm" name="idModifyTerm" value="">

</form>