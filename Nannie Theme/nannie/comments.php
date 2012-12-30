<?php
 
// Do not delete these lines
if (!empty($_SERVER['SCRIPT_FILENAME']) && 'comments.php' == basename($_SERVER['SCRIPT_FILENAME']))
die ('Please do not load this page directly. Thanks!');
 
if ( post_password_required() ) { ?>
<p class="nocomments">This post is password protected. Enter the password to view comments.</p>
<?php
return;
}
?>
 
<!-- You can start editing here. -->
 
<?php if ( have_comments() ) : ?>
<div class="comments well">
<h3><span class="comment-heading">Comments - </span><?php comments_number('No Responses', 'One Response', '% Responses' );?></h3>
 
<!-- <div class="navigation">
<div class="alignleft"><?php previous_comments_link() ?></div>
<div class="alignright"><?php next_comments_link() ?></div>
</div> -->
 
<ul class="media-list">
<?php wp_list_comments('callback=ashok_comment'); ?>
</ul>
 
</div>

<div class="navigation">
<div class="pull-left"><?php previous_comments_link() ?></div>
<div class="pull-right"><?php next_comments_link() ?></div>
</div>

<div class="clearfix"></div>

<?php else : // this is displayed if there are no comments so far ?>
 
<?php if ('open' == $post->comment_status) : ?>
<!-- If comments are open, but there are no comments. -->
 
<?php else : // comments are closed ?>
<div class="comments well">
<!-- If comments are closed. -->
<p class="nocomments">Comments are closed.</p>
</div>
 
<?php endif; ?>
<?php endif; ?>
 
<?php if ('open' == $post->comment_status) : ?>
 
<div id="respond" class="respond well">
 
<h3><span><?php comment_form_title( 'Leave a Reply', 'Leave a Reply to %s' ); ?></span></h3>
 
<div class="cancel-comment-reply">
<?php cancel_comment_reply_link('Cancel Reply'); ?>
</div>

<div class="clearfix"></div>
 
<?php if ( get_option('comment_registration') && !$user_ID ) : ?>
<p>You must be <a href="<?php echo get_option('siteurl'); ?>/wp-login.php?redirect_to=<?php echo urlencode(get_permalink()); ?>">logged in</a> to post a comment.</p>
<?php else : ?>

<form action="<?php echo get_option('siteurl'); ?>/wp-comments-post.php" method="post" id="commentform" class="form-horizontal">
 
<?php if ( $user_ID ) : ?>
 
<p>Logged in as <a href="<?php echo get_option('siteurl'); ?>/wp-admin/profile.php"><?php echo $user_identity; ?></a>. <a href="<?php echo wp_logout_url(get_permalink()); ?>" title="Log out of this account">Log out &raquo;</a></p>
 
<?php else : ?>

      <div class="control-group">
         <label class="control-label" for="author">Name</label>
         <div class="controls">
            <input type="text" class="input-large" name="author" id="author" value="<?php echo $comment_author; ?>" <?php if ($req) echo "required"; ?>>
         </div>
      </div>  

      <div class="control-group">
         <label class="control-label" for="email">Email</label>
         <div class="controls">
            <input type="text" class="input-large" name="email" id="email" value="<?php echo $comment_author_email; ?>" <?php if ($req) echo "required"; ?>>
         </div>
      </div>

      <div class="control-group">
         <label class="control-label" for="url">Website</label>
         <div class="controls">
            <input type="text" class="input-large" name="url" id="url" value="<?php echo $comment_author_url; ?>" >
         </div>
      </div> 
	
<?php endif; ?>
 
<!--<p><small><strong>XHTML:</strong> You can use these tags: <code><?php echo allowed_tags(); ?></code></small></p>-->
 
      <div class="control-group">
         <label class="control-label" for="comment">Comment</label>
         <div class="controls">
            <textarea class="input-xlarge" name="comment" id="comment" rows="3"></textarea>
         </div>
      </div> 

      <div class="form-actions">
         <input name="submit" type="submit" id="comment-submit" tabindex="5" value="Comment" class="btn" />
         <button type="reset" class="btn">Reset</button>
      </div>
 
<p>
<?php comment_id_fields(); ?>
</p>
<?php do_action('comment_form', $post->ID); ?>

<div class="clear"></div>
</form>
 
<?php endif; // If registration required and not logged in ?>
</div>
 
<?php endif; // if you delete this the sky will fall on your head ?>