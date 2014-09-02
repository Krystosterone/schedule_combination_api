class BuildCourses
  WEEKDAYS = %w(lun mar mar jeu ven sam dim)
  MINUTES_PER_HOUR = 60

  class << self
    def from(pdf_path, ignored_course_names = [])
      courses = []
      course = nil
      group = nil

      EtsScheduleParser::PdfParser.parse(pdf_path) do |parsed_line|
        if parsed_line.course? && (course.nil? || !parsed_line.course.named?(course.name))
          course = Course.new(name: parsed_line.course.name)
          next if ignore?(parsed_line.course.name, ignored_course_names)

          courses << course
        elsif !course.nil? && parsed_line.group?
          group = Group.new(nb: parsed_line.group.nb.to_i)
          group.periods << build_period_using(parsed_line.group)
          course.groups << group
        elsif !group.nil? && parsed_line.period?
          group.periods << build_period_using(parsed_line.period)
        end
      end

      courses
    end

    private

    def build_period_using(parsed_line)
      Period.new({
        weekday_index: weekday_index_of(parsed_line),
        start_time: minutes_of(parsed_line.start_time),
        end_time: minutes_of(parsed_line.end_time),
        type: type_of(parsed_line)
      })
    end

    def weekday_index_of(parsed_line)
      WEEKDAYS.index(parsed_line.weekday.downcase)
    end

    def minutes_of(time)
      hour, minutes = time.split(":")
      hour.to_i * MINUTES_PER_HOUR + minutes.to_i
    end

    def type_of(parsed_line)
      parsed_line.type.downcase == "c" ? "Cours" : parsed_line.type
    end

    def ignore?(course_name, ignored_course_names)
      ignored_course_names.any? do |ignored_course_name|
        ignored_course_name.downcase == course_name.downcase
      end
    end
  end
end