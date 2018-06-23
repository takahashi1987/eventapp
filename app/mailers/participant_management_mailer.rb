class ParticipantManagementMailer < ApplicationMailer
  def participant_management_mail(participant)
    @participant = participant
    mail to: @participant.user.email, subject: "イベントの参加受け付けを完了しました"
  end
end
