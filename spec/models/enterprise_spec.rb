require 'rails_helper'
require 'time' 

RSpec.describe Enterprise, type: :model do

  let(:enterprise) {create(:enterprise)}


  context "#create" do
    it "Uma Empresa pode cadastrar o numero de salas" do
      expect(enterprise.rooms_number).to eq(4)
    end

    it "Uma Empresa pode definir seus horários de funcionamento" do
      expect(enterprise.opening_time.strftime("%H:%M")).to eq("09:00")
    end

    it "NÃO pode ser Cadastrado Empresa de nome igual" do
      subject { Enterprise.new(name: enterprise.name) }
      expect(subject.save).to be_falsey
    end
  end
end
