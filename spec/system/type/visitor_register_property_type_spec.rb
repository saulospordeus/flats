require 'rails_helper'

describe 'Visitor register property type' do
  it 'successfully' do
    #Arrange
    #Act
    visit root_path
    click_on 'Cadastrar Tipo de Imóvel'
    fill_in 'Nome', with: 'Duplex'
    click_on 'Enviar'
    visit root_path
    click_on 'Cadastrar Tipo de Imóvel'
    fill_in 'Nome', with: 'Casa'
    click_on 'Enviar'

    #Assert
    expect(page).to have_content('Tipos de imóvel')
    expect(page).to have_content('Duplex')
    expect(page).to have_content("Casa")
  end
end