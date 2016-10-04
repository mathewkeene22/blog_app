require "rails_helper"

RSpec.feature "Editing an Article" do
	before do	
		@article = Article.create(title: "the first article", body: "body of first article")
	end

	scenario "A user updates an article" do 
		viit "/"
	
		click_link @article.title
		click_link "Edit Article"

		fill_in "Title", with: "Updated article"
		fill_in "Body", with: "Updated body of article"
	end
end
