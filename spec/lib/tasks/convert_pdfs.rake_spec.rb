require 'spec_helper'

describe "convert_pdfs:to_json" do
  include_context "rake"

  %w(development test staging production).each do |environment|
    context "when in the '#{environment}' environment" do
      before(:each) { stub_const 'RACK_ENV', environment }

      it "should convert pdfs to json with the specified environment" do
        expect(ConvertPdfs).to receive(:to_json).with(environment)
        subject.invoke
      end
    end
  end
end