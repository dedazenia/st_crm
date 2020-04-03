<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>

<div class="col-md-4">
    <form action="login" method="post">
        <div class="form-group">
            <label for="loginID">Login</label>
            <input class="form-control" id="loginID" name="login" placeholder="login">
        </div>
        <div class="form-group">
            <label for="passID">Password</label>
            <input type="password" class="form-control" id="passID" name="pass" placeholder="password">
        </div>
        <div class="form-group">
            <label for="roleID">Role</label>
            <select class="form-control" id="roleID" name="role">
                <option value="1">Администратор</option>
                <option value="2">Студент</option>
                <option value="3">Учитель</option>
            </select>
<%--            <button type="submit" class="btn btn-primary">Sign in</button>--%>
        </div>
        <button type="submit" class="btn btn-primary">Sign in</button>
        <c:if test="${errorMessage eq 1}">
            <div class="alert alert-danger" role="alert">
                <strong>Holy guacamole!</strong> Логин или пароль или роль не верны!!
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
        </c:if>
    </form>
</div>

