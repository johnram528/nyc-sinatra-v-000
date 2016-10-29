class LandmarksController < ApplicationController
  get '/landmarks' do
    erb :'/landmarks/index'
  end

  get '/landmarks/new' do 
    erb :'/landmarks/new'
  end

  post '/landmarks' do
    @landmark = Landmark.create(params[:landmark])
    redirect to '/landmarks'
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :'/landmarks/show'
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    erb :'/landmarks/edit'
  end

  patch '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    @landmark.update(params[:landmark])
    @landmark.save
    redirect to "/landmarks/#{@landmark.id}"
  end
end






#   it "allows you to view form edit a single landmark" do
#     @landmark = Landmark.first
#     get "/landmarks/#{@landmark.id}/edit"

#     expect(last_response.status).to eq(200)
#     expect(last_response.body).to include('<form')
#     expect(last_response.body).to include('landmark[name]')
#     expect(last_response.body).to include('landmark[year_completed]')
#     expect(last_response.body).to include(@landmark.name)    
#     expect(last_response.body).to include(@landmark.year_completed.to_s)

#   end


#   it "allows you to edit a single landmark" do
#     @landmark = Landmark.first
#     visit "/landmarks/#{@landmark.id}/edit"
#     fill_in :name, with: "BQE!!!!"
#     fill_in :year_completed, with: 9999
#     click_button "Edit Landmark"
#     @landmark = Landmark.first
#     expect(page.current_path).to eq("/landmarks/#{@landmark.id}")
#     expect(page.body).to include(@landmark.name)    

#     expect(page.body).to include(@landmark.year_completed.to_s)
#     expect(@landmark.name).to eq("BQE!!!!")

#     expect(@landmark.year_completed.to_s).to eq("9999")

#   end

#   it "creates checkboxes for all the landmarks and titles created on the Figures new page" do 
#     Landmark.create(name: 'BQE', year_completed: 1961)
#       visit "/figures/new"
#       expect(page).to have_css("input[type=\"checkbox\"]")
#       expect(page).to have_content('BQE')
#      Title.create(:name => "Mayor")
#       visit "/figures/new"
#       expect(page).to have_css("input[type=\"checkbox\"]")
#       expect(page).to have_content('Mayor')
      
#   end
# end