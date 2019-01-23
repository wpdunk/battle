def sign_in_and_play
  visit('/')
  fill_in :player_1_name, with: 'TOASTER'
  fill_in :player_2_name, with: 'WALL-E'
  click_button 'Submit'
end
