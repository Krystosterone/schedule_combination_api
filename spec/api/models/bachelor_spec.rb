require 'spec_helper'

describe Bachelor do
  specify { expect(subject).to have_many(:courses) }

  context "when initializing with defaults" do
    specify { expect(subject.name_slug).to be_nil }
    specify { expect(subject.trimester_id).to be_nil }
  end

  # TODO SLUG ENUM
end