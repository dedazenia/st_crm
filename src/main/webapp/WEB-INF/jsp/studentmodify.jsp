<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>


<nav aria-label="breadcrumb">
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="/">На главную</a></li>
        <li class="breadcrumb-item"><a href="/students">Назад</a></li>
        <li class="breadcrumb-item active" aria-current="page">Изменение студента</li>
    </ol>
</nav>


<div class="container">Для модификации введите новые значения и нажмите кнопку "Применить".
</div>
<br>
<br>
<div class="container">
    <form action="/student-modify" method="post">
        <input type="hidden" name="idModifyStud" value="${studentos.id}">
        <div class="form-row">
            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <span class="input-group-text">Фамилия</span>
                </div>
                <input type="text" class="form-control" id="FName"
                       value="${studentos.name}"
                       name="lName">
            </div>
            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <span class="input-group-text">Имя</span>
                </div>
                <input type="text" class="form-control" id="Name"
                       value="${studentos.name}"
                       name="fName">
            </div>
            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <span class="input-group-text">Группа</span>
                </div>
                <input type="text" class="form-control" id="group"
                       value="${studentos.group}"
                       name="group">
            </div>
            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <span class="input-group-text">Дата поступления</span>
                </div>
                <input type="text" class="form-control" id="datepicker" value="${studentos.date}"
                       name="date">

            </div>
        </div>
        <button class="btn btn-primary" type="submit">Применить</button>
    </form>
</div>

