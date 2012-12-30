<?php



/* Navigation */

  register_nav_menus(array(
    'primary_navigation' => __('Primary Navigation', 'roots'),
  ));


/**
 * Cleaner walker for wp_nav_menu()
 *
 * Walker_Nav_Menu (WordPress default) example output:
 *   <li id="menu-item-8" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-8"><a href="/">Home</a></li>
 *   <li id="menu-item-9" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-9"><a href="/sample-page/">Sample Page</a></l
 *
 * Roots_Nav_Walker example output:
 *   <li class="menu-home"><a href="/">Home</a></li>
 *   <li class="menu-sample-page"><a href="/sample-page/">Sample Page</a></li>
 */
class Roots_Nav_Walker extends Walker_Nav_Menu {
  function check_current($classes) {
    return preg_match('/(current[-_])|active|dropdown/', $classes);
  }

  function start_lvl(&$output, $depth = 0, $args = array()) {
    $output .= "\n<ul class=\"dropdown-menu\">\n";
  }

  function start_el(&$output, $item, $depth = 0, $args = array(), $id = 0) {
    $item_html = '';
    parent::start_el($item_html, $item, $depth, $args);

    if ($item->is_dropdown && ($depth === 0)) {
      $item_html = str_replace('<a', '<a class="dropdown-toggle" data-toggle="dropdown" data-target="#"', $item_html);
      $item_html = str_replace('</a>', ' <b class="caret"></b></a>', $item_html);
    }
    elseif (in_array('divider-vertical', $item->classes)) {
      $item_html = '<li class="divider-vertical">';
    }  
    elseif (in_array('divider', $item->classes)) {
      $item_html = '<li class="divider">';
    }
    elseif (in_array('nav-header', $item->classes)) {
      $item_html = '<li class="nav-header">' . $item->title;
    }

    $output .= $item_html;
  }

  function display_element($element, &$children_elements, $max_depth, $depth = 0, $args, &$output) {
    $element->is_dropdown = !empty($children_elements[$element->ID]);

    if ($element->is_dropdown) {
      if ($depth === 0) {
        $element->classes[] = 'dropdown';
      } elseif ($depth === 1) {
        $element->classes[] = 'dropdown-submenu';
      }
    }

    parent::display_element($element, $children_elements, $max_depth, $depth, $args, $output);
  }
}


/**
 * Clean up wp_nav_menu_args
 *
 * Remove the container
 * Use Roots_Nav_Walker() by default
 */
function roots_nav_menu_args($args = '') {
  $roots_nav_menu_args['container'] = false;

  if (!$args['items_wrap']) {
    $roots_nav_menu_args['items_wrap'] = '<ul class="%2$s">%3$s</ul>';
  }

  if (current_theme_supports('bootstrap-top-navbar')) {
    $roots_nav_menu_args['depth'] = 3;
  }

  if (!$args['walker']) {
    $roots_nav_menu_args['walker'] = new Roots_Nav_Walker();
  }

  return array_merge($args, $roots_nav_menu_args);
}

add_filter('wp_nav_menu_args', 'roots_nav_menu_args');



/* Widget */

if ( function_exists('register_sidebar') ){
    register_sidebar(array(
        'name' => 'Sidebar',
        'before_widget' => '<div class="widget">',
        'after_widget' => '</div>',
        'before_title' => '<h3><span>',
        'after_title' => '</span></h3>',
    ));
	register_sidebar(array(
        'name' => 'Footer 1',
        'before_widget' => '<div class="fwidget">',
        'after_widget' => '</div>',
        'before_title' => '<h4>',
        'after_title' => '</h4>',
    ));
	register_sidebar(array(
        'name' => 'Footer 2',
        'before_widget' => '<div class="fwidget">',
        'after_widget' => '</div>',
        'before_title' => '<h4>',
        'after_title' => '</h4>',
    ));
	register_sidebar(array(
        'name' => 'Footer 3',
        'before_widget' => '<div class="fwidget">',
        'after_widget' => '</div>',
        'before_title' => '<h4>',
        'after_title' => '</h4>',
    ));
}

/* Feed links */

add_theme_support( 'automatic-feed-links' );

/* Thumbnail */

if (function_exists('add_theme_support')) {
  add_theme_support('post-thumbnails',array('post'));
  set_post_thumbnail_size(130,130,true);
}

/* Wordpress Comment List */

//  CUSTOM COMMENTS STYLING

function ashok_comment($comment, $args, $depth) {
$GLOBALS['comment'] = $comment; ?>
<li <?php comment_class(); ?> id="li-comment-<?php comment_ID() ?>" >

   
	<div id="comment-<?php comment_ID(); ?>" class="comment-box">
		
			<div class="comment-author"><strong><?php comment_author_link(); ?></strong></div>
			<div class="cmeta"><?php printf(__('%1$s at %2$s'), get_comment_date(),  get_comment_time()) ?> <?php edit_comment_link(__(' - Edit'),'  ','') ?></div>
         
         <div class="clearfix"></div>
			<?php if ($comment->comment_approved == '0') : ?>
         <em><?php _e('Your comment is awaiting moderation.') ?></em>
         <?php endif; ?>
      
			<?php comment_text() ?>
			
			<?php if($args['max_depth']!=$depth) { ?>
			<div class="comment-reply pull-right">
				<?php comment_reply_link(array_merge($args, array('depth' => $depth, 'max_depth' => $args['max_depth']))) ?>
			</div>
         <div class="clearfix"></div>
	
	<?php } ?>
		<div class="clear"></div>
	</div>
<?php
}

// Don't add the wp-includes/js/comment-reply.js script to single post pages unless threaded comments are enabled
function theme_queue_js(){
  if (!is_admin()){
    if ( is_singular() AND comments_open() AND (get_option('thread_comments') == 1))
      wp_enqueue_script( 'comment-reply' );
  }
}

add_action('wp_print_scripts', 'theme_queue_js');

?>