require 'rexml/document'
include REXML

module REXML

  class Element

    def self.newer(ops)
      e = Element.new(ops[:name])
      if ops[:attributes] then e.add_attributes(ops[:attributes]) end
      if ops[:text] then e.add_text(ops[:text]) end
      if ops[:children] then ops[:children].each {|child| e << child } end
      return e
    end

    def self.newer_tr(ops)
      ops[:children] ||= ops[:cells].map{|cell| Element.newer_td(:text => cell)}
      return newer(:name => 'tr', :children => ops[:children])
    end

    def self.newer_td(ops)
      return newer({:name => 'td'}.merge(ops))
    end

  end

end

