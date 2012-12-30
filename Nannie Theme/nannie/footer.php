<!-- Footer -->
<footer>
  <div class="container">
    <div class="row">
      <!-- Footer widgets -->
         <div class="span4">
            <?php if ( !function_exists('dynamic_sidebar') || !dynamic_sidebar('footer 1') ) : ?>
            <div class="fwidget">
               <h4>About Me</h4>
               <p>Suspendisse potenti. Morbi ac felis nec mauris imperdiet fermentum. Aenean sodales augue ac lacus hendrerit sed rhoncus erat hendrerit. Vivamus vel ultricies elit. Aliquam ut feugiat ante. Curabitur  usto aliquam. Maecenas turpis urna, eleifend quis urna. Aliquam fringilla mauris lectus, in  justo. Aliquam ut pharetra erat.</p>
            </div>
            <?php endif; ?>
         </div>
         <div class="span4">
            <?php if ( !function_exists('dynamic_sidebar') || !dynamic_sidebar('footer 2') ) : ?>
            <div class="fwidget">
               <h4>Recent Comments</h4>
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
         <div class="span4">
            <?php if ( !function_exists('dynamic_sidebar') || !dynamic_sidebar('footer 3') ) : ?>
            <div class="fwidget">
               <h4>Categories</h4>
               <ul>
                  <li>Etiam adipiscing posuere justo, nec usto dictum non</li>
                  <li>Cras tincidunt mi non arcu hendrerit eleifend</li>
                  <li>Aenean ullamrper justo tincidun diam faucibus</li>
                  <li>Maecenas hendrerit neque id ante dictum mattis</li>
                  <li>Vivamus non neque lacus, et cursus tortor</li>
               </ul>
            </div>   
            <?php endif; ?>
         </div>
      <div class="span12">
         <div class="copy">
            <p>Copyright &copy; <?php echo date('Y'); ?> - <a href="<?php bloginfo('url'); ?>"><?php bloginfo('name'); ?></a></p>
         </div>
      </div>
    </div>
  <div class="clearfix"></div>
  </div>
</footer>		

<!-- JS -->
<script src="<?php bloginfo('template_directory');?>/js/jquery.js"></script>
<script src="<?php bloginfo('template_directory');?>/js/bootstrap.js"></script>
<?php wp_footer(); ?>
</body>
</html>