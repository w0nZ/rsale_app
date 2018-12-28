module ApplicationHelper
  def last_change
    t = Product.maximum(:updated_at)
    t.strftime("%d.%m.%Y %H:%M")
  end

  def get_hostname
    hostname = request.host
  end

  def build_share_link(path)
    link = "https://" + get_hostname + path
  end

  def build_whatsapp_link(text, path)
    require 'uri'
    msg = URI::encode(text)
    link = "whatsapp://send?text=" + msg + "%3A%20" + build_share_link(path)
  end
end
