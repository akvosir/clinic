<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="userCab.aspx.cs" Inherits="ClinicSite.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="css/style.css" rel="stylesheet">
    <title>Clinic without queue</title>
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,700italic,400,700,300&amp;subset=latin,latin-ext' rel='stylesheet' type='text/css'>
	<link href='http://fonts.googleapis.com/css?family=Raleway:700,400,300' rel='stylesheet' type='text/css'>
    <link href="css/css/bootstrap.css" rel="stylesheet">
     <link href="css/css/bootstrap-datetimepicker.css" rel="stylesheet">
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <header class="header fixed clearfix navbar navbar-fixed-top">
			<div class="container">
				<div class="row">
					<div class="col-md-6">

						<!-- header-left start -->
						<!-- ================ -->
						<div><!-- class="header-right clearfix" -->
							<!-- name-and-slogan -->
							<div class="site-name-and-slogan smooth-scroll">
								<div class="site-name"><a href="#banner">Районна поліклініка</a></div>
							</div>

						</div>
						<!-- header-left end -->

					</div>
					<div class="col-md-6">

						<div> <!-- class="header-right clearfix" -->

							<div class="main-navigation animated">

								<!-- navbar start -->
								<!-- ================ -->
								<nav class="navbar navbar-default" role="navigation">
									<div class="container-fluid">
                                        <!-- Collect the nav links, forms, and other content for toggling -->
										<div class="collapse navbar-collapse scrollspy smooth-scroll" id="navbar-collapse-1">
											<ul class="nav navbar-nav navbar-right">
												<li ><a href="Site.aspx">Головна</a></li>
												<li class="active"><a  href="#cab">Мій кабінет</a></li>
                                                <li ><input type="submit" value="Вийти" class="btn-default"></li>
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
		</header>
    </div>
    </form>
    </div>
                <div class="container">
                 <div class="row">
                     <div class='col-sm-6'>
                         <div class="form-group">
                             <div class='input-group date' id='datetimepicker1'>
                                 <input type='text' class="form-control" />
                                 <span class="input-group-addon">
                                      <span class="glyphicon glyphicon-calendar"></span>
                                 </span>
                             </div>
                         </div>
                    </div>
                  </div>
              </div>
    
    
    <script type="text/javascript" src="javas/bootstrap.min.js"></script>
</body>
</html>
