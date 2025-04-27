class User < ApplicationRecord
  enum :role, { admin: 0, user: 2 }

  validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :name, length: { maximum: 20 }, presence: true
  validate :name_starts_with_capital

  has_many :notes
  has_many :groups

  before_create :set_default_role
  after_save :log_action

  private

  def set_default_role
    self.role ||= :user
  end

  def log_action
    Rails.logger.info "User: #{self.id} was created"
  end
  def name_starts_with_capital
    return if name.blank?

    unless name[0] =~ /[A-Z]/
      errors.add(:name, 'musí začínat velkým písmenem')
    end
  end
end
