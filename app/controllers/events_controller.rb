class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :user_logged_in, only: [:new, :show, :edit, :update, :destroy]

  def new
    @event = Event.new
    if params[:back]
      @event = Event.new(event_params)
    else
      @event = Event.new
    end
  end

  def confirm
    @event = Event.new(event_params)
    @event.user_id = current_user.id
    render :new if @event.invalid?
  end

  def create
    @event = Event.new(event_params)
    @event.user_id = current_user.id
    if @event.save
      redirect_to new_event_path, notice: "イベントを作成しました！"
    else
      render "new"
    end
  end

  def index
    @events = Event.page(params[:page]).per(3)
  end

  def show
    @participant_management = current_user.participant_managements.find_by(event_id: @event.id)
  end

  def edit
  end

  def update
    if @event.update(event_params)
      redirect_to event_path, notice: "イベントを編集しました"
    else
      render "edit"
    end
  end

  def destroy
    @event.destroy
    redirect_to events_path, notice:"イベントを削除しました"
  end

  private
   def event_params
     params.require(:event).permit(:title, :date, :place, :content)
   end

   def set_event
     @event = Event.find(params[:id])
   end

   def user_logged_in
     unless logged_in?
       redirect_to new_session_path
     end
   end
end
