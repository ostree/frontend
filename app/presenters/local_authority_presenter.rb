class LocalAuthorityPresenter
  def initialize(local_authority)
    @local_authority = local_authority
  end

  PASS_THROUGH_KEYS = %i[
    name
    snac
    tier
    homepage_url
  ].freeze

  PASS_THROUGH_KEYS.each do |key|
    define_method key do
      local_authority[key.to_s]
    end
  end

  def url
    @url ||= extract_first_url
  end

private

  attr_accessor :local_authority

  def extract_first_url
    homepage_url.presence || nil
  end
end
