<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<title>:: HKL Mart ::</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="/resources//jquery/3.5.1/jquery.min.js"></script>
<script src="/resources//bootstrap/4.5.3/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/all.css" integrity="sha384-vp86vTRFVJgpjF9jiIGPEEqYqlDwgyBgEF109VFjmqGmIY/Y4HV4d3Gp2irVfcrp" crossorigin="anonymous">
<link rel="stylesheet" href="/resources/bootstrap/4.5.3/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/index.css">
<link rel="stylesheet" href="/resources/css/add-product.css">
</head>

<body>
	<!-- Header -->
	<header id="header" class="container-fluid">

		<!-- Navbar-->
		<nav class="navbar row">
			<div class="col-1"></div>
			<div class="navbar_logo col-1">
				<a class="logo" style="height: 100px;" href="/">
					<img class="logo" src="/resources/img/top_logo.png">
				</a>
			</div>

			<!-- Search -->
			<div class="navbar_search col-5">

				<div class="row form-inline">

					<div class="col-10">
						<input class="form-control active-pink" type="search" placeholder="Search" style="width: 50%; float: right;">
					</div>

					<div class="col-2">
						<a href="#" id="search">
							<i style="color: rgb(255, 48, 79);" class="fas fa-search fa-2x"></i>
						</a>
					</div>
				</div>
			</div>

			<!-- NavMenu -->
			<!-- 비로그인 상태 -->
			<sec:authorize access="isAnonymous()">
				<div class="col-4">
					<a class="navbar_toggleBtn">
						<i class="fas fa-bars"></i>
					</a>
					<br>
					<ul class="navbar_menu font-set">
						<li><a href="/member/loginPage">로그인</a></li>
						<li><a href="/member/loginPage">회원가입</a></li>
						<li><a href="#">고객센터</a></li>
						<li><a href="#">장바구니</a></li>
					</ul>
				</div>
			</sec:authorize>

			<!-- 로그인 상태 -->
			<sec:authorize access="isAuthenticated()">
				<sec:authentication property="principal" var="user" />
				<div class="col-4">
					<a class="navbar_toggleBtn">
						<i class="fas fa-bars"></i>
					</a>
					<br>
					<ul class="navbar_menu font-set">
						<li><a href="/member/my-page">
								<i>
									<u class="font-set">${user.memberName}님</u>
								</i>
							</a>
						<li><a href="/member/my-page">마이페이지</a></li>
						<li><a href="#" onclick="$('#logout-form').submit();">로그아웃</a> <!-- Logout Form -->
							<form id="logout-form" action="/logout" method="POST">
								<!-- 포스트방식으로 리퀘스트시 무조건 넣기 -->
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
							</form></li>
						<li><a href="#">고객센터</a></li>
						<li><a href="/member/my-page">장바구니</a></li>
					</ul>
				</div>
			</sec:authorize>

		</nav>
		<div class="col-1"></div>

		<!-- Mega Drop Menu -->
		<div class="row">
			<div class="col-1"></div>

			<div class="col-10">
				<ul class="menu" style="width: 100%;">
					<li><a href="#header">운동화</a>
						<div>
							<div class="menu-column">
								<ul>
									<li><a href="#">스니커즈</a></li>
									<li><a href="#">캔버스화</a></li>
									<li><a href="#">슬립온</a></li>
								</ul>
							</div>
						</div></li>
					<li><a href="#header">스포츠</a>
						<div>
							<div class="menu-column">
								<ul>
									<li><a href="#">런닝화</a></li>
									<li><a href="#">축구화</a></li>
									<li><a href="#">등산화</a></li>
								</ul>
							</div>
						</div></li>
					<li><a href="#header">구두</a>
						<div>
							<div class="menu-column">
								<ul>
									<li><a href="#">로퍼</a></li>
									<li><a href="#">레이스업</a></li>
									<li><a href="#">힐/펌프스</a></li>
									<li><a href="#">플랫슈즈</a></li>
								</ul>
							</div>
						</div></li>
					<li><a href="#header">부츠</a>
						<div>
							<div class="menu-column">
								<ul>
									<li><a href="#">첼시부츠</a></li>
									<li><a href="#">워크부츠</a></li>
									<li><a href="#">퍼부츠</a></li>
								</ul>
							</div>
						</div></li>
				</ul>
			</div>
		</div>

		<div class="col-1"></div>

		<br>
	</header>

	<!-- form header -->
	<form class="insertform" name="productData" action="/product/product-regist-up?${_csrf.parameterName}=${_csrf.token}" method="POST"  enctype="multipart/form-data">
		<div class="form-header">
			<h1>제품 등록</h1>
		</div>
		<!-- form body -->
		<div>
			<div class="record">
				<label>제품명 </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="text" class="formText" id="nameProduct" name="productName" />
			</div>
			<hr style="border: solid 1px #ffb6b6;">
			<div class="record">
				<label>브랜드 </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="text" class="formText" id="brandProduct" name="productBrand" />
			</div>
			<hr style="border: solid 1px #ffb6b6;">
			<div class="record">
				<label>제품 코드</label>&nbsp;&nbsp;
				<input type="text" class="formText" id="codeProduct" name="productCode" minlength="6" maxlength="6" placeholder="예시 코드 ex) AA0010" />
			</div>
			<hr style="border: solid 1px #ffb6b6;">
			<div class="record">
				<label>제품 가격</label>&nbsp;&nbsp;
				<input type="text" class="formText" id="priceProduct" name="productPrice" placeholder="주의사항) ,와 원 미입력 ex) 30000" //>
			</div>
			<hr style="border: solid 1px #ffb6b6;">
		</div>
		<div class="record">
			<label>제품 종류</label>&nbsp;&nbsp;
			<select class="formText" id="kindProduct" name="productType">
				<option value="1" name="none">- 세부코드를 선택하여주세요 -</option>
				<option value="1" name="none">-운동화 (10 ~ 29) -</option>
				<option value="11" name="productType">스니커즈 (11)</option>
				<option value="12" name="productType">캔버스화 (12)</option>
				<option value="13" name="productType">슬립온 (13)</option>

				<option value="1" name="none">-스포츠 (30 ~ 49) -</option>
				<option value="31" name="productType">런닝화 (31)</option>
				<option value="32" name="productType">축구화 (32)</option>
				<option value="33" name="productType">등산화 (33)</option>

				<option value="1" name="none">-구두 (50 ~ 69) -</option>
				<option value="51" name="productType">로퍼 (51)</option>
				<option value="52" name="productType">레이스업 (52)</option>
				<option value="53" name="productType">힐/펌프스 (53)</option>
				<option value="54" name="productType">플랫슈즈 (54)</option>

				<option value="1" name="none">-부츠 (70 ~ 99) -</option>
				<option value="71" name="productType">첼시부츠 (71)</option>
				<option value="72" name="productType">워크부츠 (72)</option>
				<option value="73" name="productType">퍼부츠 (73)</option>
			</select>
		</div>
		<hr style="border: solid 1px #ffb6b6;">
		<div class="record">
			<label>제품 설명</label>

		</div>
		<div>
			<textarea id="content" name="productContent" cols="90" row="10" style="border-color: #ffb6b6;"></textarea>

			<div class="form-group left">
				<label for="contentFile" class="fileTitle"></label>
				<input type="file" id="choose-file" name="uploadImg" accept=".bmp, .jpg, .jpeg, .png" size="80" style="margin-top: 10px; margin-bottom: 10px;" />
				<div id="select_img" style="width: 100%; text-align: center">
					<img src="" />
				</div>
			</div>
		</div>
		<hr style="border: solid 1px #ffb6b6;">
		<!-- 재고 등록 -->
		<label>사이즈별 재고 수량</label>
		<div style="margin-top: 10px; margin-bottom: 10px; background-color: rgb(241, 213, 234);">
			<label style="margin-left: 7px;">240</label>
			<input type="number" class="stockInt" name="stock240" value="0" min="0" step="1" />
			<label style="border-right: solid 3px #ffb6b6;">EA &nbsp;</label> <label style="margin-left: 7px;">245</label>
			<input type="number" class="stockInt" name="stock245" value="0" min="0" step="1">
			<label style="border-right: solid 3px #ffb6b6;">EA &nbsp;</label> <label style="margin-left: 7px;">250</label>
			<input type="number" class="stockInt" name="stock250" value="0" min="0" step="1" />
			<label style="border-right: solid 3px #ffb6b6;">EA &nbsp;</label> <label style="margin-left: 7px;">255</label>
			<input type="number" class="stockInt" name="stock255" value="0" min="0" step="1" />
			<label style="border-right: solid 3px #ffb6b6;">EA &nbsp;</label>
		</div>

		<hr style="border: thin 1px #ffb6b6">

		<div style="margin-top: 10px; margin-bottom: 10px; background-color: rgb(238, 226, 235);">
			<label style="margin-left: 7px;">260</label>
			<input type="number" class="stockInt" name="stock260" value="0" min="0" step="1" />
			<label style="border-right: solid 3px #ffb6b6;">EA &nbsp;</label> <label style="margin-left: 7px;">265</label>
			<input type="number" class="stockInt" name="stock265" value="0" min="0" step="1" />
			<label style="border-right: solid 3px #ffb6b6;">EA &nbsp;</label> <label style="margin-left: 7px;">270</label>
			<input type="number" class="stockInt" name="stock270" value="0" min="0" step="1" />
			<label style="border-right: solid 3px #ffb6b6;">EA &nbsp;</label> <label style="margin-left: 7px;">275</label>
			<input type="number" class="stockInt" name="stock275" value="0" min="0" step="1" />
			<label style="border-right: solid 3px #ffb6b6;">EA &nbsp;</label>
		</div>

		<hr style="border: thin 1px #ffb6b6">

		<div style="margin-top: 10px; margin-bottom: 10px; background-color: rgb(250, 248, 249);">
			<label style="margin-left: 7px;">280</label>
			<input type="number" class="stockInt" name="stock280" value="0" min="0" step="1" />
			<label style="border-right: solid 3px #ffb6b6;">EA &nbsp;</label> <label style="margin-left: 7px;">285</label>
			<input type="number" class="stockInt" name="stock285" value="0" min="0" step="1" />
			<label style="border-right: solid 3px #ffb6b6;">EA &nbsp;</label> <label style="margin-left: 7px;">290</label>
			<input type="number" class="stockInt" name="stock290" value="0" min="0" step="1" />
			<label style="border-right: solid 3px #ffb6b6;">EA &nbsp;</label> <label style="margin-left: 7px;">295</label>
			<input type="number" class="stockInt" name="stock295" value="0" min="0" step="1" />
			<label style="border-right: solid 3px #ffb6b6;">EA &nbsp;</label>
		</div>


		<hr style="border: solid 1px #ffb6b6;">
		<input type="button" class="insertBtn" onclick="insertCheckfn()" value="등록"/>
	</form>

	<br>
	<br>
	<hr style="border: solid 1px #ffb6b6;">
	
		<!-- Footer top -->
		<footer>
		<div class="row footer-top">

			<div class="col-4"></div>

			<div class="col-2 font-set text-left">
				<p>
					<span>고객센터</span><br> <span>080-1234-5678 · 1588-1234</span><br> <span>주소 : 서울특별시 종로구 청와대로 1</span>
				</p>
				<p>
					<span>월~금 9:00 ~ 12:00 / 13:00 ~ 18:00</span>
				</p>
				<p>
					<span>주말, 공휴일 휴무</span>
				</p>
			</div>

			<div class="col-3 font-set text-left">
				<p>
					<span>(주)에이치케이엘</span><br> <span>대표이사 : 한김이</span><br> <span>주소 : 서울특별시 종로구 청와대로 1</span>
				</p>
				<p>
					<span>사업자등록번호 : 111-11-11111</span> <br> <span>통신판매업신고 : 제 2020-서울종로구-1111호</span>
				</p>
				<p>
					<span>개인정보보호 책임자 : 홍길동</span> <br> <span>이메일 : hklmart@hkl.com</span>
				</p>
			</div>

			<div class="col-3"></div>

		</div>

		<hr>

		<!-- Footer bottom -->
		<div class="row footer-bottom">
			<p class="col-12 text-center">
				<a href="#header">
					<img src="/resources/img/bottom_logo.png">
				</a>
				<br> <br> 본 상품의 상품 이미지 저작권은 ㈜에이치케이엘에 있으며 내용의 무단복제를 금합니다. <br> COPYRIGHT Ⓒ HKL-MART CO,LTD. ALL RIGHTS RESERVED.
			</p>
		</div>
	</form>
