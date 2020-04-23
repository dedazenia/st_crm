<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<nav aria-label="breadcrumb">
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="/">На главную</a></li>
        <li class="breadcrumb-item"><a href="studentslistadmin.html">Назад</a></li>
        <li class="breadcrumb-item active" aria-current="page">Создание студента</li>
    </ol>
</nav>

<%--<div class="form-group row">--%>
<%--    <label for="datepicker" class="col-sm-4 col-form-label">Дата зачисления</label>--%>
<%--    <div class="col-sm-8">--%>
<%--        <c:set var="now" value="<%= new java.util.Date() %>"/>--%>
<%--        <input type="text" class="form-control" id="datepicker"--%>
<%--               value="<fmt:formatDate value="${now}" pattern="MM/dd/yyyy"/>"--%>
<%--               name="date">--%>
<%--    </div>--%>
<%--</div>--%>


<div class="container">Для создания студента заполните следующие данные и нажмите кнопку "Создать".
</div>
<br>
<br>
<div class="container">
    <form action="/student-create" method="post">
        <div class="form-row">
            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <span class="input-group-text">Фамилия</span>
                </div>
                <input type="text" class="form-control" id="surname" name="lName" placeholder="Петров"
                       aria-label="Name">
            </div>
            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <span class="input-group-text">Имя</span>
                </div>
                <input type="text" class="form-control" id="name" name="fName" placeholder="Игорь"
                       aria-label="Familyname">
            </div>
            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <span class="input-group-text">Группа</span>
                </div>
                <input type="text" class="form-control" id="group" name="group" placeholder="111" aria-label="Group">
            </div>
            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <span class="input-group-text">Дата поступления</span>
                </div>
                <input type="text" class="form-control" id="datepicker" name="date" placeholder="04/09/2020"
                       aria-label="Date">

            </div>
        </div>
        <button class="btn btn-primary" type="submit">Создать</button>
    </form>
</div>


