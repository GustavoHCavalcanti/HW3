# features/step_definitions/sort_steps.rb
Then(/^I should see "(.*)" before "(.*)"$/) do |e1, e2|
  body = page.body
  expect(body.index(e1)).to be < body.index(e2)
end
