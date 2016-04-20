class Api::V1::UserSerializer < Api::V1::BaseSerializer
  attributes :id, :email, :first_name,  :last_name, :role, :created_at, :updated_at

  has_many :posts
  has_many :comments

  def created_at
    object.created_at.in_time_zone.iso8601 if object.created_at
  end

  def updated_at
    object.updated_at.in_time_zone.iso8601 if object.created_at
  end
end
