require 'rails_helper'

RSpec.describe Card, type: :model do
  describe Card do
    describe '#pay' do
      it '有効です' do
        user = create(:user)
        card = build(:card, user_id: user.id)
        card.valid?
        expect(card).to be_valid
      end

      it 'customer_idがない場合は無効' do
        user = create(:user)
        card = build(:card, user_id: user.id, customer_id: "")
        card.valid?
        expect(card.errors[:customer_id]).to include("can't be blank")
      end

      it 'card_idがない場合は無効' do
        user = create(:user)
        card = build(:card, user_id: user.id, card_id: "")
        card.valid?
        expect(card.errors[:card_id]).to include("can't be blank")
      end
    end
  end
end
