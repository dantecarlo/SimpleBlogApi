# frozen_string_literal: true

class Types::UserInputType < GraphQL::Schema::InputObject
  graphql_name 'UserInputType'
  description 'All the attributes for creating an User'

  argument :first_name, String, required: false, camelize: false
  argument :last_name, String, required: false, camelize: false
  argument :street, String, required: false
  argument :number, Int, required: false
  argument :city, String, required: false
  argument :postcode, Int, required: false
  argument :country, String, required: false
end

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
    (%i[street number postcode country].map do |a|
      object.send(a)&.strip
    end.compact - ['']).join(', ')
  end

  filed :errors, [Types::ErrorType], null: true

  def errors
    object.errors.map { |e| { field_name: e, errors: object.errors[e] } }
  end
end
