class BaseModel < ActiveRecord::Base

  self.abstract_class = true

  default_scope { order('created_at') }

  before_create :create_uuid_for_id #:create_person_for_user, :reset_authentication_token

  #after_create :associate_user_with_practice

  #after_initialize :instantiate_associated_person

  def create_uuid_for_id
    if self.id.nil?
      self.id = SecureRandom.uuid
      #self.id = SecureRandom.uuid.gsub('-','').upcase
    end
  end

  def self.encrypt(plaintext)
    SCrypt::Password.create(plaintext, :key_len => 512, :salt_size => 32)
  end

  def self.plaintext_is_cyphertext?(plaintext, cyphertext)
    SCrypt::Password.new(cyphertext).is_password? plaintext
  end

  def self.is_a_valid_uuid?(uuid)
    uuid =~ /^[a-f0-9]{8}-[a-f0-9]{4}-4[a-f0-9]{3}-[a-f0-9]{4}-[a-f0-9]{12}$/ ? true : false
  end

end
