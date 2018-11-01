require 'rails_helper'

describe 'スケジュール管理機能', type: :system do
  describe 'スケジュール一覧' do
    before do
      schedule = create(:schedule, title: '最初のスケジュール', content: '内容')
      plan_a = create(:schedule_plan, start_time: '00:00', end_time: '12:00', schedule: schedule)
      plan_b = create(:schedule_plan, start_time: '12:00', end_time: '00:00', schedule: schedule)
    end

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
