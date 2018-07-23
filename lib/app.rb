# require 'bundler'
# Bundler.require
# # appelé dans le fichier config.ru

require 'gossip'


class GossipProjectApp < Sinatra::Base
# Nous avons créé une classe GossipProjectApp qui hérite de la classe Sinatra::Base. 
# Cette classe aura toutes les fonctionnalités que propose Sinatra, 
# ce qui nous permet de profiter pleinement de la gem et de ses fonctionnalités
  get '/' do
 	erb :index, locals: {gossips: Gossip.all}
  end

  get '/gossips/new/' do 
    erb :new_gossip
  end


  post '/gossips/new' do
  # puts "Salut, je suis dans le serveur"
  # puts "Ceci est mon super params : #{params}"
  # puts "Trop bien ! Et ceci est ce que l'utilisateur a passé dans le champ gossip_author : #{params["gossip_author"]}"
  # puts "De la bombe, et du coup ça ça doit être ce que l'utilisateur a passé dans le champ gossip_content : #{params["gossip_content"]}"
  # puts "Ça déchire sa mémé, bon allez je m'en vais du serveur, ciao les BGs !"
  Gossip.new(params["gossip_author"], params["gossip_content"]).save

  redirect '/' #permets de rediriger l'utilisateur vers la page d'accueil après avoir poster son potin
  end


  get '/gossips/:id' do
    puts "my #{params[:id]}"
  erb :gossips, locals: {id: 10, author: 30, content: 5 }
  

  end

end
