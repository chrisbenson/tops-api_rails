class License < BaseModel
  belongs_to :practice
  belongs_to :system

  validates :practice_id, :system_id, :presence => true

  scope :active, -> { where("expires_at > ?", Time.zone.now) }

  def tokens_available?
    LicenseToken.where(license: self).count < self.max_tokens ? true : false
  end

end
