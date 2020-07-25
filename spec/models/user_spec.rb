require 'rails_helper'
describe User do
  describe '#create' do
    before do
      @user = bulid(:user)
    end
    it 'ニックネーム・メール・パスワード・パスワード（確認）・苗字・名前・振り仮名苗字・振り仮名名前・生年月日が存在すれば登録できる' do
      user = @user
      expect(user).to be_valid
    end

    before do
      @user = bulid(:user, nickname: nil)
    end
    it 'ニックネームが空では登録できない' do
      user = @user
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end

    before do
      @user = bulid(:user, email: nil)
    end
    it 'メールが空では登録できない' do
      user = @user
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    before do
      @user = bulid(:user, password: nil)
    end
    it 'パスワードが空では登録できない' do
      user = @user
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    before do
      @user = bulid(:user, password_confirmation: '')
    end
    it 'パスワードが存在しても、確認用が空では登録できない' do
      user = @user
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    before do
      @user = bulid(:user, family_name: nil)
    end
    it '苗字が空では登録できない' do
      user = @user
      user.valid?
      expect(user.errors[:family_name]).to include("can't be blank")
    end

    before do
      @user = bulid(:user, last_name: nil)
    end
    it '名前が空では登録できない' do
      user = @user
      user.valid?
      expect(user.errors[:last_name]).to include("can't be blank")
    end

    before do
      @user = bulid(:user, family_furigana: nil)
    end
    it '苗字の振り仮名が空では登録できない' do
      user = @user
      user.valid?
      expect(user.errors[:family_furigana]).to include("can't be blank")
    end

    before do
      @user = bulid(:user, last_furigana: nil)
    end
    it '名前の振り仮名が空では登録できない' do
      user = @user
      user.valid?
      expect(user.errors[:last_furigana]).to include("can't be blank")
    end

    before do
      @user = bulid(:user, birthday: nil)
    end
    it '生年月日が空では登録できない' do
      user = @user
      user.valid?
      expect(user.errors[:birthday]).to include("can't be blank")
    end

    before do
      @user = create(:user)
    end
    it '重複したメールが存在する場合登録できない' do
      user = @user
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include('has already been taken')
    end

    before do
      @user = build(:user, password: '000000', password_confirmation: '000000')
    end
    it 'パスワードが６文字以上であれば登録できる' do
      user = @user
      expect(user).to be_valid
    end

    before do
      @user = build(:user, password: '00000', password_confirmation: '00000')
    end
    it 'パスワードが５文字以下であれば登録できない' do
      user = @user
      user.valid?
      expect(user.errors[:password]).to include('is too short (minimum is 6 characters)')
    end
  end
end
