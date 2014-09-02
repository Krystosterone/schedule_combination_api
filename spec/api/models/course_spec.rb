require 'spec_helper'

describe Course do
  specify { expect(subject).to have_many(:groups) }

  context "when initializing with defaults" do
    specify { expect(subject.name).to be_nil }
    specify { expect(subject.groups).to eq([]) }
    specify { expect(subject.bachelor_id).to be_nil }
  end
end