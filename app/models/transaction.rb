# frozen_string_literal: true

class Transaction < ApplicationRecord
  validates :transaction_date, presence: true
  validates :amount, presence: true
end
