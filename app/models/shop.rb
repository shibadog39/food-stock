# frozen_string_literal: true

class Shop < ApplicationRecord
  attr_accessor :current_password
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # :recoverable, :rememberable, :validatable
  has_many :suppliers
  has_many :items
  has_many :order_stocks, through: :items, source: :order_stocks
  has_many :proper_stocks
  has_many :actual_stocks, through: :items, source: :actual_stocks

  validates :name, :email, presence: true

  devise :database_authenticatable, :registerable
end
