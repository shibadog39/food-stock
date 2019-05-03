# frozen_string_literal: true

class Shop < ApplicationRecord
  attr_accessor :current_password
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # :recoverable, :rememberable, :validatable
  devise :database_authenticatable, :registerable
end
