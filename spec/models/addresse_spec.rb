require 'rails_helper'
describe Addresse do
  describe '#create' do
    before do
      @addresse = bulid(:addresse)
    end
    it '郵便番号・都道府県・市区町村・番地・電話番号が必須である' do
      addresse = @addresse
      expect(addresse).to be_valid
    end

    before do
      @addresse = bulid(:addresse, postal: nil)
    end
    it '郵便番号が空では登録できない' do
      addresse = @addresse
      addresse.valid?
      expect(addresse.errors[:postal]).to include("can't be blank")
    end

    before do
      @addresse = bulid(:addresse, prefectures: nil)
    end
    it '都道府県が空では登録できない' do
      addresse = @addresse
      addresse.valid?
      expect(addresse.errors[:prefectures]).to include("can't be blank")
    end

    before do
      @addresse = bulid(:addresse, area: nil)
    end
    it '市区町村が空では登録できない' do
      @addresse = bulid(:addresse, area: nil)
      addresse.valid?
      expect(addresse.errors[:area]).to include("can't be blank")
    end

    before do
      @addresse = bulid(:addresse, address: nil)
    end
    it '番地が空では登録できない' do
      @addresse = bulid(:addresse, address: nil)
      addresse.valid?
      expect(addresse.errors[:address]).to include("can't be blank")
    end

    before do
      @addresse = bulid(:addresse, phone: nil)
    end
    it '電話番号が空では登録できない' do
      addresse = @addresse
      addresse.valid?
      expect(addresse.errors[:phone]).to include("can't be blank")
    end

    before do
      @addresse = build(:addresse, postal: '-')
    end
    it '郵便番号にハイフンがなければ登録できない' do
      addresse = @addresse
      addresse.valid?
      expect(addresse.errors[:postal]).to include('not included[-]')
    end

    before do
      @addresse = build(:addresse, phone: '00000000000')
    end
    it '電話番号に11桁以内出なければ登録できない' do
      addresse = @addresse
      addresse.valid?
      expect(addresse.errors[:phone]).to include('is too short (minimum is 11 characters)')
    end
  end
end
