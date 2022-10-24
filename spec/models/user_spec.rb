require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録が失敗' do
    it 'nicknameが空では登録できない' do
      user = User.new(nickname: '', email: 'test@example', password: '000000', password_confirmation: '000000', last_name: '加藤', first_name: '友樹', last_name_kana: 'カトウ',first_name_kana: 'ユウキ',birth_date: '2000.4.1')
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do
      user = User.new(nickname: 'hogehoge', email: '', password: '000000', password_confirmation: '000000', last_name: '加藤', first_name: '友樹', last_name_kana: 'カトウ',first_name_kana: 'ユウキ' ,birth_date: '2000.4.1')
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
    it 'passwordが空では登録できない' do
      user = User.new(nickname: 'hogehoge', email: 'test@example', password: '', password_confirmation: '000000', last_name: '加藤', first_name: '友樹', last_name_kana: 'カトウ',first_name_kana: 'ユウキ' ,birth_date: '2000.4.1')
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")
    end
    it 'password_confirmationが空では登録できない' do
      user = User.new(nickname: 'hogehoge', email: 'test@example', password: '000000', password_confirmation: '', last_name: '加藤', first_name: '友樹', last_name_kana: 'カトウ',first_name_kana: 'ユウキ' ,birth_date: '2000.4.1')
      user.valid?
      expect(user.errors.full_messages).to include("Password confirmation can't be blank")
    end
    it 'last_nameが空では登録できない' do
      user = User.new(nickname: 'hogehoge', email: 'test@example', password: '000000', password_confirmation: '000000', last_name: '', first_name: '友樹', last_name_kana: 'カトウ',first_name_kana: 'ユウキ' ,birth_date: '2000.4.1')
      user.valid?
      expect(user.errors.full_messages).to include("Last name can't be blank")
    end
    it 'first_nameが空では登録できない' do
      user = User.new(nickname: 'hogehoge', email: 'test@example', password: '000000', password_confirmation: '000000', last_name: '加藤', first_name: '', last_name_kana: 'カトウ',first_name_kana: 'ユウキ' ,birth_date: '2000.4.1')
      user.valid?
      expect(user.errors.full_messages).to include("First name can't be blank")
    end
    it 'last_name_kanaが空では登録できない' do
      user = User.new(nickname: 'hogehoge', email: 'test@example', password: '000000', password_confirmation: '000000', last_name: '加藤', first_name: '友樹', last_name_kana: '',first_name_kana: 'ユウキ' ,birth_date: '2000.4.1')
      user.valid?
      expect(user.errors.full_messages).to include("Last name kana can't be blank")
    end
    it 'first_name_kanaが空では登録できない' do
      user = User.new(nickname: 'hogehoge', email: 'test@example', password: '000000', password_confirmation: '000000', last_name: '加藤', first_name: '友樹', last_name_kana: 'カトウ',first_name_kana: '' ,birth_date: '2000.4.1')
      user.valid?
      expect(user.errors.full_messages).to include("First name kana can't be blank")
    end
    it 'birth_dateが空では登録できない' do
      user = User.new(nickname: 'hogehoge', email: 'test@example', password: '000000', password_confirmation: '000000', last_name: '加藤', first_name: '友樹', last_name_kana: 'カトウ',first_name_kana: 'ユウキ' ,birth_date: '')
      user.valid?
      expect(user.errors.full_messages).to include("Birth date can't be blank")
    end
  end

  describe 'ユーザー新規登録が成功' do
    it 'nicknameが空では登録できない' do
      user = User.new(nickname: 'yuki', email: 'test@example', password: '000000', password_confirmation: '000000', last_name: '加藤', first_name: '友樹', last_name_kana: 'カトウ',first_name_kana: 'ユウキ',birth_date: '2000.4.1')
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do
      user = User.new(nickname: 'yuki', email: 'test@example', password: '000000', password_confirmation: '000000', last_name: '加藤', first_name: '友樹', last_name_kana: 'カトウ',first_name_kana: 'ユウキ',birth_date: '2000.4.1')
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
    it 'passwordが空では登録できない' do
      user = User.new(nickname: 'yuki', email: 'test@example', password: '000000', password_confirmation: '000000', last_name: '加藤', first_name: '友樹', last_name_kana: 'カトウ',first_name_kana: 'ユウキ',birth_date: '2000.4.1')
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")
    end
    it 'password_confirmationが空では登録できない' do
      user = User.new(nickname: 'yuki', email: 'test@example', password: '000000', password_confirmation: '000000', last_name: '加藤', first_name: '友樹', last_name_kana: 'カトウ',first_name_kana: 'ユウキ',birth_date: '2000.4.1')
      user.valid?
      expect(user.errors.full_messages).to include("Password confirmation can't be blank")
    end
    it 'last_nameが空では登録できない' do
      user = User.new(nickname: 'yuki', email: 'test@example', password: '000000', password_confirmation: '000000', last_name: '加藤', first_name: '友樹', last_name_kana: 'カトウ',first_name_kana: 'ユウキ',birth_date: '2000.4.1')
      user.valid?
      expect(user.errors.full_messages).to include("Last name can't be blank")
    end
    it 'first_nameが空では登録できない' do
      user = User.new(nickname: 'yuki', email: 'test@example', password: '000000', password_confirmation: '000000', last_name: '加藤', first_name: '友樹', last_name_kana: 'カトウ',first_name_kana: 'ユウキ',birth_date: '2000.4.1')
      user.valid?
      expect(user.errors.full_messages).to include("First name can't be blank")
    end
    it 'last_name_kanaが空では登録できない' do
      user = User.new(nickname: 'yuki', email: 'test@example', password: '000000', password_confirmation: '000000', last_name: '加藤', first_name: '友樹', last_name_kana: 'カトウ',first_name_kana: 'ユウキ',birth_date: '2000.4.1')
      user.valid?
      expect(user.errors.full_messages).to include("Last name kana can't be blank")
    end
    it 'first_name_kanaが空では登録できない' do
      user = User.new(nickname: 'yuki', email: 'test@example', password: '000000', password_confirmation: '000000', last_name: '加藤', first_name: '友樹', last_name_kana: 'カトウ',first_name_kana: 'ユウキ',birth_date: '2000.4.1')
      user.valid?
      expect(user.errors.full_messages).to include("First name kana can't be blank")
    end
    it 'birth_dateが空では登録できない' do
      user = User.new(nickname: 'yuki', email: 'test@example', password: '000000', password_confirmation: '000000', last_name: '加藤', first_name: '友樹', last_name_kana: 'カトウ',first_name_kana: 'ユウキ',birth_date: '2000.4.1')
      user.valid?
      expect(user.errors.full_messages).to include("Birth date can't be blank")
    end
  end
end