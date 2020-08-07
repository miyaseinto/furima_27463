require 'rails_helper'
describe Addresse do
  describe '#create' do
    it '郵便番号・都道府県・市区町村・番地・電話番号が必須である' do
      addresse = bulid(:addresse)
      expect(addresse).to be_valid
    end

    it '郵便番号が空では登録できない' do
      addresse = bulid(:addresse, postal: nil)
      addresse.valid?
      expect(addresse.errors[:postal]).to include("can't be blank")
    end

    it '都道府県が空では登録できない' do
      addresse = bulid(:addresse, prefectures: nil)
      addresse.valid?
      expect(addresse.errors[:prefectures]).to include("can't be blank")
    end

    it '市区町村が空では登録できない' do
      addresse = bulid(:addresse, area: nil)
      addresse.valid?
      expect(addresse.errors[:area]).to include("can't be blank")
    end

    it '番地が空では登録できない' do
      addresse = bulid(:addresse, address: nil)
      addresse.valid?
      expect(addresse.errors[:address]).to include("can't be blank")
    end

    it '電話番号が空では登録できない' do
      addresse = bulid(:addresse, phone: nil)
      addresse.valid?
      expect(addresse.errors[:phone]).to include("can't be blank")
    end

    it '郵便番号にハイフンがなければ登録できない' do
      addresse = build(:addresse, postal: '-')
      addresse.valid?
      expect(addresse.errors[:postal]).to include('not included[-]')
    end

    it '電話番号に11桁以内出なければ登録できない' do
      addresse = build(:addresse, phone: '00000000000')
      addresse.valid?
      expect(addresse.errors[:phone]).to include('is too short (minimum is 11 characters)')
    end

  end
end