</body>

<script>
    const toggleBtn = document.querySelector('.navbar_toggleBtn');
    const search = document.querySelector('.navbar_search');
    const menu = document.querySelector('.navbar_menu');


    toggleBtn.addEventListener('click', () => {
        search.classList.toggle('active');
        menu.classList.toggle('active');
    });
    
    $(document).ready(function(){
	    $('a[href^="#"]').on('click',function (e) {
	        e.preventDefault();

	        var target = this.hash;
	        var $target = $(target);

	        $('html, body').stop().animate({
	            'scrollTop': $target.offset().top
	        }, 900, 'swing', function () {
	            window.location.hash = target;
	        });
	    });
	});
    
    function insertCheckfn() {
    	
    	var productDataForm = document.productData;
    	
    	var productName = $("#nameProduct").val();
     	var productBrand = $("#brandProduct").val();     	
        var codeProduct = $("#codeProduct").val();        
        var priceProduct = $("#priceProduct").val();        
        var kindProduct = $("#kindProduct").val();
        var productContent = $("#content").val();
        var image = $("#choose-file").val();
        
        var checkCode = /^[A-za-z0-9]{1,6}/;
        var checkprice = /^[0-9]+$/;

		if(productName === '' || productName === null || productName === undefined || productName === 0 || productName === NaN){
			alert("제품명을 입력하세요");
    	} 
		else if (productBrand === '' || productBrand === null || productBrand === undefined || productBrand === 0 || productBrand === NaN) {
            alert("브랜드명을 입력하세요");
        } 
		else if (!checkCode.test(codeProduct)) {
            alert("제품코드를 잘못입력하였습니다");
        } 
		else if (!codeProduct.length == 6) {
            alert("제품코드 자릿수 형식이 다릅니다");
        } 
		else if (!checkprice.test(priceProduct)) {
            alert("가격 형식에 문제가 있습니다. 숫자만 입력하여 주십시오");
        } 
		else if (kindProduct == 1) {
            alert("제품종류를 잘못선택하였습니다");
        }
		else if (productContent === '' || productContent === null || productContent === undefined || productContent === 0 || productContent === NaN) {
            alert("제품 설명을 입력하세요");
        } 
		else if (image === '' || image === null || image === undefined || image === 0 || image === NaN) {
            alert("제품 이미지를 등록하세요");
        } 
		else {
			alert("등록하였습니다");
			productDataForm.submit();	
        }
    }
    
    function checkImage(fileName, fileSize){
    	var imageExtension = /([^\s]+(?=\.(jpg|jpeg|png|bmp|JPG|JPEG|PNG|BMP))\.\2)/
    	if (!imageExtension.test(fileName)) {
            alert("이미지만 등록 가능합니다");
            document.getElementById("choose-file").value = "";
            return false;
        } 
    	if (fileSize >= 3145728) {
           	alert("이미지 크기가 너무 큽니다");
           	document.getElementById("choose-file").value = "";
           	return false;
        }
    	return true;
    }
    
    $("#choose-file").change(function(){
    	var file = document.getElementById("choose-file");
    	var filePath = file.value;
    	var filePathSplit = filePath.split('\\'); 
    	var filePathLength = filePathSplit.length;
    	var fileName = filePathSplit[filePathLength-1];
    	var fileSize = file.files[0].size;
    	
    	if (checkImage(fileName, fileSize)) {
			if(this.files && this.files[0]) {
	 	    	var reader = new FileReader;
	 	    	reader.onload = function(data) {
	 	    		$("#select_img img").attr("src", data.target.result).width(300).height(300);        
	 	    	}
	 	   		reader.readAsDataURL(this.files[0]);
	 	    }
		}else {
			document.getElementById("choose-file").value = "";
		}
    });
    
</script>

</html>