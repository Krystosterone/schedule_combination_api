class ConvertPdfs
  class << self
    def to_json(environment)
      pdf_paths = File.join(Padrino.root, "db/#{environment}/raw/**/*.pdf")

      trimesters = []
      Dir[pdf_paths].each do |pdf_path|
        courses = BuildCourses.from(pdf_path, %w(PRE010))

        year = Integer(dir_name_of(pdf_path, up: 3))
        category = dir_name_of(pdf_path, up: 1)
        term_slug = dir_name_of(pdf_path, up: 2)
        bachelor_slug = dir_name_of(pdf_path)

        trimester = trimesters.find { |t| t.year == year && t.category == category && t.term_slug == term_slug }
        if trimester.nil?
          trimester = Trimester.new(year: year, category: category, term_slug: term_slug)
          trimesters << trimester
        end
        trimester.bachelors << Bachelor.new(slug: bachelor_slug, courses: courses)
      end

      trimesters.each do |trimester|
        File.open(File.join(Padrino.root, "db/#{environment}/json/#{trimester.slug}.json"), 'w') do |f|
          f.write TrimesterRepresentation.new(trimester).to_json
        end
      end
    end

    private

    def dir_name_of(path, options = {})
      backwards_path = options.fetch(:up, 0).times.collect { ".." }.join("/")
      File.basename(File.expand_path(backwards_path, path), ".pdf")
    end
  end
end