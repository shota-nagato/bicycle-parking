require "rails_helper"

RSpec.describe "Home", type: :system, js: true do
  it "駐輪という文字が存在する" do
    visit root_path

    expect(page).to have_content("駐輪")
  end
end
