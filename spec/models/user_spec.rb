require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it 'nicknameとemail,passwordとpassword_confirmation,family_nameとfist_name,family_name_kanaとfist_name_kana,birthdateが存在すれば登録できる' do
      expect(@user).to be_valid
    end

    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordが6文字以上であれば登録できること' do
      binding.pry
      @user.password = '123abc'
      @user.password_confirmation = '123abc'
      expect(@user).to be_valid
    end

    it 'passwordが５文字以下であれば登録できない' do
      @user.password = '123ab'
      @user.password_confirmation = '123ab'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'passwordは2回入力しないと登録できない' do
      @user.password = '123abc'
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password = '123abc'
      @user.password_confirmation = '123abd'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it '重複したemailが存在する場合登録できない' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

    it 'emailは@が含まれていないと登録できない' do
      @user.email = 'test'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end

    it '名字が空では登録できない' do
      @user.family_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name can't be blank")
    end

    it '名前が空では登録できない' do
      @user.fist_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Fist name can't be blank")
    end

    it 'フリガナ名字が空では登録できない' do
      @user.family_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana can't be blank")
    end

    it 'フリガナ名前が空では登録できない' do
      @user.fist_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Fist name kana can't be blank")
    end

    it '誕生日が空だと登録できない' do
      @user.birthdate = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthdate can't be blank")
    end

    it 'passwordは半角英数字混合じゃないと登録できない' do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end

    it '名字が半角だと登録できない' do
      @user.family_name = 'ﾀﾅｶ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Family name is invalid')
    end

    it '名前が半角だと登録できない' do
      @user.fist_name = 'ﾀﾛｳ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Fist name is invalid')
    end

    it 'フリガナ名字が半角だと登録できない' do
      @user.family_name_kana = 'ﾀﾅｶ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Family name kana is invalid')
    end

    it 'フリガナ名前が半角だと登録できない' do
      @user.fist_name_kana = 'ﾀﾛｳ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Fist name kana is invalid')
    end
  end
end
