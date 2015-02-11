#Given /^the following articles exists$/ do |table|
#	Article.create.table.hashes
#end

Then /^the articles "(.*?)" should have body "(.*?)"$/ do |title,body|
 	Article.find_by_title(title).description should eq body
end
