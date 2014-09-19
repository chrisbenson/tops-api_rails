class Topscephmate::V1::UserAccountSerializer < ActiveModel::Serializer
  attributes :id, :password_digest, :active, :persistent_tokens
  has_one :person
end
