feature 'Enter names' do
  scenario 'submitting names' do
    sign_in_and_play
    expect(page).to have_content 'TOASTER vs. WALL-E'
  end
end

feature 'View hit points' do
  scenario 'player 2 HP' do
    sign_in_and_play
    expect(page).to have_content 'Player 2 HP = 100'
  end
end
