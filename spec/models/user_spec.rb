require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do

    context '新規登録できる場合' do
      it '全入力項目が存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できない場合' do
      it 'emailが空のため登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '同じemailを入力すると登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it 'emailに@がないため登録できない' do
        @user.email = 'tanaka'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
     end
      it 'パスワードが空のため登録ができない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'パスワードが確認用パスワードと不一致のため登録できない' do
        @user.password = "123456a"
        @user.password_confirmation = "123456b"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'パスワードが5文字以下のため登録できない' do
        @user.password = "1234a"
        @user.password_confirmation = "1234a"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'パスワードが数字のみのため登録できない' do
        @user.password = "123456"
        @user.password_confirmation = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Password is invalid. Include both letters and numbers")
      end
      it 'パスワードが英字のみのため登録できない' do
        @user.password = "abcdefg"
        @user.password_confirmation = "abcdefg"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Password is invalid. Include both letters and numbers")
      end
      it 'パスワードが全角文字を含むため登録できない' do
        @user.password = "abc123あいう"
        @user.password_confirmation = "abc123あいう"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Password is invalid. Include both letters and numbers")
      end      
      it 'ニックネームが空のため登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it '名字が空のため登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it '名字が漢字・ひらがな・カタカナ以外のため登録できない' do
        @user.last_name = 'abc'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name Input full-width characters")
      end
      it '名前が空のため登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it '名前が漢字・ひらがな・カタカナ以外のため登録できない' do
        @user.first_name = 'abc'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name Input full-width characters")
      end
      it '名字の読み仮名が空のため登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it '名字の読み仮名がカタカナ以外のため登録できない' do
        @user.last_name_kana = 'たなか'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana Input full-width katakana characters")
      end
      it '名前の読み仮名が空のため登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it '名前の読み仮名がカタカナ以外のため登録できない' do
        @user.first_name_kana = 'たなか'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana Input full-width katakana characters")
      end
      it '生年月日が空のため登録ができない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
