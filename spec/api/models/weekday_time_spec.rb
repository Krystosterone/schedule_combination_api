#require 'spec_helper'
#
#describe WeekdayTime do
#  context "when initializing with defaults" do
#    specify { expect(subject.hour).to eq(0) }
#    specify { expect(subject.minutes).to eq(0) }
#    specify { expect(subject.to_i).to eq(0) }
#    specify { expect(subject.to_s).to eq("00h00") }
#  end
#
#  context "when initializing at 14:55" do
#    subject { WeekdayTime.new(14, 55) }
#
#    specify { expect(subject.hour).to eq(14) }
#    specify { expect(subject.minutes).to eq(55) }
#    specify { expect(subject.to_i).to eq(895) }
#    specify { expect(subject.to_s).to eq("14h55") }
#  end
#
#  describe :from_s do
#    context 'when an invalid time is passed' do
#      specify { expect(WeekdayTime.from_s("potato")).to be_nil }
#    end
#
#    context 'when a valid time is passed' do
#      specify { expect(WeekdayTime.from_s("09h05").to_s).to eq("09h05") }
#    end
#  end
#
#  describe :from_i do
#    context 'when a valid time is passed' do
#      specify { expect(WeekdayTime.from_i(599).to_s).to eq("09h59") }
#    end
#  end
#
#  describe :== do
#    context 'when times of different value are compared' do
#      specify { expect(WeekdayTime.new(5, 30)).to_not eq(WeekdayTime.new(21, 10)) }
#    end
#
#    context 'when times of same values are compared' do
#      specify { expect(WeekdayTime.new(5, 30)).to eq(WeekdayTime.new(5, 30)) }
#    end
#  end
#end
