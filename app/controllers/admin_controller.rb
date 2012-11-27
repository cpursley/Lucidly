class AdminController < ApplicationController
  before_filter :authenticate_user!
  before_filter :is_admin

def index
  @num_state0 = Dream.where(:state => '0').count
  @num_state1 = Dream.where(:state => '1').count
  @num_state2 = Dream.where(:state => '2').count
  @num_state3 = Dream.where(:state => '3').count
  @num_state4 = Dream.where(:state => '4').count
  @num_published = @num_state3 + @num_state4
  
  @num_users = User.all.count
  @num_users_active30days = User.where('last_sign_in_at > ?', 30.days.ago).count
  @num_users_created30days = User.where('created_at > ?', 30.days.ago).count
end

def dreams
  if params[:state]    
    @state = params[:state]
    # invalid parameter? show submitted dreams
    if !['0', '1', '2', '3', '4'].index(@state)
      @state = '1'
    end
  else
    # no parameter? show submitted dreams
    @state = '1'
  end  

  # different sort order for different states; verbose the state for the view
  case @state
    when '0' then @state_name = 'private'; @order = 'updated_at desc'
    when '1' then @state_name = 'submitted'; @order = 'updated_at desc'
    when '2' then @state_name = 'rejected'; @order = 'updated_at desc'
    when '3' then @state_name = 'accepted'; @order = 'accepted desc'
    when '4' then @state_name = 'featured'; @order = 'accepted desc'
  end
  
  @dreams = Dream.where(:state => @state).order(@order)      
end

# accept an dream as normal or featured dream
def accept
  @dream = Dream.find(params[:id])

  # only submitted dreams can be accepted
  if @dream.state == 1
    @dream.state = 3
    flash[:notice] = 'The dream has been accepted.'
    
    if params[:value]
      if params[:value] == '1'
        @dream.state = 4
        flash[:notice] = 'The dream has been accepted as a featured dream.'
      end  
    end  

    # freeeeezing!
    @dream.freezebody = [@dream.title, @dream.teaser, @dream.body, @dream.version, @dream.changelog].compact.join("\n\n")
    @dream.accepted = Time.now 

    # save dream
    if !@dream.save
      flash[:notice] = 'There was an error while accepting the dream.'
    end
  else
    flash[:notice] = 'Only submitted dreams can be published.'
  end

  redirect_to :action => 'dreams', :state => 1
end

# display form to enter reject message
def editreject
   @dream = Dream.find(params[:id])
   # only submitted dreams can be rejected
   if @dream.state != 1
     flash[:notice] = 'Only submitted dreams can be rejected.'
     redirect_to :action => 'dreams', :state => 1 
   end
end

# reject the dream (updates the dream)
def reject
  @dream = Dream.find(params[:id])

  if @dream.state == 1
    if params[:dream][:message]
      @dream.state = 2
      @dream.message = params[:dream][:message] 
      @dream.freezebody = [@dream.title, @dream.teaser, @dream.body, @dream.version, @dream.changelog].compact.join("\n\n")
  
      if @dream.save
        flash[:notice] = "The artile was rejected."
        redirect_to :action => 'dreams', :state => 1
      else
        render :action => "editreject"
      end  
    else
      flash[:notice] = "No reject without reject message."
      redirect_to :action => 'dreams', :state => 1
    end
  else
    flash[:notice] = "Only submitted dreams can be rejected."
    redirect_to :action => 'dreams', :state => 1
  end  
end

  protected
    def is_admin
      if current_user
        if current_user.id == 1
          return 1
        end
      end
      redirect_to root_url
    end
end
