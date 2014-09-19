class Topscephmate::V1::PracticesController < AuthenticatedController

  def index
    render json: @current_user.person.active_employee_of_practices, each_serializer: Topscephmate::V1::PracticeSerializer
  end

end
