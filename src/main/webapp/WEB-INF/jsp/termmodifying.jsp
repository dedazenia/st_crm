<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>

<nav aria-label="breadcrumb">
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="/">На главную</a></li>
        <li class="breadcrumb-item"><a href="/terms-list">Назад</a></li>
        <li class="breadcrumb-item active" aria-current="page">Модифицирование семестра</li>
    </ol>
</nav>

Для модификации семестра отредактируйте данные и нажмите кнопку "Применить".

<br>
<br>
<div>

    <form action="/terms-modify" method="post" name="modifyTerm" onclick="rememberNewDisciplines()">
        <div class="form-group row">
            <label for="termName" class="col-sm-3 col-form-label">Название семестра</label>
            <div class="col-sm-9">
                <input type="hidden" id="termId" name="termId" value="${term.id}">
                <input type="text" class="form-control" id="termName"
                       name="termName" value="${term.name}">
            </div>
        </div>
        <div class="form-group row">
            <label for="duration" class="col-sm-3 col-form-label">Длительность</label>
            <div class="col-sm-9">
                <input type="text" class="form-control" id="duration" placeholder="10 недель"
                       name="duration" value="${term.duration}">
            </div>
        </div>
        <div class="form-group">
            <label for="exampleFormControlSelect2">Дисциплины</label>
            <select multiple class="form-control" id="exampleFormControlSelect2">
                <c:forEach items="${disc}" var="d">
                    <c:if test="${d.flag == 1}">
                        <option id="discId" value="${d.id}" selected>${d.discipline}</option>
                    </c:if>
                    <c:if test="${d.flag !=1}">
                        <option id="discId" value="${d.id}">${d.discipline}</option>
                    </c:if>
                </c:forEach>
            </select>
        </div>
        <input type="hidden" id="idOldDisciplines" name="idOldDisciplines" value="${idsOldDisc}">
        <input type="hidden" id="idNewDisciplines" name="idNewDisciplines" value="">
        <button type="submit" class="btn btn-primary" onclick="createTermWithSelectedDisciplines()">
            Применить
        </button>
    </form>
</div>