<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>

<nav aria-label="breadcrumb">
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="/">На главную</a></li>
        <li class="breadcrumb-item"><a href="/terms-list">Назад</a></li>
        <li class="breadcrumb-item active" aria-current="page">Создание семестра</li>
    </ol>
</nav>

Для создания семестра заполните следующие данные и нажмите кнопку "Создать".

<br>
<br>
<div>

    <form method="post" action="/terms-create" name="idSelectedDisciplines">


        <div class="form-group row">
            <label for="termName" class="col-sm-3 col-form-label">Название семестра</label>
            <div class="col-sm-9">
                <input type="text" class="form-control" id="termName" placeholder="Семестр 4"
                       name="termName">
            </div>
        </div>
        <div class="form-group row">
            <label for="duration" class="col-sm-3 col-form-label">Длительность</label>
            <div class="col-sm-9">
                <input type="text" class="form-control" id="duration" placeholder="10 недель"
                       name="duration">
            </div>
        </div>
        <div class="form-group">
            <label for="exampleFormControlSelect2">Дисциплины</label>
            <select multiple class="form-control" id="exampleFormControlSelect2">
                <c:forEach items="${disces}" var="d">
                    <option id="discId" value="${d.id}">${d.discipline}</option>
                </c:forEach>
            </select>
        </div>
        <input type="hidden" id="idSelectedDisciplines" name="idSelectedDisciplines" value="">
        <button type="submit" class="btn btn-primary" onclick="createTermWithSelectedDisciplines()">Создать</button>
    </form>
</div>