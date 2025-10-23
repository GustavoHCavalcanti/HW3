# features/step_definitions/movie_steps.rb
Given(/^the following movies exist:$/) do |table|
  table.hashes.each { |attrs| Movie.create!(attrs) }
end

Then(/^I should see all of the movies$/) do
  rows = page.all('table#movies tbody tr').count
  expect(rows).to eq(Movie.count)
end

Then(/^I should not see any movies$/) do
  rows = page.all('table#movies tbody tr').count
  expect(rows).to eq(0)
end
