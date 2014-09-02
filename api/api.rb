module SchedulingApp
  class Api < Grape::API
    version 'v1'
    format :json
    content_type :json, "application/json;charset=UTF-8"

    resource :trimesters do
      get do
        trimesters = Trimester.all
        present trimesters, with: TrimesterRessource
      end
    end

    resource :courses do
      params do
        requires :trimester_slug, type: String
        requires :bachelor_slug, type: String
      end
      get do
        bachelor = Bachelor.find_by_slug_and_trimester_slug(params[:bachelor_slug], params[:trimester_slug])
        error!(I18n.t('ressources.courses.invalid_params', bachelor_slug: params[:bachelor_slug], trimester_slug: params[:trimester_slug]), 404) if bachelor.nil?

        present bachelor.courses, with: CourseRessource
      end
    end
  end
end