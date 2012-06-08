class User < ActiveRecord::Base
  validates_is_kanji :name_kana
  validates_is_hiragana :name_hiragana
  validates_is_katakana :name_halfkana
end
