require './lib/convert_pdfs'

namespace :convert_pdfs do
  desc 'Convert PDFs of courses to a json file'
  task :to_json => :environment do
    ConvertPdfs.to_json(RACK_ENV)
  end
end