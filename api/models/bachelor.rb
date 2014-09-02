class Bachelor < ActiveRecord::Base
  has_no_table

  column :slug, :string
  column :trimester_id, :integer

  enum slug: %w(seg ctn ele log mec gol gpa gti)

  has_many :courses

  def name
    I18n.t("models.bachelor.attributes.name.#{self.slug}")
  end

  def self.find_by_slug_and_trimester_slug(slug, trimester_slug)
    trimesters = Database.instance.trimesters

    trimester = trimesters.find { |t| t.slug == trimester_slug }
    return nil if trimester.nil?

    trimester.bachelors.find { |b| b.slug == slug }
  end
end