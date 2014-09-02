## encoding: utf-8
#require 'spec_helper'
#
#describe SchedulingApp::Api do
#  describe 'GET /v1/trimesters' do
#    context 'when there are no trimesters' do
#      before(:each) { allow(Trimester).to receive(:all).and_return [] }
#
#      it 'should return an empty array' do
#        get "/v1/trimesters"
#
#        expect(last_response.status).to eq(200)
#        expect(JSON.parse(last_response.body)).to eq({"trimesters" => []})
#      end
#    end
#
#    context 'when there are some trimesters' do
#      before(:each) { allow(Trimester).to receive(:all).and_return [Trimester.new(name: "Été", year: 2014)] }
#
#      it 'should return a list of all trimesters with their relevant data' do
#        get "/v1/trimesters"
#
#        expect(last_response.status).to eq(200)
#        expect(JSON.parse(last_response.body)).to eq({"trimesters" => [{"name" => "Été", "year" => 2014}]})
#      end
#    end
#  end
#end