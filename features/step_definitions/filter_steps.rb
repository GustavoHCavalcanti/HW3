# features/step_definitions/filter_steps.rb
When(/^I check the following ratings: (.+)$/) do |rating_list|
  rating_list.split(/\s*,\s*/).each do |rating|
    step %Q{I check "ratings_#{rating}"}
  end
end

When(/^I uncheck the following ratings: (.+)$/) do |rating_list|
  rating_list.split(/\s*,\s*/).each do |rating|
    step %Q{I uncheck "ratings_#{rating}"}
  end
end
