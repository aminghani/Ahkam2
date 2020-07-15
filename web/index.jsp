<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
  <title>Untitled</title>
  <link rel="stylesheet" href="css/bootstrap-4.3.1-dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700">
  <link rel="stylesheet" href="css/bootstrap-4.3.1-dist/css/ionicons.min.css">
  <link rel="stylesheet" href="css/indexstyle/Header-Blue.css">
  <link rel="stylesheet" href="css/indexstyle/Login-Form-Dark.css">
  <link rel="stylesheet" href="css/indexstyle/Registration-Form-with-Photo.css">
  <link rel="stylesheet" href="css/style.css">
  <style>
    .custom-select {
      position: relative;
      font-family: Arial;
    }

    .custom-select select {
      display: none; /*hide original SELECT element: */
    }

    .select-selected {
      background-color: DodgerBlue;
    }

    /* Style the arrow inside the select element: */
    .select-selected:after {
      position: absolute;
      content: "";
      top: 14px;
      right: 10px;
      width: 0;
      height: 0;
      border: 6px solid transparent;
      border-color: #fff transparent transparent transparent;
    }

    /* Point the arrow upwards when the select box is open (active): */
    .select-selected.select-arrow-active:after {
      border-color: transparent transparent #fff transparent;
      top: 7px;
    }

    /* style the items (options), including the selected item: */
    .select-items div,.select-selected {
      color: #ffffff;
      padding: 8px 16px;
      border: 1px solid transparent;
      border-color: transparent transparent rgba(0, 0, 0, 0.1) transparent;
      cursor: pointer;
    }

    /* Style items (options): */
    .select-items {
      position: absolute;
      background-color: DodgerBlue;
      top: 100%;
      left: 0;
      right: 0;
      z-index: 99;
    }

    /* Hide the items when the select box is closed: */
    .select-hide {
      display: none;
    }

    .select-items div:hover, .same-as-selected {
      background-color: rgba(0, 0, 0, 0.1);
    }
  </style>
  <style>
    .register-photo {
      background: #f1f7fc;
      padding: 80px 0;
    }

    .register-photo .image-holder {
      display: table-cell;
      width: auto;
      background: url(./images/alexandr-podvalny-n_Jb_d8O43Q-unsplash.jpg);
      background-size: cover;
    }

    .register-photo .form-container {
      display: table;
      max-width: 900px;
      width: 90%;
      margin: 0 auto;
      box-shadow: 1px 1px 5px rgba(0,0,0,0.1);
    }

    .register-photo form {
      display: table-cell;
      width: 400px;
      background-color: #ffffff;
      padding: 40px 60px;
      color: #505e6c;
    }

    @media (max-width:991px) {
      .register-photo form {
        padding: 40px;
      }
    }

    .register-photo form h2 {
      font-size: 24px;
      line-height: 1.5;
      margin-bottom: 30px;
    }

    .register-photo form .form-control {
      background: #f7f9fc;
      border: none;
      border-bottom: 1px solid #dfe7f1;
      border-radius: 0;
      box-shadow: none;
      outline: none;
      color: inherit;
      text-indent: 6px;
      height: 40px;
    }

    .register-photo form .form-check {
      font-size: 13px;
      line-height: 20px;
    }

    .register-photo form .btn-primary {
      background: #f4476b;
      border: none;
      border-radius: 4px;
      padding: 11px;
      box-shadow: none;
      margin-top: 35px;
      text-shadow: none;
      outline: none !important;
    }

    .register-photo form .btn-primary:hover, .register-photo form .btn-primary:active {
      background: #eb3b60;
    }

    .register-photo form .btn-primary:active {
      transform: translateY(1px);
    }

    .register-photo form .already {
      display: block;
      text-align: center;
      font-size: 12px;
      color: #6f7a85;
      opacity: 0.9;
      text-decoration: none;
    }

  </style>
  <style>
    .login-dark {
      height: 1000px;
      background: #475d62 url(./images/alexandr-podvalny-n_Jb_d8O43Q-unsplash.jpg);
      background-size: cover;
      position: relative;
    }

    .login-dark form {
      max-width: 320px;
      width: 90%;
      background-color: #1e2833;
      padding: 40px;
      border-radius: 4px;
      transform: translate(-50%, -50%);
      position: absolute;
      top: 50%;
      left: 50%;
      color: #fff;
      box-shadow: 3px 3px 4px rgba(0,0,0,0.2);
    }

    .login-dark .illustration {
      text-align: center;
      padding: 15px 0 20px;
      font-size: 100px;
      color: #2980ef;
    }

    .login-dark form .form-control {
      background: none;
      border: none;
      border-bottom: 1px solid #434a52;
      border-radius: 0;
      box-shadow: none;
      outline: none;
      color: inherit;
    }

    .login-dark form .btn-primary {
      background: #214a80;
      border: none;
      border-radius: 4px;
      padding: 11px;
      box-shadow: none;
      margin-top: 26px;
      text-shadow: none;
      outline: none;
    }

    .login-dark form .btn-primary:hover, .login-dark form .btn-primary:active {
      background: #214a80;
      outline: none;
    }

    .login-dark form .forgot {
      display: block;
      text-align: center;
      font-size: 12px;
      color: #6f7a85;
      opacity: 0.9;
      text-decoration: none;
    }

    .login-dark form .forgot:hover, .login-dark form .forgot:active {
      opacity: 1;
      text-decoration: none;
    }

    .login-dark form .btn-primary:active {
      transform: translateY(1px);
    }

  </style>
  <style>
    .header-blue {
      background: linear-gradient(135deg, #172a74, #21a9af);
      background-color: #184e8e;
      padding-bottom: 80px;
      font-family: 'Source Sans Pro', sans-serif;
    }

    @media (min-width:768px) {
      .header-blue {
        padding-bottom: 120px;
      }
    }

    .header-blue .navbar {
      background: transparent;
      padding-top: .75rem;
      padding-bottom: .75rem;
      color: #fff;
      border-radius: 0;
      box-shadow: none;
      border: none;
    }

    @media (min-width:768px) {
      .header-blue .navbar {
        padding-top: 1rem;
        padding-bottom: 1rem;
      }
    }

    .header-blue .navbar .navbar-brand {
      font-weight: bold;
      color: inherit;
    }

    .header-blue .navbar .navbar-brand:hover {
      color: #f0f0f0;
    }

    .header-blue .navbar .navbar-collapse {
      border-top: 1px solid rgba(255,255,255,0.3);
      margin-top: .5rem;
    }

    @media (min-width:768px) {
      .header-blue .navbar .navbar-collapse {
        border-color: transparent;
        margin: 0;
      }
    }

    .header-blue .navbar .navbar-collapse span .login {
      color: #d9d9d9;
      margin-right: .5rem;
      text-decoration: none;
    }

    .header-blue .navbar .navbar-collapse span .login:hover {
      color: #fff;
    }

    .header-blue .navbar .navbar-toggler {
      border-color: rgba(255,255,255,0.3);
    }

    .header-blue .navbar .navbar-toggler:hover, .header-blue .navbar-toggler:focus {
      background: none;
    }

    @media (min-width: 768px) {
      .header-blue .navbar-nav .nav-link {
        padding-left: .7rem;
        padding-right: .7rem;
      }
    }

    @media (min-width: 992px) {
      .header-blue .navbar-nav .nav-link {
        padding-left: 1.2rem;
        padding-right: 1.2rem;
      }
    }

    .header-blue .navbar.navbar-light .navbar-nav .nav-link {
      color: #d9d9d9;
    }

    .header-blue .navbar.navbar-light .navbar-nav .nav-link:focus, .header-blue .navbar.navbar-light .navbar-nav .nav-link:hover {
      color: #fcfeff !important;
      background-color: transparent;
    }

    .header-blue .navbar .navbar-nav > li > .dropdown-menu {
      margin-top: -5px;
      box-shadow: 0 4px 8px rgba(0,0,0,.1);
      background-color: #fff;
      border-radius: 2px;
    }

    .header-blue .navbar .dropdown-menu .dropdown-item:focus, .header-blue .navbar .dropdown-menu .dropdown-item {
      line-height: 2;
      color: #37434d;
    }

    .header-blue .navbar .dropdown-menu .dropdown-item:focus, .header-blue .navbar .dropdown-menu .dropdown-item:hover {
      background: #ebeff1;
    }

    .header-blue .action-button, .header-blue .action-button:not(.disabled):active {
      border: 1px solid rgba(255,255,255,0.7);
      border-radius: 40px;
      color: #ebeff1;
      box-shadow: none;
      text-shadow: none;
      padding: .3rem .8rem;
      background: transparent;
      transition: background-color 0.25s;
      outline: none;
    }

    .header-blue .action-button:hover {
      color: #fff;
    }

    .header-blue .navbar .form-inline label {
      color: #d9d9d9;
    }

    .header-blue .navbar .form-inline .search-field {
      display: inline-block;
      width: 80%;
      background: none;
      border: none;
      border-bottom: 1px solid transparent;
      border-radius: 0;
      color: #ccc;
      box-shadow: none;
      color: inherit;
      transition: border-bottom-color 0.3s;
    }

    .header-blue .navbar .form-inline .search-field:focus {
      border-bottom: 1px solid #ccc;
    }

    .header-blue .hero {
      margin-top: 20px;
      text-align: center;
    }

    @media (min-width:768px) {
      .header-blue .hero {
        margin-top: 60px;
        text-align: left;
      }
    }

    .header-blue .hero h1 {
      color: #fff;
      font-size: 40px;
      margin-top: 0;
      margin-bottom: 15px;
      font-weight: 300;
      line-height: 1.4;
    }

    @media (min-width:992px) {
      .header-blue .hero h1 {
        margin-top: 190px;
        margin-bottom: 24px;
        line-height: 1.2;
      }
    }

    .header-blue .hero p {
      color: rgba(255,255,255,0.8);
      font-size: 20px;
      margin-bottom: 30px;
      font-weight: 300;
    }

    .header-blue .phone-holder {
      text-align: right;
    }

    .header-blue div.iphone-mockup {
      position: relative;
      max-width: 300px;
      margin: 20px;
      display: inline-block;
    }

    .header-blue .iphone-mockup img.device {
      width: 100%;
      height: auto;
    }

    .header-blue .iphone-mockup .screen {
      position: absolute;
      width: 88%;
      height: 77%;
      top: 12%;
      border-radius: 2px;
      left: 6%;
      border: 1px solid #444;
      background-color: #aaa;
      overflow: hidden;
      background: url(./images/alexandr-podvalny-n_Jb_d8O43Q-unsplash.jpg);
      background-size: cover;
      background-position: center;
    }

    .header-blue .iphone-mockup .screen:before {
      content: '';
      background-color: #fff;
      position: absolute;
      width: 70%;
      height: 140%;
      top: -12%;
      right: -60%;
      transform: rotate(-19deg);
      opacity: 0.2;
    }
  </style>
</head>

<body>
  <div></div>
  <div class="login-dark">
    <form action="PageOne" method="post" style="height: 513px;">
      <h2 class="sr-only">Login Form</h2>
      <div class="illustration"><i class="icon ion-ios-locked-outline"></i></div>
      <div class="form-group"><input class="form-control" type="text" name="username" placeholder="User name"></div>
      <div class="form-group"><input class="form-control" type="password" name="password" placeholder="Password"></div>
      <select class="custom-select" name="level">
        <option name="level" value="Admin">Admin</option>
        <option name="level" value="Employee">Employee</option>
      </select>
      <div class="form-group"><button class="btn btn-primary btn-block" type="submit">Log In</button></div>
    </form>
  </div>
  <script src="assets/js/jquery.min.js"></script>
  <script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>

</html>