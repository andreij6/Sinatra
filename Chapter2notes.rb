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
