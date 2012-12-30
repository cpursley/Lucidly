<?php get_header(); ?> 

<!-- Content -->

<div class="content">
   <div class="container">
      <div class="row">
         <div class="span8">
            <!-- Posts area -->
            <h3><span>something missing</span></h3>
            <div class="posts">         
               <div class="entry">
                  <div class="matter">
                     <h2>Its 404<span class="color">!!!</span></h2>
                     <p>Something missing. Please check back later.</p>
               <div class="form">
                  <form method="get" id="searchform" action="<?php bloginfo('home'); ?>/" class="form-search">
                  <input type="text" value="<?php the_search_query(); ?>" name="s" id="s" class="input-medium"/>
                  <input type="submit" id="searchsubmit" value="Search" class="btn"/>
                  </form>
               </div>                     
                  </div>
                  <div class="clearfix"></div>
               </div>

               <div class="clearfix"></div>
               
            </div>
            
         </div>

<?php get_sidebar(); ?>

<?php get_footer(); ?>