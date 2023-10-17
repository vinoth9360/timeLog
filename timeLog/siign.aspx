<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="siign.aspx.cs" Inherits="timeLog.siign" %>

<!doctype html>
<html lang="en">

<head>
    <title>Vulcans Build &mdash; Project Management</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Work+Sans:400,500,700&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="fonts/icomoon/style.css">

    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="css/jquery.fancybox.min.css">
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/owl.theme.default.min.css">
    <link rel="stylesheet" href="fonts/flaticon/font/flaticon.css">
    <link rel="stylesheet" href="css/aos.css">

    <!-- MAIN CSS -->
    <link rel="stylesheet" href="css/style.css">

</head>

<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">


    <div class="site-wrap" id="home-section">

        <div class="site-mobile-menu site-navbar-target">
            <div class="site-mobile-menu-header">
                <div class="site-mobile-menu-close mt-3">
                    <span class="icon-close2 js-menu-toggle"></span>
                </div>
            </div>
            <div class="site-mobile-menu-body"></div>
        </div>



        <header class="site-navbar site-navbar-target" role="banner">

            <div class="container">
                <div class="row align-items-center position-relative">

                    <div class="col-3 ">
                        <div class="site-logo">
                            <a href="Home.aspx"><strong>VulcansBuild</strong><span class="text-primary"></span> </a>
                        </div>
                    </div>

                    <div class="col-9  text-right">


                        <span class="d-inline-block d-lg-none"><a href="#" class="text-white site-menu-toggle js-menu-toggle py-5 text-white"><span class="icon-menu h3 text-white"></span></a></span>



                        <nav class="site-navigation text-right ml-auto d-none d-lg-block" role="navigation">
                            <ul class="site-menu main-menu js-clone-nav ml-auto ">
                                <li><a href="Home.aspx" class="nav-link">Home</a></li>
                                <!--<li><a href="about.html" class="nav-link">About</a></li>
                  <li><a href="services.html" class="nav-link">Services</a></li>
                  <li><a href="projects.html" class="nav-link">Projects</a></li>-->
                                <li class="active"><a href="siign.aspx" class="nav-link">Sign in</a></li>
                                <li><a href="contact.aspx" class="nav-link">Contact</a></li>

                            </ul>
                        </nav>
                    </div>


                </div>
            </div>

        </header>


        <div class="ftco-blocks-cover-1">
            <div class="ftco-cover-1 overlay innerpage" style="background-image: url('images/hero_2.jpg')">
                <div class="container">
                    <div class="row align-items-center justify-content-center">
                        <div class="col-lg-6 text-center">

                            <style>
                                form {
                                    width: 25rem;
                                    height: 28rem;
                                    display: flex;
                                    flex-direction: column;
                                    background: rgba(255 255 255 0.06);
                                    box-shadow: 0 8px 32px 0 rgba(31,38,135,37);
                                    border-radius: 30px;
                                    border-left: 1px solid rgb(255, 255, 255,3);
                                    border-top: 1px solid rgb(255, 255, 255,.3);
                                }

                                h1 {
                                    font-size: 50px;
                                    text-align: center;
                                    color: orangered;
                                    text-shadow: 2px 2px 4px rgba(0000.2);
                                    letter-spacing: 3px;
                                    margin-bottom: 5%;
                                    margin-left: 5%;
                                    opacity: .7;
                                }

                                label {
                                    font-size: 20px;
                                    color: white;
                                    margin-right: 5%;
                                    margin-left: 10%;
                                    opacity: .8;
                                    text-shadow: 2px 2px 4px rgba(0000.2);
                                }

                                input {
                                    width: 80%;
                                    margin: 5% auto;
                                    margin-bottom: 8%;
                                    border: none;
                                    outline: none;
                                    background: transparent;
                                    color: white;
                                    border-bottom: 1px solid rgb(255, 255, 255,.6);
                                    opacity: .8;
                                }

                                button {
                                    width: 50%;
                                    margin: 3% auto;
                                    color: black;
                                    font-size: 15px;
                                    opacity: .7;
                                    background: rgba(255, 255, 255,.6);
                                    padding: 10px 30px;
                                    border: none;
                                    outline: none;
                                    border-radius: 20px;
                                    text-shadow: 2px 2px 4px rgb(255, 255, 255,.2);
                                    box-shadow: 3px 3px 5px rgba(31,38,135,37);
                                    border-left: 1px solid rgb(255, 255, 255,.3);
                                    border-top: 1px solid rgb(255, 255, 255,.3);
                                }

                                p {
                                    font-size: 12px;
                                    text-align: center;
                                    color: white;
                                    opacity: 15;
                                }
                            </style>
                            <form method="post" action="siign.aspx">
                                <h1>LOGIN</h1>
                                <label for="Emp Id">Emp Id</label>
                                <input type="text" required name="EmpId" id="EmpId" runat="server" />
                                <label for="Password">Password </label>
                                <input type="password" required name="Password" id="Password" runat="server" />
                                <input type="submit" runat="server" class="btn  btn-primary text-white py-1 px-3" value="Sign in" width="5">
                                <%-- <button>Login</button>--%>
                                <p><b>Don't' have an account?</b><a href="signup.aspx"> Sign Up</a>.</p>
                                <p><b></b><a href="adminlogin.aspx">Admin</a>.</p>
                            </form>
                            <p></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>






        <footer class="site-footer">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3">
                        <h2 class="footer-heading mb-4">About Us</h2>
                        <p>25+ BIM and Engineering professionals worked in various construction projects worldwide with more than 1800+ large construction projects as experience from the management team.</p>
                    </div>
                    <div class="col-lg-8 ml-auto">
                        <div class="row">
                            <div class="col-lg-3">
                                <h2 class="footer-heading mb-4">Quick Links</h2>
                                <ul class="list-unstyled">
                                    <li><a href="#">About Us</a></li>
                                    <li><a href="#">Testimonials</a></li>
                                    <li><a href="#">Terms of Service</a></li>
                                    <li><a href="#">Privacy</a></li>
                                    <li><a href="#">Contact Us</a></li>

                                </ul>
                            </div>
                            <div class="col-lg-3">
                                <h2 class="footer-heading mb-4">Quick Links</h2>
                                <ul class="list-unstyled">
                                    <li><a href="#">About Us</a></li>
                                    <li><a href="#">Testimonials</a></li>
                                    <li><a href="#">Terms of Service</a></li>
                                    <li><a href="#">Privacy</a></li>
                                    <li><a href="#">Contact Us</a></li>
                                </ul>
                            </div>
                            <div class="col-lg-3">
                                <h2 class="footer-heading mb-4">Quick Links</h2>
                                <ul class="list-unstyled">
                                    <li><a href="#">About Us</a></li>
                                    <li><a href="#">Testimonials</a></li>
                                    <li><a href="#">Terms of Service</a></li>
                                    <li><a href="#">Privacy</a></li>
                                    <li><a href="#">Contact Us</a></li>
                                </ul>
                            </div>
                            <div class="col-lg-3">
                                <h2 class="footer-heading mb-4">Quick Links</h2>
                                <ul class="list-unstyled">
                                    <li><a href="#">About Us</a></li>
                                    <li><a href="#">Testimonials</a></li>
                                    <li><a href="#">Terms of Service</a></li>
                                    <li><a href="#">Privacy</a></li>
                                    <li><a href="#">Contact Us</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row pt-5 mt-5 text-center">
                    <div class="col-md-12">
                        <div class="border-top pt-5">
                            <p>
                                <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                                Copyright &copy;
                    <script>document.write(new Date().getFullYear());</script>
                                All rights reserved |<a href="#" target="_blank">Vulcansbuild</a>
                                <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                            </p>
                        </div>
                    </div>

                </div>
            </div>
        </footer>

    </div>

    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/jquery.sticky.js"></script>
    <script src="js/jquery.waypoints.min.js"></script>
    <script src="js/jquery.animateNumber.min.js"></script>
    <script src="js/jquery.fancybox.min.js"></script>
    <script src="js/jquery.easing.1.3.js"></script>
    <script src="js/bootstrap-datepicker.min.js"></script>
    <script src="js/aos.js"></script>

    <script src="js/main.js"></script>

</body>

</html>
