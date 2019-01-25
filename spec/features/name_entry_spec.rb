feature 'Enter names' do
  scenario 'submitting names' do
    sign_in_and_play
    expect(page).to have_content 'TOASTER vs. WALL-E'
  end
end

feature 'View hit points' do
  scenario 'player 2 HP' do
    sign_in_and_play
    expect(page).to have_content 'WALL-E HP = 100'
  end
end

# As Player 1,
# So I can win a game of Battle,
# I want to attack Player 2, and I want to get a confirmation

feature 'Attacking' do
  scenario 'confirm player 2 attack' do
    sign_in_and_play
    click_button 'Attack!'
    expect(page).to have_content 'TOASTER attacked WALL-E'
  end

  scenario 'confirm player 2 attack' do
    sign_in_and_play
    click_button 'Attack!'
    expect(page).to have_content 'WALL-E HP = 90'
  end
end
