require 'rails_helper'

describe 'ユーザーログイン機能', type: :system do
  let(:user_a) { create(:user, name: 'ユーザーA', email: 'a@example.com') }

  describe 'ユーザーサインアップ' do
    before do
      visit new_user_registration_path
      fill_in 'user_name', with: new_user.name
      fill_in 'user_email', with: new_user.email
      fill_in 'user_password', with: new_user.password
      fill_in 'user_password_confirmation', with: new_user.password
      click_button 'アカウント登録'
    end

    context 'サインアップが正常に行われる' do
      let(:new_user) { build(:user, name: '新規ユーザー', email: 'new@example.com', password: 'passeord') }

      it '登録完了メッセージが表示される' do
        expect(page).to have_content 'アカウント登録が完了しました。'
      end
    end

    context '名前がすでに存在している' do
      let(:new_user) { user_a }

      it 'エラーが起こる' do
        expect(page).to have_content '名前はすでに存在します'
      end
    end

    context 'メールアドレスがすでに存在している' do
      let(:new_user) { user_a }

      it 'エラーが起こる' do
        expect(page).to have_content 'メールアドレスはすでに存在します'
      end
    end

    context '名前を入力していない' do
      let(:new_user) { build(:user, name: '', email: 'new@example.com', password: 'password') }

      it 'エラーが起こる' do
        expect(page).to have_content '名前を入力してください'
      end
    end

    context 'メールアドレスを入力していない' do
      let(:new_user) { build(:user, name: '新規ユーザー', email: '', password: 'password') }

      it 'エラーが起こる' do
        expect(page).to have_content 'メールアドレスを入力してください'
      end
    end

    context 'パスワードを入力していない' do
      let(:new_user) { build(:user, name: '新規ユーザー', email: 'new@example.com', password: '') }

      it 'エラーが起こる' do
        expect(page).to have_content 'パスワードを入力してください'
      end
    end
  end

  describe 'ユーザーログイン' do
    before do
      visit new_user_session_path
      fill_in 'user_email', with: login_user.email
      fill_in 'user_password', with: login_user.password
      click_button 'ログイン'
    end

    context 'ログインが正常に行われる' do
      let(:login_user) { user_a }

      it 'ログイン成功メッセージが表示される' do
        expect(page).to have_content 'ログインしました。'
      end
    end

    context 'ログインでエラーが起こる' do
      let(:login_user) { build(:user, email: 'b@example.com', password: 'wordpass') }

      it 'エラーメッセージが表示される' do
        expect(page).to have_content 'メールアドレスまたはパスワードが違います。'
      end
    end
  end
end
