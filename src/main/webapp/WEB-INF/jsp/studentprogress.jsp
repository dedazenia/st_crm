<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>


<nav aria-label="breadcrumb">
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="/">На главную</a></li>
        <li class="breadcrumb-item"><a href="/students">Назад</a></li>
        <li class="breadcrumb-item active" aria-current="page">Успеваемость студента</li>
    </ol>
</nav>


<div class="col-md-8">
    <div class="container">
        <div class="row">
            <div class="col-md-1"></div>
            <div class="col-md-10">
                <h3>Отображена успеваемость для следующего студента:</h3>

                <table class="table">
                    <thead class="thead-dark">
                    <tr>
                        <th>Фамилия</th>
                        <th>Имя</th>
                        <th>Группа</th>
                        <th>Дата зачисления</th>
                    </tr>
                    </thead>
                    <tr>
                        <input type="hidden" name="idModifyStud" value="${studentos.id}">
                        <Th>${studentos.name}</Th>
                        <Th>${studentos.surname}</Th>
                        <Th>${studentos.group}</Th>
                        <th>${studentos.date}</th>
                    </tr>
                </table>
            </div>
        </div>
    </div>
    <br>
    <div class="container">
        <div class="row">
            <div class="col-md-1"></div>
            <div class="col-md-6">
                <table class="table">
                    <thead class="thead-dark">
                    <tr>
                        <th>Дисциплина</th>
                        <th>Оценка</th>
                    </tr>
                    </thead>
                    <c:forEach items="${markes}" var="m">
                        <tr>
                            <Th>${m.discipline}</Th>
                            <Th>${m.graduate}</Th>
                        </tr>
                    </c:forEach>
                </table>
            </div>
            <div class="col-md-4">
                <section>
                    <div id="titleTermsList" class="row">
                        <div class="form">
                            <div class="form-row">
                                <div id="divFormTitle" class="form-group col-sm-4">
                                    <h5>Выбрать семестр:</h5>
                                </div>
                                <div class="form-group col-sm-3">
                                    <select type="text" id="select1" class="form-control">
                                        <c:forEach items="${terms}" var="t">
                                            <c:choose>
                                                <c:when test="${t.id eq selectedTerm.id}">
                                                    <option id="opt1" value="${t.id}"
                                                            selected>${t.name}</option>
                                                </c:when>
                                                <c:otherwise>
                                                    <option id="opt1" value="${t.id}">${t.name}</option>
                                                </c:otherwise>
                                            </c:choose>

                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="form-group col-sm-3">
                                    <button onclick="selectTerm()" id="btn"
                                            class="btn btn-outline-secondary">
                                        Выбрать
                                    </button>
                                </div>
                            </div>
                            <div id="divDurationTerm" class="row">
                                <h5>
                                    <div class="col-sm-12">Длительность семестра:
                                        <b>${selectedTerm.duration}</b>
                                    </div>
                                </h5>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </div>
    </div>
</div>


<%--<div class="container">--%>
<%--    <p>Отображена успеваемость для следующего студента</p>--%>

<%--    <div class="row">--%>
<%--        <table class="table table-striped">--%>
<%--            <thead>--%>
<%--            <tr>--%>
<%--                <th>Фамилия</th>--%>
<%--                <th>Имя</th>--%>
<%--                <th>Группа</th>--%>
<%--                <th>Дата поступления</th>--%>
<%--            </tr>--%>
<%--            </thead>--%>
<%--            <tbody>--%>
<%--            <tr>--%>
<%--                <input type="hidden" name="idModifyStud" value="${studentos.id}">--%>
<%--                <Th>${studentos.name}</Th>--%>
<%--                <Th>${studentos.surname}</Th>--%>
<%--                <Th>${studentos.group}</Th>--%>
<%--                <th>${studentos.date}</th>--%>

<%--            </tr>--%>
<%--            </tbody>--%>
<%--        </table>--%>
<%--    </div>--%>
<%--</div>--%>

<%--<br>--%>
<%--</div>--%>


<%--<div class="container">--%>
<%--    <div class="row">--%>
<%--        <div class="col-md-4">--%>

<%--            <table class="table">--%>
<%--                <thead class="thead-dark">--%>
<%--                <tr>--%>
<%--                    <th scope="col">Наименование дисциплины</th>--%>
<%--                    <th scope="col">Оценка</th>--%>

<%--                </tr>--%>
<%--                </thead>--%>
<%--                <tbody>--%>
<%--                <c:forEach items="${markes}" var="m">--%>
<%--                    <tr>--%>
<%--                        <Th>${m.discipline}</Th>--%>
<%--                        <Th>${m.graduate}</Th>--%>
<%--                    </tr>--%>
<%--                </c:forEach>--%>
<%--                </tbody>--%>
<%--            </table>--%>

<%--        </div>--%>
<%--        <div class="col-md-4 offset-md-3">--%>

<%--            <form class="form-inline">--%>
<%--                <label class="my-1 mr-2" for="select1">Семестр</label>--%>
<%--                <select type="text" id="select1" class="form-control">--%>
<%--                    <c:forEach items="${terms}" var="t">--%>
<%--                        <c:choose>--%>
<%--                            <c:when test="${t.id eq selectedTerm.id}">--%>
<%--                                <option id="opt1" value="${t.id}"--%>
<%--                                        selected>${t.name}</option>--%>
<%--                            </c:when>--%>
<%--                            <c:otherwise>--%>
<%--                                <option id="opt1" value="${t.id}">${t.name}</option>--%>
<%--                            </c:otherwise>--%>
<%--                        </c:choose>--%>

<%--                    </c:forEach>--%>
<%--                </select>--%>


<%--                <button onclick="selectTerm()" type="submit" class="btn btn-primary my-1">Выбрать</button>--%>
<%--            </form>--%>

<%--            <br>--%>
<%--            <br>--%>
<%--            <div id="divDurationTerm" class="row">--%>
<%--                <h5>--%>
<%--                    <div class="col-sm-12">Длительность семестра:--%>
<%--                        <b>${selectedTerm.duration}</b>--%>
<%--                    </div>--%>
<%--                </h5>--%>
<%--            </div>--%>


<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>

<form id="selectTerm" method="get" action="/student-progress">
    <input type="hidden" id="idTerm" name="idTerm" value="">
    <input type="hidden" id="idSt" name="idSt" value="">
</form>

