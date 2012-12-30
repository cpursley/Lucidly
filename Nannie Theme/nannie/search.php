<?php get_header(); ?> 

<!-- Content -->

<div class="content">
   <div class="container">
      <div class="row">
         <div class="span8">
            <!-- Posts area -->
            <div class="posts">
            <?php if(have_posts()) : ?>
            <h3><span>Search results for &#8216;<?php the_search_query(); ?>&#8217;</span></h3>
            <?php while(have_posts()) : the_post(); ?>            
               <div class="entry" id="post-<?php the_ID(); ?>">
                  <div class="matter">
                  
                     <h2><a href="<?php the_permalink() ?>" rel="bookmark"><?php the_title(); ?></a></h2>
                     
                     <div class="meta"><i class="icon-calendar"></i> <?php the_time('j M y'); ?> - <i class="icon-folder-open"></i> <?php the_category(', ') ?> - <i class="icon-comment"></i> <?php comments_popup_link('No Comments', '1 Comment', '% Comments'); ?></div>
                     
                     <?php the_excerpt(); ?>
                  </div>
                  <div class="clearfix"></div>
               </div>

               <?php endwhile; ?>        
                  <!-- Pagination -->
            
               <div class="clearfix"></div>
                <div class="navigation">
                  <div class="pull-left"><?php next_posts_link('&laquo; Previous Entries') ?></div>
                  <div class="pull-right"><?php previous_posts_link('Next Entries &raquo;') ?></div>
                  <div class="clearfix"></div>
                </div>
                <?php else : ?>
                <div class="entry">
                  <h2>No search results</h2>
                  <p>We did not find any posts containing the string &#8216;<?php the_search_query(); ?>&#8217;.</p>
                </div> 
               
               <?php endif; ?>
            </div>
            
         </div>

<?php get_sidebar(); ?>

<?php get_footer(); ?>