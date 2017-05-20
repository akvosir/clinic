<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Site.aspx.cs" Inherits="ClinicSite.Site" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
	<title>Clinic without queue</title>
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,700italic,400,700,300&amp;subset=latin,latin-ext' rel='stylesheet' type='text/css'>
	<link href='http://fonts.googleapis.com/css?family=Raleway:700,400,300' rel='stylesheet' type='text/css'>
    <link href="css/bootstrap-combined.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" media="screen" href="css/bootstrap-datetimepicker.min.css">

		<!-- Font Awesome CSS -->
	<link href="css/font-awesome/font-awesome/css/font-awesome.css" rel="stylesheet">

		<!-- Plugins -->
	<link href="css/css/animations.css" rel="stylesheet">

	<link href="css/style.css" rel="stylesheet">

		<!-- Custom css --> 
	<link href="css/css/custom.css" rel="stylesheet">
</head>
<body class="no-trans">
		<!-- scrollToTop -->
		<!-- ================ -->
		

		<!-- header start -->
		<!-- ================ --> 
		<header class="header fixed clearfix navbar navbar-fixed-top">
			<div class="container">
				<div class="row">
					<div class="col-md-4">

						<!-- header-left start -->
						<!-- ================ -->
						<div class="header-left clearfix">

							<!-- logo -->
							<div class="logo smooth-scroll">
								<a href="#banner"><img id="logo" src="" alt="Лого"></a>
							</div>

							<!-- name-and-slogan -->
							<div class="site-name-and-slogan smooth-scroll">
								<div class="site-name"><a href="#banner">Районна поліклініка</a></div>
							</div>

						</div>
						<!-- header-left end -->

					</div>
					<div class="col-md-8">

						<!-- header-right start -->
						<!-- ================ -->
						<div class="header-right clearfix">

							<!-- main-navigation start -->
							<!-- ================ -->
							<div class="main-navigation animated">

								<!-- navbar start -->
								<!-- ================ -->
								<nav class="navbar navbar-default" role="navigation">
									<div class="container-fluid">

										

										<!-- Collect the nav links, forms, and other content for toggling -->
										<div class="collapse navbar-collapse scrollspy smooth-scroll" id="navbar-collapse-1">
											<ul class="nav navbar-nav navbar-right">
												<li class="active"><a href="#banner">Головна</a></li>
												<li><a href="#services">Лікарі</a></li>
												<li><a href="#contact">Контакти</a></li>
												<li ><a class="overlay-container" data-toggle="modal" data-target="#room">Кабінет</a></li>
												<div class="modal fade" id="room" style="z-index:99999" role="dialog" aria-labelledby="project-2-label" aria-hidden="true">
													<div class="modal-dialog">
														<div class="modal-content">
															<div class="modal-header">
																<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Закрити</span></button>
																<h4 class="modal-title" id="project-2-label">Кабінет</h4>
															</div>
															<div class="modal-body">
																<form role="form" id="footer-form">
																	<div class="form-group has-feedback">
																		<label class="sr-only" for="phone">Телефон</label>
																		<input type="text" class="form-control" id="phone" placeholder="Телефон" name="phone" required>
																	</div>
																	<div class="form-group has-feedback">
																		<label class="sr-only" for="password">Пароль</label>
																		<input type="password" class="form-control" id="password" placeholder="Введіть пароль" name="password" required>
																	</div>
																	<input type="submit" value="Ввійти" class="btn btn-default">
																	<div class="form-group has-feedback">
																		<label for="text">Забули пароль?</label>
																	</div>
																</form>
															</div>
														</div>
													</div>
												</div>
											</ul>
										</div>

									</div>
								</nav>
								<!-- navbar end -->

							</div>
							<!-- main-navigation end -->

						</div>
						<!-- header-right end -->

					</div>
				</div>
			</div>
		</header>

