# Custom ActiveRecord::Base validation module.
#
# Author: Horacio Sanson (horacio@skillupjapan.co.jp)
#
# Rails Usage:
#
# In your model you may use these methods to validate if a input string is
# kanji, hiragana, katakana, half_katanana or kana.
#
#   validates_is_kanji :field_name, :allow_blank => false, :allow_nil => false
#   validates_is_hiragana :field_name
#   validates_is_katakana :field_name, :allow_blank => false
#
# Ruby Usage:
#
# This gem also add these methods to the String class:
#
#   is_kana?
#   is_kanji?
#   is_hiragana?
#   is_katakana?
#   is_half_katakana?
#
#
#
# Resources:
#   http://chrisblunt.com/2009/04/18/rails-writing-dry-custom-validators/
#   Advanced Rails Recipes

require File.join(File.dirname(File.expand_path(__FILE__)), "core_ext", "string")

module SUJ
  module Rails
    module Validations

      def validates_is_kanji(*attr_names)
        validate_japanese("kanji", *attr_names)
      end

      def validates_is_hiragana(*attr_names)
        validate_japanese("hiragana", *attr_names)
      end

      def validates_is_katakana(*attr_names)
        validate_japanese("katakana", *attr_names)
      end

      def validates_is_half_katakana(*attr_names)
        validate_japanese("half_katakana", *attr_names)
      end

      def validates_is_kana(*attr_names)
        validate_japanese("kana", *attr_names)
      end

      private

      def error_message(type)
        "must be #{type}"
      end

      def validate_japanese(type, *attr_names)
        configuration = { :allow_nil => true, :allow_blank => true, :message => error_message(type) }
        configuration.update(attr_names.extract_options!)

        validates_each(attr_names) do |record, attr_name, value|
          if value.nil?
            record.errors.add(attr_name, configuration[:message]) if ! configuration[:allow_nil]
          elsif value.empty?
            record.errors.add(attr_name, configuration[:message]) if ! configuration[:allow_blank]
          else
            record.errors.add(attr_name, configuration[:message]) if ! value.send("is_#{type}?")
          end
        end
      end

    end
  end
end

ActiveRecord::Base.extend(SUJ::Rails::Validations)
