# encoding: utf-8
require 'test_helper'

class KanaValidatorTest < ActiveSupport::TestCase

  test "katakana and half katakana" do
    assert ! "This is not katakana".is_katakana?
    assert "コレハカタカナデス".is_katakana?
    assert !  "これはカナではありません。".is_katakana?
    assert "ｺﾚﾊﾊﾌﾃﾞｽ｡".is_half_katakana?
    assert ! "コレハカタカナデス".is_half_katakana?
  end
 
  test "hiragana" do
    assert ! "This is not ".is_hiragana?
    assert ! "ｺﾚﾊﾊﾌｶﾅﾃﾞｽ".is_hiragana?
    assert ! "ヒラガナではない。".is_hiragana?
    assert "ひらがなです".is_hiragana?
  end

  test "kanji" do
    assert ! "This contains no kanji.".is_kanji?
    assert ! "This contains some 漢字".is_kanji?
    assert ! "これは漢字だけじゃない".is_kanji?
    assert ! "コレも漢字だけじゃない".is_kanji?
    assert "文部科学省".is_kanji?
    assert "龍馬　田炉".is_kanji?
  end

  test "kana" do
    assert ! "This has no kana".is_kana?
    assert "これは漢字とひらがなとカタカナ".is_kana?
  end
end
