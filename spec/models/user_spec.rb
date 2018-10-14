require 'rails_helper'

RSpec.describe User, type: :model do
  describe "User" do
    context "Userが正常に生成される" do
      it "name,email,passwordのバリデーションが通る" do
        user = build(:user)
        expect(user).to be_valid
      end
    end

    context "Userの生成がエラーになる" do
      it "nameがない" do
        user = build(:user, name: nil)
        user.valid?
        expect(user.errors[:name]).to include("を入力してください")
      end

      it "nameに同じnameがすでにある" do
        user_model = create(:user, name: "aaa")
        user = build(:user, name: "aaa")
        user.valid?
        expect(user.errors[:name]).to include("はすでに存在します")
      end

      it "nameが21文字以上" do
        user = build(:user, name: "#{"a" * 21}")
        user.valid?
        expect(user.errors[:name]).to include("は20文字以内で入力してください")
      end

      it "emailがない" do
        user = build(:user, email: nil)
        user.valid?
        expect(user.errors[:email]).to include("を入力してください")
      end

      it "emailに同じemailがすでにある" do
        user_model = create(:user, email: "aaa@aaa.aaa")
        user = build(:user, email: "aaa@aaa.aaa")
        user.valid?
        expect(user.errors[:email]).to include("はすでに存在します")
      end

      it "passwordがない" do
        user = build(:user, password: nil)
        user.valid?
        expect(user.errors[:password]).to include("を入力してください")
      end

      it "passwordが6文字以下" do
        user = build(:user, password: "aaa")
        user.valid?
        expect(user.errors[:password]).to include("は6文字以上で入力してください")
      end
    end
  end
end
