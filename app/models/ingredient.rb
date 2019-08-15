class Ingredient < ApplicationRecord
  has_many :doses
  validates :name, uniqueness: :true, presence: :true
  # before_destroy :check_for_doses

  # private

  # def check_for_doses
  #   if doses.any?
  #     errors.add_to_base("cannot delete ingredient while cocktails exist")
  #     return false
  #   end
  # end
end
