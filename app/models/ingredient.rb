class Ingredient < ApplicationRecord
  has_many :doses
  validates :name, uniqueness: true, presence: true

  def destroy
    raise ActiveRecord::InvalidForeignKey unless doses.count.zero?

    super
  end
end
