require 'rails_helper'

describe 'Visitor view property types' do
  it 'successfully' do
    #Arrange
    PropertyType.create!(name: 'Casa')
    PropertyType.create!(name: 'Duplex')
    #Act
    visit root_path
    click_on 'Ver tipos de imóvel.'
    #Assert
    expect(page).to have_content('Casa')
    expect(page).to have_content('Duplex')
  end
  
  it 'and theres no property type available' do
    #Act => Agir (executar a funcionalidade)
    visit property_types_path
    #Assert
    expect(page).to have_text("Nenhum tipo de imóvel disponível")
  end
end