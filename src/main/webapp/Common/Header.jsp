<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
.custom-img {
        width: 80px; /* chiều rộng mong muốn */
        height: auto; /* chiều cao tự động điều chỉnh để giữ tỷ lệ */
        
    }
  .tm-hero {
        position: relative;
        width: 100%; /* Đảm bảo phần tử tm-hero chiếm toàn bộ chiều rộng của phần tử cha */
        height: 300px; /* Điều chỉnh chiều cao của phần tử tm-hero theo ý muốn */
        overflow: hidden; /* Ẩn nội dung video vượt ra ngoài khu vực giới hạn của tm-hero */
    }
    .tm-hero video {
        position: absolute; /* Đảm bảo video được căn chỉnh theo phần tử tm-hero */
        width: 100%; /* Video sẽ chiếm toàn bộ chiều rộng của tm-hero */
        height: 100%; /* Video sẽ chiếm toàn bộ chiều cao của tm-hero */
        object-fit: cover; /* Đảm bảo video sẽ trải đều để chiếm toàn bộ phần tử tm-hero */
    }
</style>
<nav class="navbar navbar-expand-lg" style="background-color: black;">
	<div class="container-fluid">
		<a class="navbar-brand" style="color: #ADFF2F;
;" href="<c:url value='/index' />"> 
    <img alt="" src="<c:url value='/Template/User/img/icon.png'/>" class="custom-img">
    OnFlim
</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<i class="fas fa-bars"></i>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav ml-auto mb-2 mb-lg-0">
				<c:choose>
					<c:when test="${not empty sessionScope.currentUser}">
						<li class="nav-item"><a class="nav-link nav-link-1"
							data-toggle="modal" data-target="#changePassModal"
							aria-current="page" href="">Welcome,${sessionScope.currentUser.username}</a>
						</li>
						<li class="nav-item"><a class="nav-link nav-link-1"
							href="favorites">My Favourites</a></li>
						<li class="nav-item"><a class="nav-link nav-link-1"
							href="history">History</a></li>
						<c:if test = "${sessionScope.currentUser.getIsAdmin() == true}">
							<li class="nav-item"><a class="nav-link nav-link-1"
								href="http://localhost:8080/Asm-Java4/admin">Statistical</a></li>
						</c:if>
						<li class="nav-item"><a class="nav-link nav-link-1"
							href="logout">Log out</a></li>
					</c:when>
					<c:otherwise>
						<li class="nav-item"><a class="nav-link nav-link-1"
							href="forgotPass">Forgot Password</a></li>
						<li class="nav-item"><a class="nav-link nav-link-1"
							href="login">Login</a></li>
						<li class="nav-item"><a class="nav-link nav-link-1"
							href="register">Register</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
	</div>
</nav>
<div class="tm-hero mt-4" data-parallax="scroll">
    <video autoplay muted loop id="tm-video">
        <source src="<c:url value='/Template/User/video/bgr2.mp4'/>" type="video/mp4">
    </video>
</div>

<!-- Modal -->
<div class="modal fade" id="changePassModal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title text-center" id="exampleModalLabel">Change Password</h5>
				<button type="button" class="close btn btn-danger rounded-pill"
					data-dismiss="modal" aria-label="Close">X</button>
			</div>
			<div class="modal-body">
			<div class="form-control ">
				<input type="password" name="currentPass" id="currentPass" class="form-control rounded-pill" placeholder="Current Password?" required> 
			</div>
			<br> 
			<div class="form-control">
				<input type="password" name="newPass" id="newPass" class="form-control rounded-pill" placeholder="New Password?" required>
			</div>
			<h5 style="color:red" class="text-center" id="messageChangePass"></h5>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary rounded-pill" data-dismiss="modal">Close</button>
				<button type="button" class="btn btn-primary rounded-pill" id="changePassBtn">Save changes</button>
			</div>
		</div>
	</div>
</div>
 </div>