require 'bundler'
Bundler.require

ActiveRecord::Base.establish_connection(
  :adapter => 'postgresql',
  :database => 'bookmarks'
)

# GET list of all bookmarks
get '/api/bookmark' do
  Mark.all.to_json
end

# GET selected bookmarks
get '/api/bookmark/:id' do
  Mark.find(params[:id]).to_json
end

# POST new bookmark
post '/api/bookmark' do
  Mark.create(bookmark_params).to_json
end

# PATCH bookmark on the list
patch '/api/bookmark/:id' do
  @mark = Mark.find(params[:id])
  @mark.update(bookmark_params)
  @mark.to_json
end
# PATCH bookmark on the list
put '/api/bookmark/:id' do
  @mark = Mark.find(params[:id])
  @mark.update(bookmark_params)
  @mark.to_json
end

# Delete bookmark on the list
delete '/api/bookmark/:id' do
  Mark.destroy(params[:id]).to_json
end

private
def bookmark_params
  {
    :category => params[:category],
    :name => params[:name],
    :description => params[:description],
    :url => params[:url]
    }
  end
