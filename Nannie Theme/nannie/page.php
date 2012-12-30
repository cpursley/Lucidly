<?php get_header(); ?> 

<!-- Content -->

<div class="content">
   <div class="container">
      <div class="row">
         <div class="span8">
            <!-- Posts area -->
            <div class="posts">
            <?php if(have_posts()) : ?>
               <h3 style="display:none"><span>Post</span></h3>
            <?php while(have_posts()) : the_post(); ?>            
               <div class="entry" id="post-<?php the_ID(); ?>">
                  <div class="matter">
                  
                     <h2><?php the_title(); ?></h2>
                     
                     
                     <?php the_content(); ?>
                  </div>
                  <div class="clearfix"></div>
               </div>
               <?php comments_template(); ?>
               <?php endwhile; ?>   
               <div class="clearfix"></div>               
               <?php endif; ?>
            </div>
            
         </div>

<?php get_sidebar(); ?>

<?php get_footer(); ?>