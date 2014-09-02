require 'spec_helper'

describe Period do
  specify { expect(subject).to belong_to(:group) }

  context "when initializing with defaults" do
    specify { expect(subject.weekday_index).to be_nil }
    specify { expect(subject.type).to be_nil }
    specify { expect(subject.start_time).to be_nil }
    specify { expect(subject.end_time).to be_nil }
    specify { expect(subject.group_id).to be_nil }
  end

  context "when passing in some attributes" do
    subject { Period.new(weekday_index: 2, type: "Cours", start_time: 600, end_time: 800) }

    specify { expect(subject.type).to eq("Cours") }

    specify { expect(subject.weekday_index).to eq(2) }
    specify { expect(subject.start_time).to eq(600) }
    specify { expect(subject.end_time).to eq(800) }
  end
end