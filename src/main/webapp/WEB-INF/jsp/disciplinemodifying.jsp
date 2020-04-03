<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>


<div>
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="/">На главную</a></li>
            <li class="breadcrumb-item"><a href="/disciplines">Назад</a></li>
            <li class="breadcrumb-item active" aria-current="page">Редактирование дисциплины</li>
        </ol>
    </nav>
</div>

<div>

    <div>
        Для того чтобы модифицировать дисциплину, введите новое значение поля и нажмите кнопку "Применить".
    </div>
    <br>
    <br>
    <form method="post" action="/discipline-modify">
        <div class="form-row">
            <input type="hidden" name="idModifyDisc" value="${disc.id}">
            <div class="col-md-4 mb-3">
                <label for="name">Название</label>
                <input type="text" class="form-control" name="modifyDisc" id="name" value="${disc.discipline}" required>
            </div>

        </div>


        <button class="btn btn-primary" type="submit">Применить</button>
    </form>
</div>
