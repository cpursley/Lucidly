         <div class="span4">
            <!-- Sidebar -->
               <div class="sidebar">
                  <?php if ( !function_exists('dynamic_sidebar') || !dynamic_sidebar('sidebar') ) : ?>
                  <!-- Widget -->
                  <div class="widget">
                     <h3><span>Search</span></h3>
                     <div class="form">
                        <form method="get" id="searchform" action="#" class="form-search">
                           <input type="text" value="" name="s" id="s" class="input-medium"/>
                           <input type="submit" id="searchsubmit" value="Search" class="btn"/>
                        </form>
                     </div>
                  </div>
                  
                  <div class="widget">
                     <h3><span>About Me</span></h3>
                     <p>Nulla facilisi. Sed justo dui, scelerisque ut consectetur vel, eleifend id erat. Phasellus condimentum rutrum aliquet. Quisque eu consectetur erat. Proin rutrum, erat eget posuere semper, <em>arcu mauris posuere tortor</em>, in commodo enim magna id massa. Suspendisse potenti. Aliquam erat volutpat. Maecenas quis tristique turpis.</p>
                  </div>
                  
                  <div class="widget">
                     <h3><span>Recent Posts</span></h3>
                     <ul>
                        <li><a href="#">Sed eu leo orci, condimentum gravida metus</a></li>
                        <li><a href="#">Etiam at nulla ipsum, in rhoncus purus</a></li>
                        <li><a href="#">Fusce vel magna faucibus felis dapibus facilisis</a></li>
                        <li><a href="#">Vivamus scelerisque dui in massa</a></li>
                        <li><a href="#">Pellentesque eget adipiscing dui semper</a></li>
                     </ul>
                  </div>
                  <?php endif; ?>
               </div>
         </div>
      </div>
   </div>
</div>

<!-- Content ends -->