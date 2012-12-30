<?php get_header(); ?> 

<!-- Content -->

<div class="content">
   <div class="container">
      <div class="row">
         <div class="span8">
            <!-- Posts area -->
            <h3><span>recent posts</span></h3>
            <div class="posts">
            <?php if(have_posts()) : ?>
            <?php while(have_posts()) : the_post(); ?>            
               <div class="entry" id="post-<?php the_ID(); ?>">
                  <div class="thumb">
                     <a href="<?php the_permalink() ?>" rel="bookmark"><?php if (function_exists('has_post_thumbnail') && has_post_thumbnail()) the_post_thumbnail(); ?></a>
                  </div>
                  <div class="matter">
                  
                     <h2><a href="<?php the_permalink() ?>" rel="bookmark"><?php the_title(); ?></a></h2>
                     
                     <div class="meta"><i class="icon-calendar"></i> <?php the_time('j M y'); ?> - <i class="icon-folder-open"></i> <?php the_category(', ') ?> - <i class="icon-comment"></i> <?php comments_popup_link('No Comments', '1 Comment', '% Comments'); ?></div>
                     
                     <?php the_excerpt(); ?>
                  </div>
                  <div class="clearfix"></div>
               </div>

               <?php endwhile; ?>        
                  <!-- Pagination -->
            
               <?php
                  // Pagination 
                  global $wp_query;
                  $total_pages = $wp_query->max_num_pages;
                  if ($total_pages > 1){
                    $current_page = max(1, get_query_var('paged'));
                    echo '<div class="pagination">';
                    echo paginate_links(array(
                        'base' => get_pagenum_link(1) . '%_%',
                        'format' => 'page/%#%',
                        'current' => $current_page,
                        'total' => $total_pages,
                        'end_size' => 0,
                        'mid_size' => 1,
                        'prev_text' => 'Prev',
                        'next_text' => 'Next',
                        'type' => 'plain'
                      ));
                    echo '</div>';
                  }
               ?>  
               <div class="clearfix"></div>
               
               <?php endif; ?>
            </div>
            
         </div>

<?php get_sidebar(); ?>

<?php get_footer(); ?>