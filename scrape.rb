require "rexml/document"
require 'rubygems'

include REXML  # so that we don't have to prefix everything with REXML::...


file = File.new('page.html')

xml_doc = REXML::Document.new(file)

key='html/body/table/tr[position()>3]'

XPath.each(xml_doc, key) do |node| 
XPath.each(node,'td[2]/a') do |href|
#print "hi #{href}"
printf("https://www.redhat.com/security/data/metrics/ds/#{href.attributes["href"]}\n")

  end
end
