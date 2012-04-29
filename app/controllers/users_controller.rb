class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    authorize! :index, @user, :message => 'Not authorized as an administrator.'
    @users = User.paginate :page => params[:page], :order => "created_at DESC"
    @chart = create_chart
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  private
  
  def create_chart
    users_by_day = User.group("DATE(created_at)").count
    data_table = GoogleVisualr::DataTable.new
    data_table.new_column('date')
    data_table.new_column('number')
    users_by_day.each do |day|
      data_table.add_row([ Date.parse(day[0]), day[1]])
    end
    @chart = GoogleVisualr::Interactive::AnnotatedTimeLine.new(data_table)
  end

end