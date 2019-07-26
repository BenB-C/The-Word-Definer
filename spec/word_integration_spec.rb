require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('create a word path', {:type => :feature}) do
  it('creates a word and then goes to the words page') do
    visit('/words')
    click_on('Add a new word')
    fill_in('word_text', :with => 'indubitably')
    click_on('ADD WORD')
    expect(page).to have_content('indubitably')
  end
end

describe('see the definitions for a word', {:type => :feature}) do
  it('goes to the definitions page when a word is clicked') do
    visit('/words')
    click_on('indubitably')
    expect(page).to have_content('There are currently no definitions for indubitably')
  end
end

describe('add a definition for a word', {:type => :feature}) do
  it('creates a new definition') do
    visit('/words')
    click_on('indubitably')
    click_on('Add a new definition')
    fill_in('definition_text', :with => 'without doubt')
    click_on('ADD DEFINITION')
    expect(page).to have_content('without doubt')
  end
end

describe('edit a definition for a word', {:type => :feature}) do
  it('allows a definition to be edited') do
    visit('/words')
    click_on('indubitably')
    click_on('without doubt')
    fill_in('definition_text', :with => 'in a manner that leaves no possibility of doubt')
    click_on('SAVE CHANGES')
    expect(page).to have_content('in a manner that leaves no possibility of doubt')
  end
end

describe('delete a definition for a word', {:type => :feature}) do
  it('allows a definition to be deleted') do
    visit('/words')
    click_on('indubitably')
    click_on('in a manner that leaves no possibility of doubt')
    click_on('DELETE DEFINITION')
    expect(page).not_to have_content('in a manner that leaves no possibility of doubt')
  end
end

describe('return to definitions page from add a new definition page', {:type => :feature}) do
  it('allows a definition to be deleted') do
    visit('/words')
    click_on('indubitably')
    click_on('Add a new definition')
    click_on('Return to definitions for indubitably')
    expect(page).to have_content('There are currently no definitions for indubitably')
  end
end

describe('return to words page from add a new word page', {:type => :feature}) do
  it('goes to the words page when link is clicked') do
    visit('/words')
    click_on('Add a new word')
    click_on('Return to word list')
    expect(page).to have_content('The Word Definer')
  end
end

describe('return to words page from definition page', {:type => :feature}) do
  it('goes to the words page when link is clicked') do
    visit('/words')
    click_on('indubitably')
    click_on('Return to word list')
    expect(page).to have_content('The Word Definer')
  end
end

describe('return to words page from add a new definition page', {:type => :feature}) do
  it('allows a definition to be deleted') do
    visit('/words')
    click_on('indubitably')
    click_on('Add a new definition')
    click_on('Return to word list')
    expect(page).to have_content('The Word Definer')
  end
end
