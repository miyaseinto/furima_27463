require 'rails_helper'
describe User do
  describe '#create' do
    it 'ニックネーム・メール・パスワード・パスワード（確認）・苗字・名前・振り仮名苗字・振り仮名名前・生年月日が存在すれば登録できる' do
      user = build(:user)
      expect(user).to be_valid
    end

    it 'ニックネームが空では登録できない' do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end

    it 'メールが空では登録できない' do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it 'パスワードが空では登録できない' do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    it 'パスワードが存在しても、確認用が空では登録できない' do
      user = build(:user, password_confirmation: '')
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    it '苗字が空では登録できない' do
      user = build(:user, family_name: nil)
      user.valid?
      expect(user.errors[:family_name]).to include("can't be blank")
    end

    it '名前が空では登録できない' do
      user = build(:user, last_name: nil)
      user.valid?
      expect(user.errors[:last_name]).to include("can't be blank")
    end

    it '苗字の振り仮名が空では登録できない' do
      user = build(:user, family_furigana: nil)
      user.valid?
      expect(user.errors[:family_furigana]).to include("can't be blank")
    end

    it '名前の振り仮名が空では登録できない' do
      user = build(:user, last_furigana: nil)
      user.valid?
      expect(user.errors[:last_furigana]).to include("can't be blank")
    end

    it '生年月日が空では登録できない' do
      user = build(:user, birthday: nil)
      user.valid?
      expect(user.errors[:birthday]).to include("can't be blank")
    end

    it '重複したメールが存在する場合登録できない' do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include('has already been taken')
    end

    it 'パスワードが６文字以上であれば登録できる' do
      user = build(:user, password: '000000', password_confirmation: '000000')
      expect(user).to be_valid
    end

    it 'パスワードが５文字以下であれば登録できない' do
      user = build(:user, password: '00000', password_confirmation: '00000')
      user.valid?
      expect(user.errors[:password]).to include('is too short (minimum is 6 characters)')
    end
  end
end
