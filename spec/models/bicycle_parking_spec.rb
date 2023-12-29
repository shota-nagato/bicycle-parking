require 'rails_helper'

RSpec.describe BicycleParking, type: :model do
  let!(:bicycle_parking) { create(:bicycle_parking) }

  describe "バリデーション" do
    context "自動二輪車が駐輪可能の場合" do
      before do
        bicycle_parking.motorcycle_capacity = 2
        bicycle_parking.motorcycle_price = ""
      end

      it "自動二輪車料金が必須" do
        bicycle_parking.save
        expect(bicycle_parking).not_to be_valid
      end
    end

    context "自動二輪車が駐輪不可の場合" do
      before do
        bicycle_parking.motorcycle_capacity = 0
        bicycle_parking.motorcycle_price = ""
      end

      it "自動二輪車料金は空文字を許容" do
        bicycle_parking.save
        expect(bicycle_parking).to be_valid
      end
    end
  end
end
