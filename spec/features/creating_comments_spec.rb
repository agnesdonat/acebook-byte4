require 'rails_helper'

feature "Creating comments" do
  let!(:user) {FactoryBot.create(:user)}
  let!(:post) {FactoryBot.create(:post, user_id: user.id)}
  let!(:comment) {FactoryBot.create(:comment, post_id: post.id)}

  scenario "User wants to comment on a post"do
    sign_in_with(user)
    fill_in_comment_with(comment)
    expect(page).to have_css("div#comment-#{comment.id}", text: 'test comment')
  end

  scenario "It displays number of comments if greater than 0"do
    sign_in_with(user)
    fill_in_comment_with(comment)
    expect(page).to have_css("span#comment-count-#{post.id}", text: '2')
  end

  scenario "It displays user's first name against their comment"do
    sign_in_with(user)
    fill_in_comment_with(comment)
    expect(page).to have_css("div#comment-#{comment.id}", text: "Maria: test comment")
  end

  scenario 'user can see their profile picture on top of the post' do
    sign_in_with(user)
    fill_in_comment_with(comment)
    expect(page).to have_css("div#comment-#{comment.id}", "img[src*='avatar.jpg']")
  end


end
