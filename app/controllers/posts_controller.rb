class PostsController < ApplicationController
  
  def index
    
    @post_type = PostType.find_by_shortname params[ :shortname ]
    
    if params[ :interest_point_id ] != nil
      # Posts near interest point.
      @poi = InterestPoint.find params[ :interest_point_id ]
      @posts = Post.find( :all, :conditions => [ 'interest_point_id = ?, post_type_id = ?', @poi.id, @post_type.id ], :origin => [ @poi.lat, @poi.lng ], :within => 0.3, :order => 'created_at desc' )
    else
      # All posts.
      @posts = Post.find( :all, :conditions => [ 'post_type_id = ?', @post_type.id ], :order => 'created_at desc' )
    end
    
    respond_to do | format |
      format.html
      format.xml { render :index, :layout => false }
    end
    
  end  
  
  def create
  
    @post = Post.new params[ :post ]
    @post.short_headline = @post.headline[ 0..40 ]
    @post.lat = params[ :lat ]
    @post.lng = params[ :lng ]
    @post.interest_point_id = params[ :interest_point_id ]
    @post.map_layer_id = MapLayer.find_by_shortname( "events" ).id
    @post.post_type_id = params[ :post_type_id ]
    @post.author_id = current_user.id
    
    responds_to_parent do
  
      if @post.save
        flash[ :notice ] = "Post created."
        render :update do | page |
          page << "$j( '#postcontent' ).dialog( 'close' );"
          page.redirect_to interest_point_url( @post.interest_point ) 
        end
      else
        # Do nothing.
      end
  
    end
  
  end
  
  def news
    @post = Post.find params[ :id ]
    @comment = Comment.new
    render :show
  end
  
  def events
    @post = Post.find params[ :id ]
    @comment = Comment.new
    render :show
  end
  
  def promos
    @post = Post.find params[ :id ]
    @comment = Comment.new
    render :show
  end
  
  def networks
    @post = Post.find params[ :id ]
    @comment = Comment.new
    render :show
  end
  
  def stuff
    @post = Post.find params[ :id ]
    @comment = Comment.new
    render :show
  end
  
  def fixit
    @post = Post.find params[ :id ]
    @comment = Comment.new
    render :show
  end

  def all_news
    @post_type = PostType.find_by_shortname( "news" )
    @posts = Post.find :all, :conditions => [ "post_type_id = ?", @post_type.id ]
    respond_to do | format |
      format.xml { render :index, :layout => false }
    end
  end
  
  def all_events
    @post_type = PostType.find_by_shortname( "events" )
    @posts = Post.find :all, :conditions => [ "post_type_id = ?", @post_type.id ]
    respond_to do | format |
      format.xml { render :index, :layout => false }
    end
  end
  
  def all_promos
    @post_type = PostType.find_by_shortname( "promos" )
    @posts = Post.find :all, :conditions => [ "post_type_id = ?", @post_type.id ]
    respond_to do | format |
      format.xml { render :index, :layout => false }
    end
  end
  
  def all_networks
    @post_type = PostType.find_by_shortname( "network" )
    @posts = Post.find :all, :conditions => [ "post_type_id = ?", @post_type.id ]
    respond_to do | format |
      format.xml { render :index, :layout => false }
    end
  end
  
  def all_stuff
    @post_type = PostType.find_by_shortname( "stuff" )
    @posts = Post.find :all, :conditions => [ "post_type_id = ?", @post_type.id ]
    respond_to do | format |
      format.xml { render :index, :layout => false }
    end
  end
  
  def all_fixit
    @post_type = PostType.find_by_shortname( "fixit" )
    @posts = Post.find :all, :conditions => [ "post_type_id = ?", @post_type.id ]
    respond_to do | format |
      format.xml { render :index, :layout => false }
    end
  end

end