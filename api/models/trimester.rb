# encoding: utf-8

class Trimester < ActiveRecord::Base
  has_no_table

  column :year, :integer
  column :term_slug, :string
  column :category, :string

  enum term_slug: %w(ete automne hiver)
  enum category: %w(anciens nouveaux)

  has_many :bachelors

  def term
    I18n.t("models.trimester.attributes.term.#{self.term_slug}")
  end

  def slug
    "#{self.year}_#{self.term_slug}_#{self.category}"
  end

  def self.all
    Database.instance.trimesters
  end
end