require 'rails_helper'

describe 'スケジュール管理機能', type: :system do
  describe 'スケジュール一覧' do
    let(:user_a)  { create(:user) }
    let!(:schedule_a) { create(:schedule, title: '最初のスケジュール', content: '内容', user: user_a) }

    context 'ユーザーAがログインしているとき' do
      before do
        visit new_user_session_path
        fill_in 'user_email', with: 'test1@example.com'
        fill_in 'user_password', with: 'password'
        click_button 'ログイン'
      end

      it 'スケジュール一覧が表示される' do
        expect(page).to have_content '最初のスケジュール'
      end
    end
  end
end
