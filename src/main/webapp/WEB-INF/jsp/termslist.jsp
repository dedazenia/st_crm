<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>


<nav aria-label="breadcrumb">
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="/">На главную</a></li>
        <li class="breadcrumb-item active" aria-current="page">Семестры</li>
    </ol>
</nav>


<div class="container">

    <form class="form-inline">
        <label class="my-1 mr-2" for="selected">Семестр</label>
        <select class="custom-select my-1 mr-sm-2" type="text" id="selected">
            <c:forEach items="${terms}" var="t">
                <c:choose>
                    <c:when test="${t.id eq selectedTerm.id}">
                        <option selected>${t.name}</option>
                        <br/>
                    </c:when>
                    <c:otherwise>
                        <option>${t.name}</option>
                    </c:otherwise>
                </c:choose>

            </c:forEach>
        </select>


        <button type="submit" class="btn btn-primary my-1">Выбрать</button>
    </form>
</div>
<br>

<div class="container">
    <p> Длительность семестра  <b> ${selectedTerm.duration}</b></p>
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
                    <a href="termcreating.html" class="btn btn-primary btn-lg btn-block">Создать семестр</a>
                </div>
                <div class="p-2 bd-highlight">
                    <a href="termmodifying.html" class="btn btn-primary btn-lg btn-block">Модифицировать текущий
                        семестр</a>
                </div>
                <div class="p-2 bd-highlight">
                    <a href="#" class="btn btn-primary btn-lg btn-block">Удалить текущий семестр</a>
                </div>
            </div>
        </div>
    </div>
</div>
