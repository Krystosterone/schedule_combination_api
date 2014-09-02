# encoding: utf-8

require 'spec_helper'

describe Trimester do
  specify { expect(subject).to have_many(:bachelors) }

  context "when initializing with defaults" do
    specify { expect(subject.year).to be_nil }
    specify { expect(subject.term_slug).to be_nil }
    specify { expect(subject.category).to be_nil }
  end

  context "when initializing with some attributes" do
    subject { Trimester.new(year: 2014, term_slug: 'ete', category: 'anciens') }

    specify { expect(subject.year).to eq(2014) }
    specify { expect(subject.term_slug).to eq('ete') }
    specify { expect(subject.term).to eq('Été') }
    specify { expect(subject.category).to eq('anciens') }
    specify { expect(subject.slug).to eq("2014_ete_anciens") }
  end
end