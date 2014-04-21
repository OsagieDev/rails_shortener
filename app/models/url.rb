class Url < ActiveRecord::Base
  validates_format_of :long_url, :with => URI::regexp(%w(http https))

 def self.generate_short_url
    (0...8).map { (65 + rand(26)).chr }.join
  end

  def set_short_url
    self.short_url = Url.generate_short_url
  end

  def update_click_count
    self.click_count += 1
    self.save
  end
end
