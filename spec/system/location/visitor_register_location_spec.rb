require 'rails_helper'

describe 'Visitor register location' do
        it 'successfully' do
        #Arrange
        #Act
        visit root_path
        click_on "Cadastrar Região"
        fill_in 'Nome', with: 'Carapibus'
        click_on 'Enviar'
        click_on "Cadastrar Região"
        fill_in 'Nome', with: 'Bonito'
        click_on 'Enviar'
        #Assert  
        expect(page).to have_content("Carapibus")
        expect(page).to have_content("Bonito")
        expect(page).to have_content("Região Cadastrada!")

    end
end

    