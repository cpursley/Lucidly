<?php get_header(); ?> 

<!-- Content -->

<div class="content">
   <div class="container">
      <div class="row">
         <div class="span8">
            <!-- Posts area -->
            <h3 style="display:none"><span>Post</span></h3>
            <div class="posts">
            <?php if(have_posts()) : ?>
            <?php while(have_posts()) : the_post(); ?>            
               <div class="entry" id="post-<?php the_ID(); ?>">
                  <div class="matter">
                  
                     <h2><?php the_title(); ?></h2>
                     
                     <div class="meta"><i class="icon-calendar"></i> <?php the_time('j M y'); ?> - <i class="icon-folder-open"></i> <?php the_category(', ') ?> - <i class="icon-comment"></i> <?php comments_popup_link('No Comments', '1 Comment', '% Comments'); ?></div>
                     
                     <?php the_content(); ?>
                     <?php the_tags('Tags: ', ' ', '');?>
                  </div>
                  <div class="clearfix"></div>
               </div>
               
               <?php comments_template(); ?>

               <?php endwhile; ?>        
                  <!-- Navigation -->
                  
                  <div class="navigation">  
                        <div class="pull-left"><?php previous_post_link() ?></div>
                        <div class="pull-right"><?php next_post_link() ?></div>
                        <div class="clearfix"></div>
                  </div>  
               <div class="clearfix"></div>
               
               <?php endif; ?>
            </div>
            
         </div>

<?php get_sidebar(); ?>

<?php get_footer(); ?>