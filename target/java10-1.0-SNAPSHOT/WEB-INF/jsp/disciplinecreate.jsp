<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>

<nav aria-label="breadcrumb">
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="/">На главную</a></li>
        <li class="breadcrumb-item active" aria-current="page">Создание дисциплины</li>
    </ol>
</nav>

Для того чтобы создать новую дисциплину, заполните все поля и нажмите кновку "Создать".

<br>
<br>
<div>

    <form method="post" action="/discipline-create">
        <div class="form-row">
            <div class="col-md-4 mb-3">
                <label for="validationDefault01">Название</label>
                <input type="text" class="form-control" id="validationDefault01" name="discName" value="" required>
            </div>

        </div>


        <button class="btn btn-primary" type="submit">Создать</button>
    </form>
</div>