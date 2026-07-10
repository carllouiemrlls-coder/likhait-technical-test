class Expense < ApplicationRecord
  belongs_to :category

  validates :description, :amount, :date, :category, presence: true
  validates :amount, numericality: { greater_than: 0 }
  validate :date_cannot_be_future

  private

  def date_cannot_be_future
    return if date.blank?

    errors.add(:date, "can't be in the future") if date > Date.current
  end
end
