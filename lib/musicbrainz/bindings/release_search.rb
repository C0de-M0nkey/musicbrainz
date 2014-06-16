# encoding: UTF-8
module MusicBrainz
  module Bindings
    module ReleaseSearch
      def parse(xml)
        xml.xpath('./release-list/release').map do |xml|
          {
            id: (xml.attribute('id').value rescue nil),
            mbid: (xml.attribute('id').value rescue nil), # Old shit
            title: (xml.xpath('./title').text.gsub(/[`’]/, "'") rescue nil),
            artist: (xml.xpath('./artist').text.gsub(/[`’]/, "'") rescue nil),
            #type: (xml.attribute('type').value rescue nil),
            score: (xml.attribute('score').value.to_i rescue nil)
          } rescue nil
        end.delete_if{ |item| item.nil? }
      end

      extend self
    end
  end
end
