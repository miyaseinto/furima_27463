require 'rails_helper'
describe Item do
  describe '#create' do
    it '写真・商品名・商品説明・カテゴリー・商品状態・配送料・配送地域・配送日数・価格が存在すれば登録できる' do
      item = bulid(:item)
      expect(item).to be_valid
    end

    it '商品名が空では登録できない' do
      item = bulid(:item, name: nil)
      item.valid?
      expect(item.errors[:name]).to include("can't be blank")
    end

    it '商品説明が空では登録できない' do
      item = bulid(:item, explanation: nil)
      item.valid?
      expect(item.errors[:explanation]).to include("can't be blank")
    end

    it '商品カテゴリーが空では登録できない' do
      item = bulid(:item, detail_category: nil)
      item.valid?
      expect(item.errors[:detail_category]).to include("can't be blank")
    end

    it '商品状態が空では登録できない' do
      item = bulid(:item, detail_status: nil)
      item.valid?
      expect(item.errors[:detail_status]).to include("can't be blank")
    end

    it '配送負担が空では登録できない' do
      item = bulid(:item, delivery_burden: nil)
      item.valid?
      expect(item.errors[:delivery_burden]).to include("can't be blank")
    end

    it '配送地域が空では登録できない' do
      item = bulid(:item, delivery_area: nil)
      item.valid?
      expect(item.errors[:delivery_area]).to include("can't be blank")
    end

    it '配送日数が空では登録できない' do
      item = bulid(:item, delivery_days: nil)
      item.valid?
      expect(item.errors[:delivery_days]).to include("can't be blank")
    end

    it '価格が空では登録できない' do
      item = bulid(:item, selling_price: nil)
      item.valid?
      expect(item.errors[:selling_price]).to include("can't be blank")
    end

    it "価格が300円以下では登録できない" do
      item = build(:item, selling_price: "300")
      expect(item).to be_valid
    end

    it "価格が¥9,999,999以上では登録できない" do
      item = build(:item, selling_price: "9999999")
      expect(item).to be_valid
    end
  end
end
