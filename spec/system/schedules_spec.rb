require 'rails_helper'

describe 'スケジュール管理機能', type: :system do
  describe 'スケジュール一覧' do
    before do
      user_a = FactoryBot.create(:user, name: 'ユーザーA', email: 'a@example.com')
      schedule_a = FactoryBot.create(:schedule, title: '最初のスケジュール', content: '内容', user: user_a)
      #schedule_plan_a = FactoryBot.create(:schedule_plan, plan: '1つめのプラン', start_time: '00:00', end_time: '12:00', schedule: schedule_a)
      #schedule_plan_b = FactoryBot.create(:schedule_plan, plan: '2つめのプラン', start_time: '12:00', end_time: '00:00', schedule: schedule_a)
    end

    context 'ユーザーAがログインしているとき' do
      before do
        visit new_user_session_path
        fill_in 'user_email', with: 'a@example.com'
        fill_in 'user_password', with: 'password'
        click_button 'ログイン'
      end

      it 'スケジュール一覧が表示される' do
        expect(page).to have_content '最初のスケジュール'
      end
    end
  end
end
