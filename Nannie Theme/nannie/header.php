<!DOCTYPE html>
<html lang="en">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta charset="<?php bloginfo('charset'); ?>">
  <title><?php wp_title( '|', true,'right' ); ?> <?php bloginfo('name'); ?></title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="">
  <meta name="keywords" content="">
  <meta name="author" content="">

  <link href='http://fonts.googleapis.com/css?family=Droid+Sans:400,700' rel='stylesheet' type='text/css'>
  
  <!-- Stylesheets -->
  <link href="<?php bloginfo('template_directory');?>/style/bootstrap.css" rel="stylesheet">
  <link rel="stylesheet" href="<?php bloginfo('template_directory');?>/style/font-awesome.css">
  <!--[if IE 7]>
  <link rel="stylesheet" href="<?php bloginfo('template_directory');?>/style/font-awesome-ie7.css">
  <![endif]-->		
  <link href="<?php bloginfo('stylesheet_url'); ?>" rel="stylesheet">
  <link href="<?php bloginfo('template_directory');?>/style/bootstrap-responsive.css" rel="stylesheet">
  
  <!-- HTML5 Support for IE -->
  <!--[if lt IE 9]>
  <script src="<?php bloginfo('template_directory');?>js/html5shim.js"></script>
  <![endif]-->
  
  <link rel="pingback" href="<?php bloginfo( 'pingback_url' ); ?>" />

  <!-- Favicon -->
  <link rel="shortcut icon" href="<?php bloginfo('template_directory');?>/img/favicon/favicon.png">
    <?php if ( is_singular() ) wp_enqueue_script('comment-reply'); ?>

    <?php wp_head(); ?>   
</head>

<body>

<!-- Header -->
<header>
   <div class="container">
      <div class="row">
         <div class="span4">
            <div class="logo">
               <!-- Recommended Logo size 240x100 -->
               <a href="<?php bloginfo('url'); ?>"><h1><?php bloginfo('name'); ?><span class="color">.</span></h1></a>
               <p class="lmeta"><?php bloginfo('description'); ?></p>
            </div>
         </div>
         <div class="span4 offset4">
            <div class="social">
               <a href="#"><i class="icon-facebook facebook"></i></a>
               <a href="#"><i class="icon-twitter twitter"></i></a>
               <a href="#"><i class="icon-linkedin linkedin"></i></a>
               <a href="#"><i class="icon-pinterest pinterest"></i></a>
               <a href="#"><i class="icon-google-plus google-plus"></i></a>
            </div>
         </div>
      </div>
   </div>
</header>


         <div class="navbar">
            <div class="navbar-inner">
               <div class="container">
                  <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                     <span>Menu</span>
                  </a>
                  <div class="nav-collapse collapse">
                      <ul class="nav">
                        <?php
                           if (has_nav_menu('primary_navigation')) :
                              wp_nav_menu(array('theme_location' => 'primary_navigation', 'menu_class' => 'nav'));
                           endif;
                        ?>
                      </ul>
                  </div>
               </div>
            </div>
         </div>
         
  
    