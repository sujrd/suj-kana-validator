# encoding: utf-8
# Skillupjapan core extensions.
#
# Author: Horacio Sanson (horacio@skillupjapan.co.jp)
#
# Resources:
#
#   http://www.rikai.com/library/kanjitables/kanji_codes.unicode.shtml

module SUJ
  module Core
    module String

      def is_katakana?
        (self =~ /^[゠-ヿ　-〿]+$/) == 0
      end

      def is_half_katakana?
        (self =~ /^[｟-ﾟ　-〿]+$/) == 0
      end

      def is_hiragana?
        (self =~ /^[ぁ-ゟ　-〿]+$/) == 0
      end

      def is_kanji?
        (self =~ /^[一-龯　-〿]+$/) == 0
      end

      def is_kana?
        (self =~ /^[゠-ヿ｟-ﾟぁ-ゟ一-龯　-〿]+$/) == 0
      end
    end
  end
end

String.send(:include, SUJ::Core::String)
