module Api
  module V1
    class ProjectsController < ApiController

      def index
        @projects = Project.all
        render json: @projects
      end

      private

        def project_params
          params.require(:project).permit(:name)
        end

    end
  end
end