require 'rails_helper'

describe 'Visitor log in' do
  context 'as property owner' do
    it 'successfully' do
      property_owner = PropertyOwner.create!(email: 'jane@doe.com.br', password: '123456789')

      visit root_path
      click_on 'Entrar'
      fill_in 'Email', with: property_owner.email
      fill_in 'Senha', with: property_owner.password
      within 'form' do
        click_on 'Entrar'
      end

      expect(page).to have_content('Login efetuado com sucesso!')
      expect(page).to have_content(property_owner.email)
      expect(page).to have_link('Logout')
      expect(page).not_to have_link('Entrar')
      expect(page).to have_link('Cadastrar Imóvel')
    end

    it 'and logs out' do
      jane = PropertyOwner.create!(email: 'jane@doe.com.br', password: '123456789')

      login_as jane, scope: :property_owner 
      visit root_path #importante o visit ficar depois do login pra carregar a página com o content que estará no assert.
      click_on 'Logout'

      expect(page).to have_content('Saiu com sucesso')
      expect(page).to_not have_content(jane.email)
      expect(page).to_not have_link('Logout')
      expect(page).to have_link('Entrar')
      expect(page).to_not have_link('Cadastrar Imóvel')
    end
end

end