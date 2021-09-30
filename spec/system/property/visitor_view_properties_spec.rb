require 'rails_helper'

describe 'Visitor visit homepage' do
  it 'and view properties' do
    #Arrange => Preparar (os dados)
    rio = PropertyLocation.create!(name: 'Rio de Janeiro')
    manaus = PropertyLocation.create!(name: 'Manaus')
    casa = PropertyType.create!(name: 'Casa')
    apartamento = PropertyType.create!(name: 'Apartamento')


    Property.create!({ title: 'Casa com quintal em Copacabana', 
                      description: 'Excelente casa, recém reformada com 2 vagas de garagem',
                      rooms: 3, parking_slot: true, bathrooms: 2, pets: true, daily_rate: 500, 
                      property_type: casa, property_location: rio,
                    })

    Property.create!({ title: 'Cobertura em Manaus', 
                      description: 'Cobertura de 300m2, churrasqueira e sauna privativa',
                      rooms: 5, parking_slot: false, bathrooms: 6, pets: false, daily_rate: 800, 
                      property_type: apartamento, property_location: manaus,
                    })

    #Act => Agir (executar a funcionalidade)
    visit root_path

    #Assert => Garantir (que algo aconteceu ou NAO aconteceu)
    # 2 imoveis -> casa em copacabana; apartamento em manaus
    expect(page).to have_text("Casa com quintal em Copacabana")
    expect(page).to have_text("Excelente casa, recém reformada com 2 vagas de garagem")
    expect(page).to have_text("Quartos: 3")
    expect(page).to have_text("Tipo: Casa")
    expect(page).to have_text("Região: Rio de Janeiro")
    expect(page).to have_text("Cobertura em Manaus")
    expect(page).to have_text("Cobertura de 300m2, churrasqueira e sauna privativa")
    expect(page).to have_text("Tipo: Apartamento")
    expect(page).to have_text("Quartos: 5")
    expect(page).to have_text("Região: Manaus")
  end

  it 'and theres no property available' do
    #Act => Agir (executar a funcionalidade)
    visit root_path
    expect(page).to have_text("Nenhum imóvel disponível")
  end

  it 'and view property details' do
    #Arrange => Preparar (os dados)
    casa = PropertyType.create!(name: 'Casa')
    rio = PropertyLocation.create!(name: 'Rio de Janeiro')
    Property.create!({ title: 'Casa com quintal em Copacabana', 
    description: 'Excelente casa, recém reformada com 2 vagas de garagem',
    rooms: 3, parking_slot: true, bathrooms: 2, pets: true, daily_rate: 500, 
    property_type: casa, property_location: rio
    })

    visit root_path
    click_on 'Casa com quintal em Copacabana'

    expect(page).to have_text("Casa com quintal em Copacabana")
    expect(page).to have_text("Excelente casa, recém reformada com 2 vagas de garagem")
    expect(page).to have_text("Quartos: 3")
    expect(page).to have_text("Banheiros: 2")
    expect(page).to have_text("Aceita Pets: Sim")
    expect(page).to have_text("Estacionamento: Sim")
    expect(page).to have_text("Diária: R$ 500")
    expect(page).to have_text("Tipo: Casa")
    expect(page).to have_text("Região: Rio de Janeiro")
  end
 
  describe 'Visitor view properties by type' do
  it 'successfully' do
    #Arrange => Preparar (os dados)
    rio = PropertyLocation.create!(name: 'Rio de Janeiro')
    manaus = PropertyLocation.create!(name: 'Manaus')
    casa = PropertyType.create!(name: 'Casa')
    apartamento = PropertyType.create!(name: 'Apartamento')
    Property.create!({ title: 'Casa com quintal em Copacabana', 
    description: 'Excelente casa, recém reformada com 2 vagas de garagem',
    rooms: 3, parking_slot: true, bathrooms: 2, pets: true, daily_rate: 500, 
    property_type: casa, property_location: rio,
     })
    Property.create!({ title: 'Cobertura em Manaus', 
    description: 'Cobertura de 300m2, churrasqueira e sauna privativa',
    rooms: 5, parking_slot: false, bathrooms: 6, pets: false, daily_rate: 800, 
    property_type: apartamento, property_location: manaus,
     })
     #Act
    visit root_path
    within '.property_types' do 
      click_on 'Casa'
    end
     #Asssert
     expect(page).to have_content('Propriedades do tipo: Casa')
     expect(page).to have_content('Casa com quintal em Copacabana')
    expect(page).to have_content('Excelente casa, recém reformada com 2 vagas de garagem')
    expect(page).not_to have_content("Cobertura em Manaus")
    expect(page).not_to have_content("Cobertura de 300m2, churrasqueira e sauna privativa")
    end
  end
end
