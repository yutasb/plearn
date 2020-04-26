# frozen_string_literal: true

class ActivityMailer < ApplicationMailer
  default from: 'plearn@example.com'

  def creation_email(activity)
    @activity = activity
    mail(
      subject: 'Activity作成完了メール',
      to: 'shibamoto.yuta1229@gmail.com',
      from: 'plearn@example.com'
    )
  end
end
