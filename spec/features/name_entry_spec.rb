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

  scenario 'see Player 1 hit points' do
    sign_in_and_play
    expect(page).to have_content 'TOASTER HP = 100'
  end
end

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

  scenario 'be attacked by Player 2' do
    sign_in_and_play
    click_button 'Attack'
    click_button 'OK'
    click_button 'Attack'
    expect(page).to have_content 'WALL-E attacked TOASTER'
  end

  scenario 'reduce Player 1 HP by 10' do
    sign_in_and_play
    click_button 'Attack'
    click_button 'OK'
    click_button 'Attack'
    click_button 'OK'
    expect(page).not_to have_content 'TOASTER HP = 100'
    expect(page).to have_content 'TOASTER HP = 90'
  end
end
