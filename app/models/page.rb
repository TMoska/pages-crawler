class Page < ApplicationRecord
  has_many :links
  has_many :headers

  def create_heads_and_links(page_data, page_id)
    for lvl in 1..3
      headers = page_data.css("html h#{lvl}").map{|head| {page_id: page_id, level: lvl, text: head.text}}
      Header.create(headers)
    end
    links = page_data.css("html a").map{|link| {page_id: page_id, text: link.text}}
    Link.create(links)
  end

  def update_heads_and_links(page_data, page_id)
    # We cannot assume header contents to be same headers
    # This accounts for having to same headers
    # Thus there is no other way as just re-parse everything
    Header.where(page_id: page_id).destroy_all
    Link.where(page_id: page_id).destroy_all
    create_heads_and_links(page_data, page_id)
  end
end
