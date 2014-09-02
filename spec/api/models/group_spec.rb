require 'spec_helper'

describe Group do
  specify { expect(subject).to have_many(:periods) }
  specify { expect(subject).to belong_to(:course) }

  context "when initializing with defaults" do
    specify { expect(subject.nb).to be_nil }
    specify { expect(subject.periods).to eq([]) }
  end
end