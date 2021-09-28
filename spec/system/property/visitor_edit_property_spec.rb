require 'rails_helper'


describe 'Visitor edit property' do 
    it 'successufully' do 
        #Arrange
        rio = PropertyLocation.create!(name: 'Rio de Janeiro')
        manaus = PropertyLocation.create!(name: 'Manaus')
        casa = PropertyType.create!(name: 'Casa')
        apartamento = PropertyType.create!(name: 'Apartamento')
        property = Property.create!({ title: 'Casa com quintal em Copacabana', 
        description: 'Excelente casa, recém reformada com 2 vagas de garagem',
        rooms: 3, parking_slot: true, bathrooms: 2, pets: true, daily_rate: 500, 
        property_type: casa, property_location: rio
        })

        #Act
        visit root_path
        click_on 'Casa com quintal em Copacabana'
        click_on "Editar Imóvel"
        fill_in 'Título', with: 'Cobertura em Manaus'
        fill_in 'Descrição', with: 'Cobertura de 300m2, churrasqueira e sauna privativa'
        fill_in 'Quartos', with: '5'
        fill_in 'Banheiros', with: '6'
        fill_in 'Diária', with: 800
        select 'Apartamento', from: 'Tipo'
        select 'Manaus', from: 'Região'
        check 'Aceita Pets'
        check 'Vaga de Estacionamento'
        click_on 'Editar'
        
        #Assert
        expect(page).to have_content('Cobertura em Manaus')
        expect(page).to have_content('Cobertura de 300m2, churrasqueira e sauna privativa')
        expect(page).to have_content("Quartos: 5")
        expect(page).to have_content("Banheiros: 6")
        expect(page).to have_text("Tipo: Apartamento")
        expect(page).to have_text("Região: Manaus")
        expect(page).to have_content("Aceita Pets: Sim")
        expect(page).to have_content("Estacionamento: Sim")
        expect(page).to have_content("Diária: R$ 800,00")
        expect(page).to have_content("Imóvel Editado!")
        expect(page).not_to have_content('Casa com quintal em Copacabana')
        expect(page).not_to have_content('Excelente casa, recém reformada com 2 vagas de garagem')
        expect(page).not_to have_content('Quartos: 3')
        expect(page).not_to have_content('Banheiros:2')
        expect(page).not_to have_content('Diária: R$ 500,00')
        expect(page).not_to have_text("Tipo: Casa")
        expect(page).not_to have_text("Região: Rio de Janeiro")

 
    end
    
    it 'and must fill all fields' do
    #Arrange
        rio = PropertyLocation.create!(name: 'Rio de Janeiro')
        casa = PropertyType.create!(name: 'Casa')
        apartamento = PropertyType.create!(name: 'Apartamento')
        property = Property.create!({ title: 'Casa com quintal em Copacabana', 
        description: 'Excelente casa, recém reformada com 2 vagas de garagem',
        rooms: 3, parking_slot: true, bathrooms: 2, pets: true, daily_rate: 500, 
        property_type: casa, property_location: rio
    })
    #Act
        visit root_path
        click_on 'Casa com quintal em Copacabana'
        click_on 'Editar'
    #Assert
    #TODO PROBLEMA NA MENSAGEM
#        expect(page).to have_content('Não foi possível editar.') 
    end

end
    