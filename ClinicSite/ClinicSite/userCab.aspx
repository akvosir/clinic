<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="userCab.aspx.cs" Inherits="ClinicSite.User" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    
    <meta charset="utf-8">
    <title>My Cabinet</title>
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,700italic,400,700,300&amp;subset=latin,latin-ext' rel='stylesheet' type='text/css'>
	<link href='http://fonts.googleapis.com/css?family=Raleway:700,400,300' rel='stylesheet' type='text/css'>
    <link href="css/bootstrap-combined.min.css" rel="stylesheet">
    <link href="css/bootstrap-datetimepicker.min.css" rel="stylesheet" type="text/css" media="screen">
    <link href="css/bootstrap.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">

</head>
<body  class="no-trans">
    <form id="User" runat ="server">
    <div >
        <header class="header fixed clearfix navbar navbar-fixed-top">
			<div class="container">
				<div class="row">
					<div class="col-md-3">

						<!-- header-left start -->
						<!-- ================ -->
						<div><!-- class="header-right clearfix" -->
							<!-- name-and-slogan -->
							<div class="site-name-and-slogan smooth-scroll">
								<div class="site-name"><a href="Site.aspx">Районна поліклініка</a></div>
							</div>

						</div>
						<!-- header-left end -->

					</div>
					<div class="col-md-8">
						<div class="header-right clearfix" >
							<div class="main-navigation animated">

								<!-- navbar start -->
								<!-- ================ -->
								<nav class="navbar navbar-default" role="navigation">
									<div class="container-fluid">
                                        <!-- Collect the nav links, forms, and other content for toggling -->
										<div class="collapse navbar-collapse scrollspy smooth-scroll" id="navbar-collapse-1">
											<ul class="nav navbar-nav navbar-right">
												<li class="active"><a href="#main">Записатися на прийом</a></li>
                                                <li><a href="#analysis">Мої аналізи</a></li>
                                                <li><a href="#cab">Результати прийому</a></li>
                                                <li ><input type="submit" value="Вийти" class="btn-default"></li>
											</ul>
										</div>

									</div>
								</nav><!-- navbar end -->
							</div><!-- main-navigation end -->
						</div><!-- header-right end -->
					</div>
				</div>
            </div>
		</header>
<div id ="main" class ="banner">
        <div class="banner-image"></div>
        <div class="banner-caption">
	        <div class="container">
                <div class="row">
				    <div class="col-md-8 col-md-offset-2 object-non-visible" data-animation-effect="fadeIn">
                        <div class="text-center">
                            <div id="datetimepicker" class="input-append date">
                                < type="text"/>
                                <span class="add-on">
                                    <i data-time-icon="icon-time" data-date-icon="icon-calendar"></i>
                                </span>
                            </div>
                            <select name="Choice">
                                <option value="Pic1.jpg">Photo 1</option>
                                <option value="Pic2.jpg">Photo 2</option>
                                <option value="Pic3.jpg">Photo 3</option>
                            </select>
                            <input type="submit" value="Обрати лікаря" class="btn btn-default"></input>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </div>
</div>
        <script type="text/javascript" src="javas/jquery.min.js"></script>
        <script type="text/javascript" src="javas/bootstrap.min.js"></script>
        <script type="text/javascript" src="javas/bootstrap-datetimepicker.min.js"></script>
        
        <script type="text/javascript">
            $('#datetimepicker').datetimepicker({
                format: 'dd/MM/yyyy hh:mm:ss'
            });
        </script>
        <script type="text/javascript" src="javas/modernizr.js"></script>
		<script type="text/javascript" src="javas/isotope.pkgd.min.js"></script>
		<script type="text/javascript" src="javas/jquery.backstretch.min.js"></script>
		<script type="text/javascript" src="javas/jquery.appear.js"></script>
		<script type="text/javascript" src="javas/template.js"></script>

    </form>
</body>
</html>
