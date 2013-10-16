#Chapter 2 Fundatmentals

#Routing

routes      = 'the primary way that users interact with your application'

#Hypertext Transfer Protocol
#The HTTP specification is a network protocol that makes up the backbone of communication on the Internet between clients and servers
#When a client wants to interact with a webserver over HTTP, it composes a message

http          = 'Hypertext Transfer Protocol' 
start_line    = 'the first line in the request'
headers       = 'provide additional information about the request'
message_body  = 'the message body is the last item in the HTTP message and it can contain any binary or text data'

#Verbs
#this defines the type of request being made and therfore how the server will interpret it
#Commonly Used Verbs
cuv = ['GET','POST','PUT','DELETE','PATCH']

#Common Route definition
=begin  The common form of route definition

  
   get '/'  do
     "Triggered via GET"
   end
   
   post '/' do
     "Triggered via POST"
   end
   
   put '/' do
     "Triggered via PUT"
   end
   
   delete '/' do
     "Triggered via DELETE"
   end
   
   patch '/' do
     "Triggered via PATCH"
   end
   
   options '/' do 
     "Triggered via OPTIONS"
   end 
=end

#Many URLs Similar Behaviors
=begin URLs sharing a handler
  
  ['/one','/two','/three'].each do |route|
    get route do
      "Triggered #{route} via GET"
    end
    
    post route do
      "Triggered #{route} via GET"
    end
    
    put route do
      "Triggered #{route} via GET"
    end
    
    delete route do
      "Triggered #{route} via GET"
    end
    
    patch route do
      "Triggered #{route} via GET"
    end
=end

#Routes with Parameters
=begin
  
  Accessing parameters in the request
  
  get '/:name' do
    "Hello, #{params[:name]}!"
  end 
  
  Data payloads are stored in the usual array
  
  post '/login' do
    username  = params[:username]
    password  = params[:password]
  end
  
  put '/users/:id' do
    #lets assume we could retrieve a User
    u = User.find(params[:id])
    u.first_name = params[:first_name]
    u.last_name = params[:last_name] 
    u.save
  end
  
=end

#Routes with Query String Parameters

    get '/:name' do 
    #assumes a URL in the form /some_name?foo=XYZ
    "You asked for #{params[:name]} as well as #{params[:foo]}"
  end

# Routes with Wildcards
    # "splat (*)"
    get '/*' do
      "You passed in #{params[:splat]}"
    end
    
    #--- browsing to http://localhost:4567/foo/bar the output on the screen will be "You passed in ["foo/bar"]"
  
# The First Sufficient Match Wins
    get '/*' do
      "NOM NOM NOM"
    end
    
    get '/specific' do
      "You'll never, ever see me"
    end
    
   #--- browsing to http://localhost:4567/specific should return NOM NOM NOM----
 
  
#Routes with Regular Expressions
    
    get %r{/(sp|gr)eedy} do
      "You got caught in the greedy route"
    end
    
    get '/speedy' do
      "No one calls me :("
    end
    
    get '/greedy' do 
      "No one calls me either!"
    end

#Halting a Request

    get '/halt' do
      'You will not see this output.'
      halt 500
   end
   
   #----  A status code 500 Internal Server Error was returned and the text we entered was not delivered to the client
   
#Passing a Request

      before do
        content_type :txt
      end
      
      get %r{/(sp|gr)eedy} do
        pass if request.path=~ /\/speedy/
        "You got caught in the greedy route!"      
      end
      
      get '/speedy' do 
        "You must have passed to me!"
      end
      
      #---  Now if a user requests "/speedy" she will reach the regular expression-based route handler first, then be passed along to the later handler
    
#Redirecting a Request

  get '/redirect' do 
    redirect 'http://google.com'
  end
  
  get '/redirect2' do
    redirect 'http://www.google.com', 301
  end
    
    
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  



























