module Nesta
  module Plugin
    module Wordpress
      module Helpers
        #Rewite all requests for /wp-content/ to /attachments/wp-content
        before '/wp-content/*' do
          request.path_info = "/attachments" + path_info
        end
        
        get '/feed/' do
           redirect '/articles.xml', 301
        end
        
        get '/feed/' do
           redirect '/articles.xml', 301
        end
        
        get '/comments/feed/' do
          if short_name = Nesta::Config.disqus_short_name
            redirect "#{short_name}.disqus.com/latest.rss", 301
          end
        end
        
        get '/:id/:article/feed/' do
          #TODO, look up article and redirect to intensedebate feed
        end
        
      end
    end
  end

  class App
    helpers Nesta::Plugin::Wordpress::Helpers
  end
end
