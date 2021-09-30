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
    expect(page).to have_content("Tipo de Imóvel Cadastrado!")
  end

  it 'and theres no property type available' do
    #Act => Agir (executar a funcionalidade)
    visit property_types_path
    expect(page).to have_text("Nenhum tipo de imóvel disponível")
  end

end