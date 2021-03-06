class Level < ApplicationRecord
  belongs_to :cycle, inverse_of: :levels
  has_many :theme_levels, inverse_of: :level, dependent: :destroy
  has_many :classrooms, inverse_of: :level, dependent: :destroy
  has_many :groups, inverse_of: :level, dependent: :destroy
  has_many :editable_levels, inverse_of: :level, dependent: :destroy
  has_many :exercises, through: :editable_levels, source: :editable,
                       source_type: 'Exercise'
  has_many :lessons, through: :editable_levels, source: :editable,
                       source_type: 'Lesson'

  acts_as_list scope: :cycle

  validates :name, presence: true
  validates :short_name, presence: true
  validates :level_type, presence: true, inclusion: { in: %w(Primaire Collège Lycée) }
  validates :cycle, presence: true

  def self.level_types
    %w(Primaire Collège Lycée)
  end
end
