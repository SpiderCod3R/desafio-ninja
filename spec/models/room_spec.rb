require 'rails_helper'

RSpec.describe Room, type: :model do
  
  before :all do
    @enterprise = create(:enterprise)
  end

  context '#create' do
    it 'Uma Sala deve pertencer a uma empresa' do
      @room = Room.new(enterprise: @enterprise)
      expect(@room.enterprise).not_to be_nil
    end

    it 'Uma Empresa pode criar uma ou mais salas' do
      4.times do create(:room, enterprise: @enterprise) end
      expect(@enterprise.rooms.count).to be(4)
    end

    it 'Uma Empresa pode definir o nome da sala' do
      sala = create(:room, name: "Sala A", enterprise: @enterprise)
      expect(sala.name).to_not be_nil
    end

    it 'Uma Empresa não pode possuir mais salas do que o informado' do
      4.times do create(:room, enterprise: @enterprise); end
      @enterprise.rooms << build(:room)
      expect(@enterprise).to_not be_valid  
    end

    it 'Uma Sala deve exibir mensagem de Erro ao Ultrapassar o limite informado pela Empresa' do
      enterprise2 = create(:enterprise)
      4.times do create(:room, enterprise: enterprise2); end
      @extra_room= Room.create(name: "Extra Room", enterprise: enterprise2)
      expect(@extra_room.errors.messages[:name][0].to_s).to eq("Limite maximo de salas alcançado para esta empresa") 
    end
  end
end
