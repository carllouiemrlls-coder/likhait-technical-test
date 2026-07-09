class Expense < ApplicationRecord
  belongs_to :category

  validates :description, presence: true
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :date, presence: true
  validate  :date_cannot_be_in_future

  private

  def date_cannot_be_in_future
    if date.present? && date > Date.today
      errors.add(:date, "can't be in the future")
    end
  end
end
