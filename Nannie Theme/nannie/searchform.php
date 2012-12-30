<div class="form">
<form method="get" id="searchform" action="<?php bloginfo('home'); ?>/" class="form-search">
<input type="text" value="<?php the_search_query(); ?>" name="s" id="s" class="input-medium"/>
<input type="submit" id="searchsubmit" value="Search" class="btn"/>
</form>
</div>
