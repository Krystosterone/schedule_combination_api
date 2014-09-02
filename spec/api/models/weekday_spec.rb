#require 'spec_helper'
#
#describe Weekday do
#  context "when initializing with defaults" do
#    specify { expect(subject.index).to eq(0) }
#  end
#
#  context "when initializing with a valid index" do
#    subject { Weekday.new(3) }
#
#    specify { expect(subject.index).to eq(3) }
#    specify { expect(subject.to_i).to eq(3) }
#  end
#
#  describe :from do
#    context "when an invalid weekday name is used" do
#      specify { expect(Weekday.from("potato")).to be_nil }
#    end
#
#    I18n.t('weekdays').each_with_index do |weekday_name, index|
#      context "when '#{weekday_name}' is used" do
#        specify { expect(Weekday.from(weekday_name).index).to eq(index) }
#      end
#    end
#  end
#
#  describe :from_short do
#    context "when an invalid weekday name is used" do
#      specify { expect(Weekday.from_short("pot")).to be_nil }
#    end
#
#    I18n.t('weekdays').each_with_index do |weekday_name, index|
#      short_name = weekday_name[0..2]
#
#      context "when '#{short_name}' is used" do
#        specify { expect(Weekday.from_short(short_name).index).to eq(index) }
#      end
#    end
#  end
#
#  describe :== do
#    context 'when comparing two weekday of different values' do
#      specify { expect(Weekday.new(1)).to_not eq(Weekday.new(2)) }
#    end
#
#    context 'when comparing two weekday of same values' do
#      specify { expect(Weekday.new(5)).to eq(Weekday.new(5)) }
#    end
#  end
#end
