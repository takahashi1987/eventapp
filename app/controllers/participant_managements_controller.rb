class ParticipantManagementsController < ApplicationController
  def create
    participant = current_user.participant_managements.create(event_id: params[:event_id])
    # binding.pry
    redirect_to events_url, notice: "#{participant.event.user.name}さんのイベントに参加しました"
    ParticipantManagementMailer.participant_management_mail(participant).deliver
  end

  def destroy
    participant = current_user.participant_managements.find_by(event_id: params[:id]).destroy
    redirect_to events_url, notice: "#{participant.event.user.name}さんのイベントをキャンセルしました"
  end
end
