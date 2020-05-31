require 'rails_helper'
describe User do

  describe '#create' do

    it '有効です' do
      user = build(:user)
      user.valid?
      expect(user).to be_valid
    end

    it "メール無い場合では登録できない" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end
    it "passwordが無い場合は登録できない" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    it "passwordが存在してもpassword_confirmationがない場合は登録できない" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    it "ニックネーム無しでは登録できない" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end

    it "first_name無しでは登録できない" do
      user = build(:user, first_name: nil)
      user.valid?
      expect(user.errors[:first_name]).to include("can't be blank")
    end

    it "last_name無しでは登録できない" do
      user = build(:user, last_name: nil)
      user.valid?
      expect(user.errors[:last_name]).to include("can't be blank")
    end

    it "first_name_kana無しでは登録できない" do
      user = build(:user, first_name_kana: nil)
      user.valid?
      expect(user.errors[:first_name_kana]).to include("can't be blank")
    end

    it "last_name_kana無しでは登録できない" do
      user = build(:user, last_name_kana: nil)
      user.valid?
      expect(user.errors[:last_name_kana]).to include("can't be blank")
    end

    it "誕生日無しでは登録できない" do
      user = build(:user, birthday: nil)
      user.valid?
      expect(user.errors[:birthday]).to include("can't be blank")
    end

    it " 重複したemailが存在する場合は登録できない " do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end

    it " 電子メール形式が正しくないため登録できない " do
      user = build(:user, email: "aaa@gmail,com")
      user.valid?
      expect(user.errors[:email]).to include("is invalid")
    end

    it "小文字のメールアドレスを保存する必要があります" do
      user = create(:user, email: "AAA@gmail.com")
      expect(user.email).to eq("aaa@gmail.com")
    end

    it "パスワードは７文字以上" do
      user = build(:user, password: "aaaaaaa", password_confirmation: "aaaaaaa")
      user.valid?
      expect(user).to be_valid
    end

    it " passwordが6文字以下であれば登録できない " do
      user = build(:user, password: "000000", password_confirmation: "000000")
      user.valid?
      expect(user.errors[:password]).to include("is too short (minimum is 7 characters)")
    end

    it "first_nameの形式が正しくないため登録できない" do
      user = build(:user, first_name: "TARO")
      user.valid?
      expect(user.errors[:first_name]).to include("is invalid")
    end

    it "last_nameの形式が正しくないため登録できない" do
      user = build(:user, last_name: "TANAKA")
      user.valid?
      expect(user.errors[:last_name]).to include("is invalid")
    end

    it "first_name_kanaの形式が正しくないため登録できない" do
      user = build(:user, first_name_kana: "たろう")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("is invalid")
    end

    it "last_name_kanaの形式が正しくないため登録できない" do
      user = build(:user, last_name_kana: "たなか")
      user.valid?
      expect(user.errors[:last_name_kana]).to include("is invalid")
    end


  end
end
