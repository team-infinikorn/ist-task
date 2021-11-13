require 'rails_helper'

RSpec.describe Member, type: :model do
  let(:member) { build :member }

  context 'with validations' do
    context 'when email' do
      it { is_expected.to allow_value('email@addresse.foo').for(:email) }
      it { is_expected.not_to allow_value('wrong_email_address').for(:email).with_message('Oops! This is not a valid email') }
      it { should validate_uniqueness_of(:email).case_insensitive.with_message('Oops! This email is already taken') }
    end

    it { is_expected.to validate_presence_of(:first_name).with_message('Oops! This is a mandatory field') }
    it { is_expected.to validate_presence_of(:last_name).with_message('Oops! This is a mandatory field') }
  end

  describe '#generate_jwt' do
    let!(:jwt) { SecureRandom.hex(32) }

    before do
      member.save

      allow(JWT).to receive(:encode).and_return(jwt)
    end

    it { expect(member.generate_jwt).to eq jwt }
  end
end
