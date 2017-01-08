require "rails_helper"

RSpec.feature "Adding comments to articles" do
	before do
		@john = User.create!(email: "john@example.com", password: "password")
		@trina = User.create!(email: "trina@example.com", password: "password")		
		@article = Article.create(title: "the first article", body: "body of first article", user: @john)	
	end

	scenario "Allows a signed in user to leave a comment" do
		login_as(@john)
		visit "/"
		click_link @article.title
		fill_in "New Comment", with: "Here are my thoughts..."
		click_button "Add Comment"

		expect(page).to have_content("Comment has been created")
		expect(page).to have_content("Here are my thoughts...")
		expect(current_path).to eq(article_path(@article.comments.last.id))
	end
end