<div id="banner" class="banner">
			<div class="banner-image"></div>
			<div class="banner-caption">
				<div class="container">
					<div class="row">
						<div class="col-md-8 col-md-offset-2 object-non-visible" data-animation-effect="fadeIn">
						    <form class = "text-center">
						        <button class="btn btn-default" >
									<a class="overlay-container" data-toggle="modal" data-target="#Visit">Записатися на прийом</a>
								</button>
								<div class="modal fade" id="Visit" tabindex="-1" role="dialog" aria-labelledby="project-2-label" aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Закрити</span></button>
												<h4 class="modal-title" id="project-2-label">Записатися на прийом</h4>
											</div>
											<div class="modal-body">
												<h5 class="text-center">Для того, щоб записатися на прийом, Вам необхідно ввійти у Кабінет</h5>
												<button class="btn btn-default">
													<a class="overlay-container"  data-toggle="modal" data-target="#room">Перейти в кабінет</a>
												</button>
												<a class="overlay-container" data-toggle="modal" data-target="#FirstTime"><h6 class="text-center">Вперше на сайті?</h6></a>
											</div>
										</div>
									</div>
								</div>
								<div class="modal fade" id="FirstTime" tabindex="-1" role="dialog" aria-labelledby="project-2-label" aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Закрити</span></button>
												<h4 class="modal-title" id="project-2-label">Реєстрація</h4>
											</div>
											<div class="modal-body">
												<form role="form" id="footer-form">
													<div class="form-group has-feedback">
														<label class="sr-only" for="1name">Призвище</label>
														<input type="text" class="form-control" id="1name" placeholder="Призвище" name="1name" required>
														<i class="fa fa-user form-control-feedback"></i>
													</div>
													<div class="form-group has-feedback">
														<label class="sr-only" for="2name">Ім'я</label>
														<input type="text" class="form-control" id="2name" placeholder="Ім'я" name="2name" required>
														<i class="fa fa-user form-control-feedback"></i>
													</div>
													<div class="form-group has-feedback">
														<label class="sr-only" for="3name">Побатькові</label>
														<input type="text" class="form-control" id="3name" placeholder="Побатькові" name="3name" required>
														<i class="fa fa-user form-control-feedback"></i>
													</div>
													<div class="form-group has-feedback">
														<label class="sr-only" for="phone">Дата народження</label>
														<input type="data" class="form-control" id="date" placeholder="дд.мм.рр." name="date" required>
													</div>
													<div class="form-group has-feedback">
														<label class="sr-only" for="phone">Телефон</label>
														<input type="text" class="form-control" id="phone" placeholder="+38 (ХХХ) ХХХ-ХХ-ХХ" name="phone" required>
														<i class="fa fa-phone form-control-feedback"></i>
													</div>
													<div class="form-group has-feedback">
															<label class="sr-only" for="email2">Пошта</label>
															<input type="email" class="form-control" id="email2" placeholder="Введіть пошту" name="email2" required>
															<i class="fa fa-envelope form-control-feedback"></i>
													</div>
													<div class="form-group has-feedback">
															<label for="checkbox">Я згоден на обробку особистих даних</label>
															<input type="checkbox" id="checkbox" name="checkbox">
													</div>
													<input type="submit" value="Отримати пароль" class="btn btn-default">
												</form>
											</div>
										</div>
									</div>
								</div>

								
						    </form>
							<h1 class="text-center">Назва клініки</h1>
							<p class="lead text-center">Короткий опис клініки.</p>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- banner end -->
        

		<!-- section start -->
		<!-- ================ -->
		<div class="section">
			<div class="container">
				<h1 class="text-center title" id="services">Наші лікарі</h1>
				<div class="separator"></div>
				<p class="lead text-center">Тут ви можете ознайомитися з інформацією про наших фахівців<br> та обрати саме Вашого лікаря.</p>
				<br>			
				<div class="row object-non-visible" data-animation-effect="fadeIn">
					<div class="col-md-12">

						<!-- isotope filters start -->
						<div class="filters text-center">
							<ul class="nav nav-pills">
								<li class="active"><a href="#" data-filter="*">Всі лікарі</a></li>
								<li><a href="#" data-filter=".therapeutic">Лікарі</a></li>
								<li><a href="#" data-filter=".chief">Головний лікар</a></li>
								<li><a href="#" data-filter=".manager">Завідуючий відділення</a></li>
							</ul>
						</div>
						<!-- isotope filters end -->

							<div class="col-sm-6 col-md-3 isotope-item chief">
								<div class="image-box">
									<div class="overlay-container">
										<img src="assets/doctor2.jpg" alt="">
										<a class="overlay" data-toggle="modal" data-target="#project-2">
											<i class="fa fa-search-plus"></i>
											<span>Офтальмолог</span>
										</a>
									</div>
									<a class="btn btn-default btn-block" data-toggle="modal" data-target="#project-2">Інформація</a>
								</div>
								<!-- Modal -->
								<div class="modal fade" id="project-2" tabindex="-1" role="dialog" aria-labelledby="project-2-label" aria-hidden="true">
									<div class="modal-dialog modal-lg">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Закрити</span></button>
												<h4 class="modal-title" id="project-2-label">Інформація</h4>
											</div>
											<div class="modal-body">
												<h3>Інформація про лікаря</h3>
												<div class="row">
													<div class="col-md-6">
														<p>Другий лікар</p>
													</div>
													<div class="col-md-6">
														<img src="assets/doctor2.jpg" alt="">
													</div>
												</div>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-sm btn-default" data-dismiss="modal">Закрити</button>
											</div>
										</div>
									</div>
								</div>
								<!-- Modal end -->
							</div>
							
							<div class="col-sm-6 col-md-3 isotope-item 	therapeutic">
								<div class="image-box">
									<div class="overlay-container">
										<img src="assets/doctor4.jpg" alt="">
										<a class="overlay" data-toggle="modal" data-target="#project-3">
											<i class="fa fa-search-plus"></i>
											<span>Терапевт</span>
										</a>
									</div>
									<a class="btn btn-default btn-block" data-toggle="modal" data-target="#project-3">Інформація</a>
								</div>
								<!-- Modal -->
								<div class="modal fade" id="project-3" tabindex="-1" role="dialog" aria-labelledby="project-3-label" aria-hidden="true">
									<div class="modal-dialog modal-lg">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Закрити</span></button>
												<h4 class="modal-title" id="project-3-label">Інформація</h4>
											</div>
											<div class="modal-body">
												<h3>Інформація про лікаря</h3>
												<div class="row">
													<div class="col-md-6">
														<p>Інформація про лікаря<p>
													</div>
													<div class="col-md-6">
														<img src="assets/doctor4.jpg" alt="">
													</div>
												</div>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-sm btn-default" data-dismiss="modal">Закрити</button>
											</div>
										</div>
									</div>
								</div>
								<!-- Modal end -->
							</div>
							
							<div class="col-sm-6 col-md-3 isotope-item therapeutic">
								<div class="image-box">
									<div class="overlay-container">
										<img src="assets/doctor3.jpg" alt="">
										<a class="overlay" data-toggle="modal" data-target="#project-4">
											<i class="fa fa-search-plus"></i>
											<span>Стоматолог</span>
										</a>
									</div>
									<a class="btn btn-default btn-block" data-toggle="modal" data-target="#project-4">Інформація</a>
								</div>
								<!-- Modal -->
								<div class="modal fade" id="project-4" tabindex="-1" role="dialog" aria-labelledby="project-4-label" aria-hidden="true">
									<div class="modal-dialog modal-lg">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Закрити</span></button>
												<h4 class="modal-title" id="project-4-label">Інформація</h4>
											</div>
											<div class="modal-body">
												<h3>Інформація про лікаря</h3>
												<div class="row">
													<div class="col-md-6">
														<p>Інформація про лікаря<p>
													</div>
													<div class="col-md-6">
														<img src="assets/doctor3.jpg" alt="">
													</div>
												</div>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-sm btn-default" data-dismiss="modal">Закрити</button>
											</div>
										</div>
									</div>
								</div>
								<!-- Modal end -->
							</div>
							
							<div class="col-sm-6 col-md-3 isotope-item manager">
								<div class="image-box">
									<div class="overlay-container">
										<img src="assets/doctor5.jpg" alt="">
										<a class="overlay" data-toggle="modal" data-target="#project-5">
											<i class="fa fa-search-plus"></i>
											<span>Гастроентеролог</span>
										</a>
									</div>
									<a class="btn btn-default btn-block" data-toggle="modal" data-target="#project-5">Інформація</a>
								</div>
								<!-- Modal -->
								<div class="modal fade" id="project-5" tabindex="-1" role="dialog" aria-labelledby="project-5-label" aria-hidden="true">
									<div class="modal-dialog modal-lg">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Закрити</span></button>
												<h4 class="modal-title" id="project-5-label">Інформація</h4>
											</div>
											<div class="modal-body">
												<h3>Інформація про лікаря</h3>
												<div class="row">
													<div class="col-md-6">
														<p>Інформація про лікаря<p>
													</div>
													<div class="col-md-6">
														<img src="assets/doctor5.jpg" alt="">
													</div>
												</div>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-sm btn-default" data-dismiss="modal">Закрити</button>
											</div>
										</div>
									</div>
								</div>
								<!-- Modal end -->
							</div>
							
							<div class="col-sm-6 col-md-3 isotope-item therapeutic">
								<div class="image-box">
									<div class="overlay-container">
										<img src="assets/doctor6.jpg" alt="">
										<a class="overlay" data-toggle="modal" data-target="#project-6">
											<i class="fa fa-search-plus"></i>
											<span>Хірург</span>
										</a>
									</div>
									<a class="btn btn-default btn-block" data-toggle="modal" data-target="#project-6">Інформація</a>
								</div>
								<!-- Modal -->
								<div class="modal fade" id="project-6" tabindex="-1" role="dialog" aria-labelledby="project-6-label" aria-hidden="true">
									<div class="modal-dialog modal-lg">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Закрити</span></button>
												<h4 class="modal-title" id="project-6-label">Інформація</h4>
											</div>
											<div class="modal-body">
												<h3>Інформація про лікаря</h3>
												<div class="row">
													<div class="col-md-6">
														<p>Інформація про лікаря<p>
													</div>
													<div class="col-md-6">
														<img src="assets/doctor6.jpg" alt="">
													</div>
												</div>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-sm btn-default" data-dismiss="modal">Закрити</button>
											</div>
										</div>
									</div>
								</div>
								<!-- Modal end -->
							</div>
							
							<div class="col-sm-6 col-md-3 isotope-item therapeutic">
								<div class="image-box">
									<div class="overlay-container">
										<img src="assets/doctor7.jpg" alt="">
										<a class="overlay" data-toggle="modal" data-target="#project-7">
											<i class="fa fa-search-plus"></i>
											<span>Терапевт</span>
										</a>
									</div>
									<a class="btn btn-default btn-block" data-toggle="modal" data-target="#project-7">Інформація</a>
								</div>
								<!-- Modal -->
								<div class="modal fade" id="project-7" tabindex="-1" role="dialog" aria-labelledby="project-7-label" aria-hidden="true">
									<div class="modal-dialog modal-lg">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Закрити</span></button>
												<h4 class="modal-title" id="project-7-label">Інформація</h4>
											</div>
											<div class="modal-body">
												<h3>Інформація про лікаря</h3>
												<div class="row">
													<div class="col-md-6">
														<p>Інформація про лікаря<p>
													</div>
													<div class="col-md-6">
														<img src="assets/doctor7.jpg" alt="">
													</div>
												</div>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-sm btn-default" data-dismiss="modal">Закрити</button>
											</div>
										</div>
									</div>
								</div>
								<!-- Modal end -->
							</div>
							
							<div class="col-sm-6 col-md-3 isotope-item therapeutic">
								<div class="image-box">
									<div class="overlay-container">
										<img src="assets/Doctor8.jpg" alt="">
										<a class="overlay" data-toggle="modal" data-target="#project-8">
											<i class="fa fa-search-plus"></i>
											<span>Лор</span>
										</a>
									</div>
									<a class="btn btn-default btn-block" data-toggle="modal" data-target="#project-8">Інформація</a>
								</div>
								<!-- Modal -->
								<div class="modal fade" id="project-8" tabindex="-1" role="dialog" aria-labelledby="project-8-label" aria-hidden="true">
									<div class="modal-dialog modal-lg">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Закрити</span></button>
												<h4 class="modal-title" id="project-8-label">Інформація</h4>
											</div>
											<div class="modal-body">
												<h3>Інформація про лікаря</h3>
												<div class="row">
													<div class="col-md-6">
														<p>Інформація про лікаря<p>
													</div>
													<div class="col-md-6">
														<img src="assets/Doctor8.jpg" alt="">
													</div>
												</div>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-sm btn-default" data-dismiss="modal">Закрити</button>
											</div>
										</div>
									</div>
								</div>
								<!-- Modal end -->
							</div>

							<div class="col-sm-6 col-md-3 isotope-item therapeutic">
								<div class="image-box">
									<div class="overlay-container">
										<img src="assets/doctor9.jpg" alt="">
										<a class="overlay" data-toggle="modal" data-target="#project-9">
											<i class="fa fa-search-plus"></i>
											<span>Кардіолог</span>
										</a>
									</div>
									<a class="btn btn-default btn-block" data-toggle="modal" data-target="#project-9">Інформація</a>
								</div>
								<!-- Modal -->
								<div class="modal fade" id="project-9" tabindex="-1" role="dialog" aria-labelledby="project-9-label" aria-hidden="true">
									<div class="modal-dialog modal-lg">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Закрити</span></button>
												<h4 class="modal-title" id="project-9-label">Інформація</h4>
											</div>
											<div class="modal-body">
												<h3>Інформація про лікаря</h3>
												<div class="row">
													<div class="col-md-6">
														<p>Інформація про лікаря<p>
													</div>
													<div class="col-md-6">
														<img src="assets/doctor9.jpg" alt="">
													</div>
												</div>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-sm btn-default" data-dismiss="modal">Закрити</button>
											</div>
										</div>
									</div>
								</div>
								<!-- Modal end -->
							</div>

							<div class="col-sm-6 col-md-3 isotope-item therapeutic">
								<div class="image-box">
									<div class="overlay-container">
										<img src="assets/doctor10.jpg" alt="">
										<a class="overlay" data-toggle="modal" data-target="#project-10">
											<i class="fa fa-search-plus"></i>
											<span>Вірусолог</span>
										</a>
									</div>
									<a class="btn btn-default btn-block" data-toggle="modal" data-target="#project-10">Інформація</a>
								</div>
								<!-- Modal -->
								<div class="modal fade" id="project-10" tabindex="-1" role="dialog" aria-labelledby="project-10-label" aria-hidden="true">
									<div class="modal-dialog modal-lg">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Закрити</span></button>
												<h4 class="modal-title" id="project-10-label">Інформація</h4>
											</div>
											<div class="modal-body">
												<h3>Інформація про лікаря</h3>
												<div class="row">
													<div class="col-md-6">
														<p>Інформація про лікаря<p>
													</div>
													<div class="col-md-6">
														<img src="assets/doctor10.jpg" alt="">
													</div>
												</div>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-sm btn-default" data-dismiss="modal">Закрити</button>
											</div>
										</div>
									</div>
								</div>
								<!-- Modal end -->
							</div>

							<div class="col-sm-6 col-md-3 isotope-item therapeutic">
								<div class="image-box">
									<div class="overlay-container">
										<img src="assets/doctor11.jpg" alt="">
										<a class="overlay" data-toggle="modal" data-target="#project-11">
											<i class="fa fa-search-plus"></i>
											<span>Фізіотерапевт</span>
										</a>
									</div>
									<a class="btn btn-default btn-block" data-toggle="modal" data-target="#project-11">Інформація</a>
								</div>
								<!-- Modal -->
								<div class="modal fade" id="project-11" tabindex="-1" role="dialog" aria-labelledby="project-11-label" aria-hidden="true">
									<div class="modal-dialog modal-lg">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Закрити</span></button>
												<h4 class="modal-title" id="project-11-label">Інформація</h4>
											</div>
											<div class="modal-body">
												<h3>Інформація про лікаря</h3>
												<div class="row">
													<div class="col-md-6">
														<p>Інформація про лікаря<p>
													</div>
													<div class="col-md-6">
														<img src="assets/doctor11.jpg" alt="">
													</div>
												</div>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-sm btn-default" data-dismiss="modal">Закрити</button>
											</div>
										</div>
									</div>
								</div>
								<!-- Modal end -->
							</div>

							<div class="col-sm-6 col-md-3 isotope-item therapeutic">
								<div class="image-box">
									<div class="overlay-container">
										<img src="assets/doctor12.jpg" alt="">
										<a class="overlay" data-toggle="modal" data-target="#project-12">
											<i class="fa fa-search-plus"></i>
											<span>Гінеколог</span>
										</a>
									</div>
									<a class="btn btn-default btn-block" data-toggle="modal" data-target="#project-12">Інформація</a>
								</div>
								<!-- Modal -->
								<div class="modal fade" id="project-12" tabindex="-1" role="dialog" aria-labelledby="project-12-label" aria-hidden="true">
									<div class="modal-dialog modal-lg">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Закрити</span></button>
												<h4 class="modal-title" id="project-12-label">Інформація</h4>
											</div>
											<div class="modal-body">
												<h3>Інформація про лікаря</h3>
												<div class="row">
													<div class="col-md-6">
														<p>Інформація про лікаря<p>
													</div>
													<div class="col-md-6">
														<img src="assets/doctor12.jpg" alt="">
													</div>
												</div>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-sm btn-default" data-dismiss="modal">Закрити</button>
											</div>
										</div>
									</div>
								</div>
								<!-- Modal end -->
							</div>

						</div>
						<!-- portfolio items end -->
					
					</div>
				</div>
			</div>
		</div>
		<!-- section end -->

