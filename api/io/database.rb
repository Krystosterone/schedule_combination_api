class Database
  include Singleton

  def trimesters
    @trimesters ||= load_trimesters || []
  end

  private

  def load_trimesters
    file_paths = Padrino.root("db/#{RACK_ENV}/json/**/*.json")

    Dir[file_paths].each.collect do |trimester_file|
      data = File.open(trimester_file, 'r') { |f| f.read }
      TrimesterRepresentation.new(Trimester.new).from_json(data)
    end
  end
end