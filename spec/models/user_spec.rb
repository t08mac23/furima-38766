require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nicknameとemail、passwordとpassword_confirmation、氏名(漢字)とフリガナ、生年月日が存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it '名字がひらがなでも登録できる' do
        @user.family_name = "たなか"
        expect(@user).to be_valid
      end
      it '名字がカタカナでも登録できる' do
        @user.family_name = "タナカ"
        expect(@user).to be_valid
      end
      it '名前がひらがなでも登録できる' do
        @user.family_name = "けん"
        expect(@user).to be_valid
      end
      it '名前がカタカナでも登録できる' do
        @user.family_name = "ケン"
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
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
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '12345a'
        @user.password_confirmation = '123456a'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = 'a0000'
        @user.password_confirmation = 'a0000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが129文字以上では登録できない' do
        @user.password = Faker::Internet.password(min_length: 129)
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too long (maximum is 128 characters)")
      end
      it 'passwordに全角文字があると登録できない' do
        @user.password = 'qwert1あ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end
      it 'passwordが半角英字のみだと登録できない' do
        @user.password = 'qwertyuiop'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end
      it 'passwordが半角数字のみだと登録できない' do
        @user.password = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end
      it 'お名前(全角)は、名字が空では登録できない' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end
      it 'お名前(全角)は、名字が半角英字では登録できない' do
        @user.family_name = 'Tanaka'
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name is invalid")
      end
      it 'お名前(全角)は、名字が数字では登録できない' do
        @user.family_name = '1234５６'
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name is invalid")
      end
      it 'お名前(全角)は、名前が空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'お名前(全角)は、名前が半角英字では登録できない' do
        @user.first_name = 'Ken'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
      it 'お名前(全角)は、名前が数字では登録できない' do
        @user.first_name = '12３４５'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
      it 'フリガナは、名字が空では登録できない' do
        @user.family_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana can't be blank")
      end
      it 'フリガナは、名字が漢字では登録できない' do
        @user.family_name_kana = '田中'
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana is invalid")
      end
      it 'フリガナは、名字がひらがなでは登録できない' do
        @user.family_name_kana = 'たなか'
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana is invalid")
      end
      it 'フリガナは、名字が英字では登録できない' do
        @user.family_name_kana = 'Tanaka'
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana is invalid")
      end
      it 'フリガナは、名字が数字では登録できない' do
        @user.family_name_kana = '1234５６'
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana is invalid")
      end
      it 'フリガナは、名前が空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it 'フリガナは、名前が漢字では登録できない' do
        @user.first_name_kana = '健'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end
      it 'フリガナは、名前がひらがなでは登録できない' do
        @user.first_name_kana = 'けん'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end
      it 'フリガナは、名前が英字では登録できない' do
        @user.first_name_kana = 'Ken'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end
      it 'フリガナは、名前が数字では登録できない' do
        @user.first_name_kana = '１２345'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end
      it '生年月日が空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
