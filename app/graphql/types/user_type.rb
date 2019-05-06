# frozen_string_literal: true

class Types::UserType < Types::BaseObject
  description 'An User'

  field :id, ID, null: false
  field :first_name, String, null: true, camelize: false
  field :last_name, String, null: true, camelize: false
  field :street, String, null: true
  field :number, Int, null: true
  field :city, String, null: true
  field :postcode, Int, null: true
  field :country, String, null: true

  field :posts, [Types::PostType], null: true

  field :full_name, String, null: true, camelize: false

  def full_name
    [object.first_name, object.last_name].compact.join ' '
  end

  field :adress, String, null: true

  def address
    ([:street, :number, :postcode, :country].map do |a|
      object.send(a)&.strip
    end.compact - ['']).join(', ')
  end


end
