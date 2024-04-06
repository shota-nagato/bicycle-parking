require "rails_helper"

RSpec.describe "管理者機能", type: :system do
  let!(:admin) { create(:admin) }

  describe "ログイン機能" do
    before do
      visit new_admin_session_path
    end

    context "正しいメールアドレスとパスワードを入力した場合" do
      it "ログインに成功し、管理者ページに遷移する" do
        fill_in "メールアドレス", with: "admin@example.com"
        fill_in "パスワード", with: "password"
        click_button "ログイン"
        expect(page).to have_current_path admin_root_path
        expect(page).to have_content "ログインしました"
      end
    end

    context "誤ったメールアドレスとパスワードを入力した場合" do
      it "ログインに失敗し、ページ遷移しない" do
        fill_in "メールアドレス", with: "invalid@example.com"
        fill_in "パスワード", with: "invalid password"
        click_button "ログイン"
        expect(page).to have_current_path new_admin_session_path
        expect(page).to have_content "メールアドレスまたはパスワードが違います。"
      end
    end

    context "ログインしていない状態で管理ページにアクセスした場合" do
      it "ログインページに遷移する" do
        visit admin_root_path
        expect(page).to have_current_path new_admin_session_path
        expect(page).to have_content "ログインもしくはアカウント登録してください"
      end
    end
  end

  describe "ログアウト機能" do
    context "ログインした状態でログアウトボタンを押した場合" do
      it "ログインページに遷移する" do
        sign_in admin
        visit admin_root_path
        find(".toggle-user-icon").click
        click_button "ログアウト"
        expect(page).to have_current_path new_admin_session_path
        expect(page).to have_content "ログアウトしました"
        expect(page).not_to have_button "ログアウト"
      end
    end
  end
end
