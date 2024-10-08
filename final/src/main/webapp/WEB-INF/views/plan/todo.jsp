<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	        
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" href="https://mdbcdn.b-cdn.net/wp-content/themes/mdbootstrap4/docs-app/css/dist/mdb5/standard/core.min.css">
    <link rel='stylesheet' id='roboto-subset.css-css'  href='https://mdbcdn.b-cdn.net/wp-content/themes/mdbootstrap4/docs-app/css/mdb5/fonts/roboto-subset.css?ver=3.9.0-update.5' type='text/css' media='all' />

	<style>
        #list1 .form-control {
            border-color: transparent;
        }
        #list1 .form-control:focus {
            border-color: transparent;
            box-shadow: none;
        }
        #list1 .select-input.form-control[readonly]:not([disabled]) {
          background-color: #fbfbfb;
        }

		.todo-list input.form-check-input{
			transform: scale(1.5) translateX(10px);
		}

		.todo-list i{
			color: rgb(246, 157, 157);
		}
    </style>
</head>
<body>
	<!-- 메뉴바 -->
	<jsp:include page="../common/menubar.jsp"/>
	<script>
		// 메뉴바에 클릭된 메뉴 하이라이트
		$(()=>{ $(".nav-header #menubar_plan").addClass("active"); })
		$(()=>{ $(".nav-header #menubar_todo").addClass("active"); })
	</script>

	<!-- 내용 -->
	<div id="fh5co-couple" class="fh5co-section-gray">
		<div class="container">
			<div class="row animate-box">
				<div class="col">
					<div class="card" id="list1" style="border-radius: .75rem; background-color: #eff1f2;">
						<div class="col-md-12 text-center heading-section" style="margin: 50px 0 0; padding-bottom: 0;">
							<h2>📋 커플 할일 리스트</h2>
						</div>

						<div class="card-body py-4 px-4 px-md-5 todo-list">
							<div class="pb-2">
								<div class="card">
									<div class="card-body">
										<div class="d-flex flex-row align-items-center">
											<input type="text" class="form-control form-control-lg" id="exampleFormControlInput1" placeholder="추가하고 싶은 내용을 입력하세요." style="font-size: 20px;">
											<a href="#!" data-mdb-tooltip-init title="Set due date" style="margin: 0 10px;">
												<i class="fas fa-calendar-alt fa-lg me-3"></i>
											</a>
											<div>
												<button  type="button" data-mdb-button-init data-mdb-ripple-init class="btn btn-primary" style="padding-left: 40px; padding-right:40px;">추가</button>
											</div>
										</div>
									</div>
								</div>

								<div class="d-flex justify-content-end align-items-center mb-4 pt-3 pb-3" style="border-bottom: 1px solid rgb(199, 199, 199);">
									<p class="small mb-0 me-2 text-muted">Filter</p>
									<select data-mdb-select-init style="padding: 5px; font-family: Katuri; font-size: 14px;">
										<option value="1">전체</option>
										<option value="2">완료</option>
										<option value="3">진행중</option>
									</select>

									<p class="small mb-0 ms-4 me-2 text-muted">Sort</p>
									<select data-mdb-select-init style="padding: 5px; font-family: Katuri; font-size: 14px;">
										<option value="1">생성일</option>
										<option value="2">목표일</option>
									</select>

									<a href="#!" style="color: rgb(246, 157, 157);" data-mdb-tooltip-init title="Ascending">
										<i class="fas fa-sort-amount-down-alt ms-2"></i>
									</a>
								</div>

								<!-- 여기서 부터 실제 todo 리스트!! -->

								<ul class="list-group list-group-horizontal rounded-0 bg-transparent">
									<li class="list-group-item d-flex align-items-center ps-0 pe-3 py-1 rounded-0 border-0 bg-transparent">
										<div class="form-check">
											<input class="form-check-input me-0" type="checkbox" value="" id="flexCheckChecked1" aria-label="..." checked/>
										</div>
									</li>
									<li class="list-group-item px-3 py-1 d-flex align-items-center flex-grow-1 border-0 bg-transparent">
										<p class="lead fw-normal mb-0">공용 계좌 만들기</p>
									</li>
									<li class="list-group-item ps-3 pe-0 py-1 rounded-0 border-0 bg-transparent">
										<div class="d-flex flex-row justify-content-end mb-1">
											<a href="#!" class="text-info" data-mdb-tooltip-init title="Edit todo"><i class="fas fa-pencil-alt me-3"></i></a>
											<a href="#!" class="text-danger" data-mdb-tooltip-init title="Delete todo"><i class="fas fa-trash-alt"></i></a>
										</div>
										<div class="text-end text-muted">
											<a href="#!" class="text-muted" data-mdb-tooltip-init title="Created date">
												<p class="small mb-0">생성: 2024-09-25</p>
											</a>
										</div>
									</li>
								</ul>

								<ul class="list-group list-group-horizontal rounded-0">
									<li class="list-group-item d-flex align-items-center ps-0 pe-3 py-1 rounded-0 border-0 bg-transparent">
										<div class="form-check">
											<input class="form-check-input me-0" type="checkbox" value="" id="flexCheckChecked2" aria-label="..." />
										</div>
									</li>
									<li class="list-group-item px-3 py-1 d-flex align-items-center flex-grow-1 border-0 bg-transparent">
										<p class="lead fw-normal mb-0">UsTwo 가입하기</p>
									</li>
									<li class="list-group-item px-3 py-1 d-flex align-items-center border-0 bg-transparent">
										<div class="py-2 px-3 me-2 border border-warning rounded-3 d-flex align-items-center bg-body-tertiary">
											<p class="small mb-0" style="font-family: Katuri; font-size: 14px;">목표: 28th Jun 2020</p>
										</div>
									</li>
									<li class="list-group-item ps-3 pe-0 py-1 rounded-0 border-0 bg-transparent">
										<div class="d-flex flex-row justify-content-end mb-1">
											<a href="#!" class="text-info" data-mdb-tooltip-init title="Edit todo"><i class="fas fa-pencil-alt me-3"></i></a>
											<a href="#!" class="text-danger" data-mdb-tooltip-init title="Delete todo"><i class="fas fa-trash-alt"></i></a>
										</div>
										<div class="text-end text-muted">
											<a href="#!" class="text-muted" data-mdb-tooltip-init title="Created date">
												<p class="small mb-0">생성: 2024-09-25</p>
											</a>
										</div>
									</li>
								</ul>

								<ul class="list-group list-group-horizontal rounded-0">
									<li class="list-group-item d-flex align-items-center ps-0 pe-3 py-1 rounded-0 border-0 bg-transparent">
										<div class="form-check">
											<input class="form-check-input me-0" type="checkbox" value="" id="flexCheckChecked2" aria-label="..." />
										</div>
									</li>
									<li class="list-group-item px-3 py-1 d-flex align-items-center flex-grow-1 border-0 bg-transparent">
										<p class="lead fw-normal mb-0">렌트카 예약하기</p>
									</li>
									<li class="list-group-item ps-3 pe-0 py-1 rounded-0 border-0 bg-transparent">
										<div class="d-flex flex-row justify-content-end mb-1">
											<a href="#!" class="text-info" data-mdb-tooltip-init title="Edit todo"><i class="fas fa-pencil-alt me-3"></i></a>
											<a href="#!" class="text-danger" data-mdb-tooltip-init title="Delete todo"><i class="fas fa-trash-alt"></i></a>
										</div>
										<div class="text-end text-muted">
											<a href="#!" class="text-muted" data-mdb-tooltip-init title="Created date">
												<p class="small mb-0">생성: 2024-09-25</p>
											</a>
										</div>
									</li>
								</ul>

								<ul class="list-group list-group-horizontal rounded-0 bg-transparent">
									<li class="list-group-item d-flex align-items-center ps-0 pe-3 py-1 rounded-0 border-0 bg-transparent">
										<div class="form-check">
											<input class="form-check-input me-0" type="checkbox" value="" id="flexCheckChecked1" aria-label="..."/>
										</div>
									</li>
									<li class="list-group-item px-3 py-1 d-flex align-items-center flex-grow-1 border-0 bg-transparent">
										<p class="lead fw-normal mb-0">공용 계좌 만들기</p>
									</li>
									<li class="list-group-item ps-3 pe-0 py-1 rounded-0 border-0 bg-transparent">
										<div class="d-flex flex-row justify-content-end mb-1">
											<a href="#!" class="text-info" data-mdb-tooltip-init title="Edit todo"><i class="fas fa-pencil-alt me-3"></i></a>
											<a href="#!" class="text-danger" data-mdb-tooltip-init title="Delete todo"><i class="fas fa-trash-alt"></i></a>
										</div>
										<div class="text-end text-muted">
											<a href="#!" class="text-muted" data-mdb-tooltip-init title="Created date">
												<p class="small mb-0">생성: 2024-09-25</p>
											</a>
										</div>
									</li>
								</ul>

								<ul class="list-group list-group-horizontal rounded-0">
									<li class="list-group-item d-flex align-items-center ps-0 pe-3 py-1 rounded-0 border-0 bg-transparent">
										<div class="form-check">
											<input class="form-check-input me-0" type="checkbox" value="" id="flexCheckChecked2" aria-label="..." />
										</div>
									</li>
									<li class="list-group-item px-3 py-1 d-flex align-items-center flex-grow-1 border-0 bg-transparent">
										<p class="lead fw-normal mb-0">UsTwo 가입하기</p>
									</li>
									<li class="list-group-item px-3 py-1 d-flex align-items-center border-0 bg-transparent">
										<div class="py-2 px-3 me-2 border border-warning rounded-3 d-flex align-items-center bg-body-tertiary">
											<p class="small mb-0" style="font-family: Katuri; font-size: 14px;">목표: 28th Jun 2020</p>
										</div>
									</li>
									<li class="list-group-item ps-3 pe-0 py-1 rounded-0 border-0 bg-transparent">
										<div class="d-flex flex-row justify-content-end mb-1">
											<a href="#!" class="text-info" data-mdb-tooltip-init title="Edit todo"><i class="fas fa-pencil-alt me-3"></i></a>
											<a href="#!" class="text-danger" data-mdb-tooltip-init title="Delete todo"><i class="fas fa-trash-alt"></i></a>
										</div>
										<div class="text-end text-muted">
											<a href="#!" class="text-muted" data-mdb-tooltip-init title="Created date">
												<p class="small mb-0">생성: 2024-09-25</p>
											</a>
										</div>
									</li>
								</ul>
								
								<ul class="list-group list-group-horizontal rounded-0">
									<li class="list-group-item d-flex align-items-center ps-0 pe-3 py-1 rounded-0 border-0 bg-transparent">
										<div class="form-check">
											<input class="form-check-input me-0" type="checkbox" value="" id="flexCheckChecked2" aria-label="..." />
										</div>
									</li>
									<li class="list-group-item px-3 py-1 d-flex align-items-center flex-grow-1 border-0 bg-transparent">
										<p class="lead fw-normal mb-0">렌트카 예약하기</p>
									</li>
									<li class="list-group-item ps-3 pe-0 py-1 rounded-0 border-0 bg-transparent">
										<div class="d-flex flex-row justify-content-end mb-1">
											<a href="#!" class="text-info" data-mdb-tooltip-init title="Edit todo"><i class="fas fa-pencil-alt me-3"></i></a>
											<a href="#!" class="text-danger" data-mdb-tooltip-init title="Delete todo"><i class="fas fa-trash-alt"></i></a>
										</div>
										<div class="text-end text-muted">
											<a href="#!" class="text-muted" data-mdb-tooltip-init title="Created date">
												<p class="small mb-0">생성: 2024-09-25</p>
											</a>
										</div>
									</li>
								</ul>
								
							</div>
						</div>
						
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- footer -->
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>