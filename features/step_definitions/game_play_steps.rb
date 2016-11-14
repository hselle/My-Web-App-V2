#Verifying that elements of the game play page exists


Given /I am on the game_play page/ do
    page.should have_content("Solo Round")
end

When /I check the following answer: (.*)/ do |check, answer_list|
  answer_list.split(', ').each do |field|
  if check
    check("answer_#{list}")
  end
  end
end

Then /I should see: (.*)/ do |text|
  if page.respond_to? :should
    page.should have_content("2/8")
  else
    assert page.has_content?(text)
  end
end

When /I check the following answers: (.*) (.*)/ do |check1, check2, answer_list|
    answer_list.split(', ').each do |field|
    if check1 && check2
        check("answer_#{list}")
    end
end

Then /I should not see: (.*)/ do |text|
   if page.respond_to? :should
    page.should have_no_content("2/8")
  else
    assert page.has_no_content?(text)
  end
end