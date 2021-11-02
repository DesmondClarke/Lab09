<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="./sources/css/users.css"></link>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans&display=swap" rel="stylesheet"></link>
        <title>User Management</title>
    </head>
    <body>


        <div id="add_container">
            <form method="POST" action="" id="add_form">            
                <h2 id="add_title">Add User</h2>
                <div>
                    <input type="text" name="add_email" class="entry" required>
                    <label class="input_label">Email</label>
                </div>
                <div>
                    <input type="text" name="add_first_name" class="entry" required>
                    <label class="input_label">First Name</label>
                </div>
                <div>
                    <input type="text" name="add_last_name" class="entry" required>
                    <label class="input_label">Last Name</label>
                </div>
                <div>
                    <input type="text" name="add_password" class="entry" required>
                    <label class="input_label">Password</label>
                </div>
                <div>
                    <select name="add_user_type">
                        <option value="sys_admin">System Admin</option>
                        <option value="reg_user">Regular User</option>
                        <option value="comp_admin">Company Admin</option>
                    </select> 
                </div>
                <div>
                    <input type="submit" value="Save" id="add_save">
                    <input type="hidden" name="action" value="add_save">
                </div>
            </form>
        </div>



        <div id="manage_container">
            <h2 id="manage_title">Manage Users</h2>
            <div id='head_manage_users' class='header'>
                <span id='head_email'>Email</span>
                <span id='head_first_name'>First Name</span>
                <span id='head_last_name'>Last Name</span>
                <span id='head_role'>Role</span>
                <span id='head_status'>Status</span>
                <span id='head_edit'>Edit</span>
                <span id='head_delete'>Delete</span>
            </div>
            <div>
                <c:forEach var="user" items="${users}">
                        <div id="row_manage_users">
                            <span class='user_email'>${user.getEmail()}</span>
                            <span class='user_first_name'>${user.getFirstName()}</span>
                            <span class='user_last_name'>${user.getLastName()}</span>
                            <span class='user_role'>
                                <c:choose>
                                    <c:when test = "${user.getRole() == 1}">
                                        System Admin
                                    </c:when>
                                    <c:when test = "${user.getRole() == 2}">
                                        Regular User
                                    </c:when>
                                    <c:when test = "${user.getRole() == 3}">
                                        Company Admin
                                    </c:when>
                                </c:choose>
                            </span>
                            <span class='user_status'>
                                <c:choose>
                                    <c:when test = "${user.getActive()}">
                                        Active
                                    </c:when>
                                    <c:otherwise>
                                        Inactive
                                    </c:otherwise>
                                </c:choose>
                            </span>
                            <span class='user_edit'>
                                <form method="POST" action="">
                                    <input type="image" src="./sources/images/pencil.png" alt="Edit" width="15" height="15">
                                    <input type="hidden" name="action" value="edit_user">
                                    <input type="hidden" name="user_email" value="${user.getEmail()}">
                                </form>
                            </span>
                            <span class='user_delete'>
                                <form method="POST" action="">
                                    <input type="image" src="./sources/images/trash.png" alt="Delete" width="15" height="15">
                                    <input type="hidden" name="action" value="delete_user">
                                    <input type="hidden" name="user_email" value="${user.getEmail()}">
                                </form>
                            </span>
                        </div>
                </c:forEach>
            </div>
        </div>




        <div id="edit_container">
            <form method="POST" action="" id="edit_form">
                <h2 id="edit_title">Edit User</h2>
                <c:choose>
                    <c:when test="${edit_clicked}">
                        <div>
                            <input type="text" name="edit_email" class="entry readonly_box" value="${edit_email}" readonly>
                            <label class="input_label">Email</label>
                        </div>
                        <div>
                            <input type="text" name="edit_first_name" class="entry" value="${edit_first_name}" required>
                            <label class="input_label">First Name</label>
                        </div>
                        <div>
                            <input type="text" name="edit_last_name" class="entry" value="${edit_last_name}" required>
                            <label class="input_label">Last Name</label>
                        </div>
                        <div>
                            <input type="text" name="edit_password" class="entry" value="${edit_password}" required>
                            <label class="input_label">Password</label>
                        </div>
                        <div>
                            <span id="radio_head">User Status</span>
                            <input type="radio" id="active_status" name="status" value="active" checked>
                            <label for="active" >Active</label><br>
                            <input type="radio" id="inactive_status" name="status" value="inactive">
                            <label for="inactive">Inactive</label>
                        </div>
                        <div>
                            <select name="edit_user_type">
                                <option ${edit_user_type=="sys_admin"?"selected":""} value="sys_admin">System Admin</option>
                                <option ${edit_user_type=="reg_user"?"selected":""} value="reg_user">Regular User</option>
                                <option ${edit_user_type=="comp_admin"?"selected":""} value="comp_admin">Company Admin</option>
                            </select> 
                        </div>
                        <div>
                            <input type="submit" value="Save" id="edit_save">
                            <input type="hidden" name="action" value="edit_save">
                        </div>
                    </c:when>
                    <c:otherwise> 
                        <div id="inform">
                            Click the pencil icon to edit a user
                        </div>
                    </c:otherwise>
                </c:choose>
            </form>
        </div>
    </body>
</html>
