require 'rails_helper'

describe User, type: :model do
  describe 'Validations' do
    describe 'email' do
      context 'on a new user' do
        let(:user_params) do
          {
            password: 'password',
            password_confirmation: 'password'
          }
        end

        it 'should not be valid without an email' do
          user = User.new(user_params.merge(email: nil))
          expect(user).to_not be_valid
        end

        it 'should not be valid when not properly formatted' do
          user = User.new(user_params.merge(email: 'no_at.com'))
          expect(user).to_not be_valid
        end

        it 'should not be valid when not properly formatted' do
          user = User.new(user_params.merge(email: 'no@dotcom'))
          expect(user).to_not be_valid
        end
      end

      context 'on an existing user' do
        let(:user) do
          u = User.create(
            email: 'test@example.com',
            password: 'password',
            password_confirmation: 'password'
          )
          User.find(u.id)
        end

        it 'should be valid with no changes' do
          expect(user).to be_valid
        end

        it 'should not be valid when blank' do
          user.email = ''
          expect(user).to_not be_valid
        end
      end
    end

    describe 'password' do
      context 'on a new user' do
        let(:user_params) do
          {
            email: 'test@example.com'
          }
        end

        it 'should not be valid without a password' do
          user = User.new(user_params.merge(password: nil, password_confirmation: nil))
          expect(user).to_not be_valid
        end

        it 'should be not be valid with a short password' do
          user = User.new(user_params.merge(password: 'short', password_confirmation: 'short'))
          expect(user).to_not be_valid
        end

        it 'should not be valid with a confirmation mismatch' do
          user = User.new(user_params.merge(password: 'short', password_confirmation: 'long'))
          expect(user).to_not be_valid
        end
      end

      context 'on an existing user' do
        let(:user) do
          u = User.create(
            email: 'test@example.com',
            password: 'password',
            password_confirmation: 'password'
          )
          User.find(u.id)
        end

        it 'should be valid with no changes' do
          expect(user).to be_valid
        end

        it 'should not be valid with an empty password' do
          user.password = user.password_confirmation = ''
          expect(user).to be_valid
        end

        it 'should be valid with a new (valid) password' do
          user.password = user.password_confirmation = 'new password'
          expect(user).to be_valid
        end
      end
    end
  end
end