<footer id="footer">

			<!-- .footer start -->
			<!-- ================ -->
			<div class="footer section">
				<div class="container">
					<h1 class="title text-center" id="contact">Контакти</h1>
					<div class="space"></div>
					<div class="row">
						<div class="col-sm-6">
							<div class="footer-content">
								<p class="large">Ви можете зв'язатися з нами, зателефонувавши за телефоном, або заповніть форму, і ми передвонимо найближчим часом!</p>
								<ul class="list-icons">
									<li><i class="fa fa-map-marker pr-10"></i>Адреса клініки</li>
									<li><i class="fa fa-phone pr-10"></i> +38 (ХХХ) ХХХ-ХХ-ХХ</li>
									<li><i class="fa fa-phone pr-10"></i> +38 (ХХХ) ХХХ-ХХ-ХХ </li>
									<li><i class="fa fa-envelope-o pr-10"></i> your@email.com</li>
								</ul>
							</div>
						</div>
						<div class="col-sm-6">
							<div class="footer-content">
								<form role="form" id="footer-form">
									<div class="form-group has-feedback">
										<label class="sr-only" for="name2">Ім'я</label>
										<input type="text" class="form-control" id="name2" placeholder="Ім'я" name="name2" required>
										<i class="fa fa-user form-control-feedback"></i>
									</div>
									<div class="form-group has-feedback">
										<label class="sr-only" for="email2">Пошта</label>
										<input type="email" class="form-control" id="email2" placeholder="Введіть пошту" name="email2" required>
										<i class="fa fa-envelope form-control-feedback"></i>
									</div>
									<div class="form-group has-feedback">
										<label class="sr-only" for="phone">Телефон</label>
										<input type="text" class="form-control" id="phone" placeholder="+38 (ХХХ) ХХХ-ХХ-ХХ" name="phone" required>
										<i class="fa fa-phone form-control-feedback"></i>
									</div>
									<div class="form-group has-feedback">
										<label class="sr-only" for="message2">Повідомлення</label>
										<textarea class="form-control" rows="8" id="message2" placeholder="Повідомлення" name="message2" required></textarea>
										<i class="fa fa-pencil form-control-feedback"></i>
									</div>
									<input type="submit" value="Відправити" class="btn btn-default">
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- .footer end -->

			<!-- .subfooter start -->
			<!-- ================ -->
			<div class="subfooter">
				<div class="container">
					<div class="row">
						<div class="col-md-12">
							<p class="text-center">Copyright © 2017</p>
						</div>
					</div>
				</div>
			</div>
			<!-- .subfooter end -->

		</footer>
		<!-- footer end -->

		<!-- JavaScript files placed at the end of the document so the pages load faster
		================================================== -->
		<!-- Jquery and Bootstap core js files -->
        <script type="text/javascript" src="javas/jquery.min.js"></script>
        <script type="text/javascript" src="javas/bootstrap.min.js"></script>
        <script type="text/javascript" src="javas/bootstrap-datetimepicker.min.js"></script>

        <script type="text/javascript">
            $('#datetimepicker').datetimepicker({
                format: 'dd/MM/yyyy hh:mm:ss'
            });
        </script>

		<!-- Modernizr javascript -->
		<script type="text/javascript" src="javas/modernizr.js"></script>

		<!-- Isotope javascript -->
		<script type="text/javascript" src="javas/isotope.pkgd.min.js"></script>
		
		<!-- Backstretch javascript -->
		<script type="text/javascript" src="javas/jquery.backstretch.min.js"></script>

		<!-- Appear javascript -->
		<script type="text/javascript" src="javas/jquery.appear.js"></script>

		<!-- Initialization of Plugins -->
		<script type="text/javascript" src="javas/template.js"></script>

	
	

	</body>
</html>

</html>
